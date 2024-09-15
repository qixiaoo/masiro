import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:masiro/bloc/screen/search/search_screen_bloc.dart';
import 'package:masiro/bloc/screen/search/search_screen_event.dart';
import 'package:masiro/bloc/screen/search/search_screen_state.dart';
import 'package:masiro/data/repository/model/novel.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/platform.dart';
import 'package:masiro/misc/router.dart';
import 'package:masiro/ui/widgets/message.dart';
import 'package:masiro/ui/widgets/novel_card.dart';

class NovelList extends StatefulWidget {
  final List<Novel> novels;
  final InfiniteListStatus status;
  final int totalCount;

  const NovelList({
    super.key,
    required this.novels,
    required this.status,
    required this.totalCount,
  });

  @override
  State<NovelList> createState() => _NovelListState();
}

class _NovelListState extends State<NovelList> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();
    final novels = widget.novels;
    final status = widget.status;

    if (novels.isEmpty) {
      return Message(message: localizations.noContentMessage);
    }

    final infiniteList = GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(10),
      itemCount: novels.length,
      gridDelegate: isDesktop
          ? const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 600,
              mainAxisExtent: 150,
            )
          : const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: double.infinity,
              mainAxisExtent: 120,
            ),
      itemBuilder: (context, index) {
        final n = novels[index];
        return NovelCard(
          title: n.title,
          coverImg: n.coverImg,
          author: n.author,
          lastUpdated: n.lastUpdated,
          brief: n.brief,
          lvLimit: n.lvLimit,
          onTap: () => context.push(RoutePath.novel, extra: {'novelId': n.id}),
        );
      },
    );

    return Stack(
      children: [
        infiniteList,
        if (status == InfiniteListStatus.loading)
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(children: [LinearProgressIndicator()]),
          ),
      ],
    );
  }

  void _onScroll() {
    if (!_isBottom) {
      return;
    }
    context.read<SearchScreenBloc>().add(SearchScreenBottomReached());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll - 5.0);
  }
}
