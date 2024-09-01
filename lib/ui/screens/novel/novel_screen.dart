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
    final textTheme = context.textTheme();
    final localizations = context.localizations();
    final novelDetail = state.novelDetail;
    final header = novelDetail.header;
    final volumes = novelDetail.volumes;

    return Column(
      children: [
        AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_rounded),
          ),
          title: Text(localizations.detail),
        ),
        Expanded(
          child: EasyRefresh(
            onRefresh: () async {
              context.read<NovelScreenBloc>().add(NovelScreenRefreshed());
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
                  onTap: (chapter, volume) {
                    context.push(
                      RoutePath.reader,
                      extra: {
                        'novelId': chapter.novelId,
                        'chapterId': chapter.id,
                      },
                    );
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
