import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masiro/bloc/screen/reader/reader_screen_bloc.dart';
import 'package:masiro/bloc/screen/reader/reader_screen_event.dart';
import 'package:masiro/bloc/screen/reader/reader_screen_state.dart';
import 'package:masiro/misc/platform.dart';
import 'package:masiro/ui/screens/reader/chapter_content_scroll.dart';
import 'package:masiro/ui/screens/reader/top_bar.dart';
import 'package:masiro/ui/widgets/error_message.dart';

class ReaderScreen extends StatefulWidget {
  final int novelId;
  final int chapterId;

  const ReaderScreen({
    super.key,
    required this.novelId,
    required this.chapterId,
  });

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => ReaderScreenBloc(
          novelId: widget.novelId,
          chapterId: widget.chapterId,
        )..add(ReaderScreenChapterDetailRequested()),
        child: BlocBuilder<ReaderScreenBloc, ReaderScreenState>(
          builder: (context, state) {
            switch (state) {
              case ReaderScreenInitialState():
                return const Column(children: [LinearProgressIndicator()]);
              case ReaderScreenErrorState():
                return ErrorMessage(message: state.message);
              case ReaderScreenLoadedState():
                return buildBody(context, state);
            }
          },
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context, ReaderScreenLoadedState state) {
    final chapterDetail = state.chapterDetail;
    final isTopBarVisible = state.isTopBarVisible;
    return Stack(
      children: [
        buildReaderContent(context, state),
        TopBar(
          title: chapterDetail.title,
          isVisible: isTopBarVisible,
        ),
      ],
    );
  }

  Widget buildReaderContent(
    BuildContext context,
    ReaderScreenLoadedState state,
  ) {
    final bloc = context.read<ReaderScreenBloc>();
    final chapterDetail = state.chapterDetail;

    final scrollReader = ChapterContentScroll(
      content: chapterDetail.content,
      padding: isDesktop
          ? const EdgeInsets.symmetric(
              horizontal: 120,
              vertical: kToolbarHeight * 2,
            )
          : const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: kToolbarHeight * 2,
            ),
      position: state.progress.toDouble(),
      onPositionChange: (position) =>
          bloc.add(ReaderScreenProgressChanged(progress: position.toInt())),
    );

    return isDesktop
        ? Listener(
            onPointerDown: (event) => toggleTopBar(context),
            child: scrollReader,
          )
        : GestureDetector(
            onTap: () => toggleTopBar(context),
            child: scrollReader,
          );
  }

  void toggleTopBar(BuildContext context) {
    context.read<ReaderScreenBloc>().add(ReaderScreenTopBarToggled());
  }
}
