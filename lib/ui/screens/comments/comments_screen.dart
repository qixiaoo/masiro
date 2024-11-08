import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:masiro/bloc/screen/comments/comments_screen_bloc.dart';
import 'package:masiro/bloc/screen/comments/comments_screen_state.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/easy_refresh.dart';
import 'package:masiro/misc/platform.dart';
import 'package:masiro/ui/screens/comments/comment_card.dart';
import 'package:masiro/ui/screens/comments/pagination_dialog.dart';
import 'package:masiro/ui/widgets/message.dart';

class CommentsScreen extends StatefulWidget {
  final int? novelId;
  final int? chapterId;

  const CommentsScreen({
    super.key,
    this.novelId,
    this.chapterId,
  });

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  late final ScrollController _scrollController;
  late final EasyRefreshController _easyRefreshController;

  int? _targetPage;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    if (isDesktop) {
      _scrollController.addListener(_onScroll);
    }
    _easyRefreshController = EasyRefreshController();
  }

  @override
  void dispose() {
    if (isDesktop) {
      _scrollController.removeListener(_onScroll);
    }
    _scrollController.dispose();
    _easyRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();

    final novelId = widget.novelId;
    final chapterId = widget.chapterId;

    final title = novelId != null
        ? localizations.novelComments
        : localizations.chapterComments;

    return BlocProvider(
      create: (_) => CommentsScreenBloc(
        novelId: novelId,
        chapterId: chapterId,
      ),
      child: BlocBuilder<CommentsScreenBloc, CommentsScreenState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back_rounded),
              ),
              title: Text(title),
              actions: [
                IconButton(
                  onPressed: () => _selectPage(state),
                  icon: const Icon(Icons.coronavirus_rounded),
                ),
              ],
            ),
            body: buildEasyRefresh(context, state),
          );
        },
      ),
    );
  }

  Widget buildEasyRefresh(
    BuildContext context,
    CommentsScreenState state,
  ) {
    final localizations = context.localizations();
    final bloc = context.read<CommentsScreenBloc>();
    final comments = state.comments;

    return EasyRefresh(
      refreshOnStart: true,
      controller: _easyRefreshController,
      header: classicHeader(context),
      footer: classicFooter(context),
      onRefresh: () async {
        if (_targetPage != null) {
          await bloc.jumpToPage(_targetPage!);
          _targetPage = null;
          return IndicatorResult.success;
        }
        final hasMore = await bloc.loadPrevPage();
        return hasMore ? IndicatorResult.success : IndicatorResult.noMore;
      },
      onLoad: () async {
        final hasMore = await bloc.loadNextPage();
        return hasMore ? IndicatorResult.success : IndicatorResult.noMore;
      },
      child: comments.isNotEmpty
          ? ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return CommentCard(comment: comment);
              },
            )
          : LayoutBuilder(
              builder: (context, constraints) => ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Message(message: localizations.noContentMessage),
                  ),
                ],
              ),
            ),
    );
  }

  void _onScroll() {
    if (!_isBottom) {
      return;
    }
    final mode = _easyRefreshController.footerState?.mode;
    if (mode != IndicatorMode.ready && mode != IndicatorMode.inactive) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _easyRefreshController.callLoad();
    });
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll - 5.0);
  }

  void _selectPage(CommentsScreenState state) {
    final currentPage = state.page;
    final totalPages = state.totalPages;

    showDialog(
      context: context,
      builder: (context) {
        return PaginationDialog(
          totalPages: totalPages,
          currentPage: currentPage,
          onPageChanged: (int page) {
            _targetPage = page;
            _easyRefreshController.callRefresh();
            context.pop();
          },
        );
      },
    );
  }
}
