import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:masiro/bloc/screen/reader/reader_screen_bloc.dart';
import 'package:masiro/bloc/screen/reader/reader_screen_event.dart';
import 'package:masiro/bloc/screen/reader/reader_screen_state.dart';
import 'package:masiro/misc/chapter.dart';
import 'package:masiro/misc/platform.dart';
import 'package:masiro/ui/screens/reader/bottom_bar.dart';
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
  int? _lastReadChapterIdForPopResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) {
              return;
            }
            _backToPrevScreen(context);
          },
          child: BlocProvider(
            create: (_) => ReaderScreenBloc(novelId: widget.novelId)
              ..add(
                ReaderScreenChapterDetailRequested(chapterId: widget.chapterId),
              ),
            child: BlocBuilder<ReaderScreenBloc, ReaderScreenState>(
              builder: (context, state) {
                switch (state) {
                  case ReaderScreenInitialState():
                    return const Column(children: [LinearProgressIndicator()]);
                  case ReaderScreenErrorState():
                    return ErrorMessage(message: state.message);
                  case ReaderScreenLoadedState():
                    return buildLoadedScreen(context, state);
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoadedScreen(
    BuildContext context,
    ReaderScreenLoadedState state,
  ) {
    final bloc = context.read<ReaderScreenBloc>();
    final chapterDetail = state.chapterDetail;
    final isHudVisible = state.isHudVisible;

    final volumes = chapterDetail.volumes;
    final chapterId = chapterDetail.chapterId;
    final nextChapter = getNextChapter(volumes, chapterId);
    final prevChapter = getPreviousChapter(volumes, chapterId);

    return Stack(
      children: [
        buildReaderContent(context, state),
        TopBar(
          title: chapterDetail.title,
          isVisible: isHudVisible,
          onNavigateBack: () => _backToPrevScreen(context),
        ),
        BottomBar(
          isVisible: isHudVisible,
          prevChapterId: prevChapter?.id,
          nextChapterId: nextChapter?.id,
          onNavigateTo: (chapterId) {
            _lastReadChapterIdForPopResult = chapterId;
            bloc.add(ReaderScreenChapterNavigated(chapterId: chapterId));
          },
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
    final loadingStatus = state.loadingStatus;

    if (loadingStatus.isLoading()) {
      return const Center(
        child: SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(),
        ),
      );
    }

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
            onPointerDown: (event) => _toggleHud(context),
            child: scrollReader,
          )
        : GestureDetector(
            onTap: () => _toggleHud(context),
            child: scrollReader,
          );
  }

  void _toggleHud(BuildContext context) {
    context.read<ReaderScreenBloc>().add(ReaderScreenHudToggled());
  }

  void _backToPrevScreen(BuildContext context) {
    context.pop(_lastReadChapterIdForPopResult);
  }
}
