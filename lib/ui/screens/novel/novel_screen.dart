import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:masiro/bloc/screen/novel/novel_screen_bloc.dart';
import 'package:masiro/bloc/screen/novel/novel_screen_event.dart';
import 'package:masiro/bloc/screen/novel/novel_screen_state.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/router.dart';
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
                return buildBody(context, state);
            }
          },
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context, NovelScreenLoadedState state) {
    final bloc = context.read<NovelScreenBloc>();
    final textTheme = context.textTheme();
    final localizations = context.localizations();
    final novelDetail = state.novelDetail;
    final header = novelDetail.header;
    final volumes = novelDetail.volumes;
    final lastReadChapterId = novelDetail.lastReadChapterId;
    final isFavorite = header.isFavorite;

    return Column(
      children: [
        AppBar(
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
        ),
        Expanded(
          child: EasyRefresh(
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
                    await context.push(
                      RoutePath.reader,
                      extra: {
                        'novelId': chapter.novelId,
                        'chapterId': chapter.id,
                      },
                    );
                    bloc.add(NovelScreenChapterRead(chapterId: chapter.id));
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
