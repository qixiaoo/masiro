import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:masiro/bloc/screen/novel/novel_screen_bloc.dart';
import 'package:masiro/bloc/screen/novel/novel_screen_event.dart';
import 'package:masiro/bloc/screen/novel/novel_screen_state.dart';
import 'package:masiro/data/repository/model/novel_detail.dart';
import 'package:masiro/data/repository/model/volume.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/easy_refresh.dart';
import 'package:masiro/misc/router.dart';
import 'package:masiro/ui/screens/novel/get_chapter_from_volumes.dart';
import 'package:masiro/ui/screens/novel/novel_header.dart';
import 'package:masiro/ui/screens/novel/volume_list.dart';
import 'package:masiro/ui/widgets/error_message.dart';

bool _isFavoriteToggled = false;

class NovelScreen extends StatefulWidget {
  final int novelId;

  const NovelScreen({super.key, required this.novelId});

  @override
  State<NovelScreen> createState() => _NovelScreenState();
}

class _NovelScreenState extends State<NovelScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: BlocProvider(
          create: (context) => NovelScreenBloc(novelId: widget.novelId)
            ..add(NovelScreenRefreshed()),
          child: BlocBuilder<NovelScreenBloc, NovelScreenState>(
            builder: (context, state) {
              switch (state) {
                case NovelScreenInitialState():
                  return const Column(children: [LinearProgressIndicator()]);
                case NovelScreenErrorState():
                  return ErrorMessage(message: state.message);
                case NovelScreenLoadedState():
                  return buildLoadedScreen(context, state);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildLoadedScreen(BuildContext context, NovelScreenLoadedState state) {
    final novelDetail = state.novelDetail;
    final header = novelDetail.header;
    final volumes = novelDetail.volumes;
    final lastReadChapterId = novelDetail.lastReadChapterId;
    final isFavorite = header.isFavorite;

    return Scaffold(
      appBar: buildAppBar(context, isFavorite),
      body: buildBody(context, novelDetail),
      floatingActionButton: buildFloatingActionButton(
        volumes,
        lastReadChapterId,
        context,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, bool isFavorite) {
    final bloc = context.read<NovelScreenBloc>();
    final localizations = context.localizations();

    return AppBar(
      leading: IconButton(
        onPressed: () => context.pop(_isFavoriteToggled),
        icon: const Icon(Icons.arrow_back_rounded),
      ),
      title: Text(localizations.detail),
      actions: [
        IconButton(
          onPressed: () {
            bloc.add(
              isFavorite
                  ? NovelScreenNovelUnfavorited()
                  : NovelScreenNovelFavorited(),
            );
            _isFavoriteToggled = true;
          },
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_outline_outlined,
          ),
        ),
      ],
    );
  }

  EasyRefresh buildBody(BuildContext context, NovelDetail novelDetail) {
    final bloc = context.read<NovelScreenBloc>();
    final textTheme = context.textTheme();
    final header = novelDetail.header;
    final volumes = novelDetail.volumes;
    final lastReadChapterId = novelDetail.lastReadChapterId;

    return EasyRefresh(
      header: classicHeader(context),
      onRefresh: () async {
        bloc.add(NovelScreenRefreshed());
      },
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          NovelHeader(header: header),
          const SizedBox(height: 20),
          SelectionArea(
            child: Text(
              header.brief,
              softWrap: true,
              style: textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 20),
          VolumeList(
            volumes: volumes,
            lastReadChapterId: lastReadChapterId,
            onTap: (chapter, volume) async {
              await _readChapter(context, chapter.novelId, chapter.id);
            },
          ),
        ],
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton(
    List<Volume> volumes,
    int lastReadChapterId,
    BuildContext context,
  ) {
    final localizations = context.localizations();

    return FloatingActionButton(
      tooltip: localizations.startReading,
      child: const Icon(Icons.play_arrow_rounded),
      onPressed: () async {
        final firstChapter = volumes.firstOrNull?.chapters.firstOrNull;
        final lastReadChapter = getChapterFromVolumes(
          volumes,
          lastReadChapterId,
        );
        final chapter = lastReadChapter ?? firstChapter;
        if (chapter == null) {
          return;
        }
        await _readChapter(context, chapter.novelId, chapter.id);
      },
    );
  }

  Future<void> _readChapter(
    BuildContext context,
    int novelId,
    int chapterId,
  ) async {
    final bloc = context.read<NovelScreenBloc>();
    await context.push(
      RoutePath.reader,
      extra: {
        'novelId': novelId,
        'chapterId': chapterId,
      },
    );
    bloc.add(NovelScreenChapterRead(chapterId: chapterId));
  }
}
