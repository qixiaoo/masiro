import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:masiro/bloc/screen/favorites/favorites_screen_bloc.dart';
import 'package:masiro/bloc/screen/favorites/favorites_screen_event.dart';
import 'package:masiro/bloc/screen/favorites/favorites_screen_state.dart';
import 'package:masiro/data/model/novel.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/platform.dart';
import 'package:masiro/misc/router.dart';
import 'package:masiro/ui/widgets/error_message.dart';
import 'package:masiro/ui/widgets/message.dart';
import 'package:masiro/ui/widgets/novel_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late final EasyRefreshController _easyRefreshController;

  @override
  void initState() {
    super.initState();
    _easyRefreshController = EasyRefreshController();
  }

  @override
  void dispose() {
    _easyRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoritesScreenBloc()..add(FavoritesScreenRefreshed()),
      child: BlocBuilder<FavoritesScreenBloc, FavoritesScreenState>(
        builder: (context, state) {
          switch (state) {
            case FavoritesScreenInitialState():
              return const Column(children: [LinearProgressIndicator()]);
            case FavoritesScreenErrorState():
              return ErrorMessage(message: state.message);
            case FavoritesScreenLoadedState():
              return buildBody(context, state);
          }
        },
      ),
    );
  }

  Widget buildBody(BuildContext context, FavoritesScreenLoadedState state) {
    final localizations = context.localizations();
    final novels = state.novels;
    return SafeArea(
      child: EasyRefresh(
        controller: _easyRefreshController,
        onRefresh: () {
          context.read<FavoritesScreenBloc>().add(FavoritesScreenRefreshed());
        },
        child: novels.isNotEmpty
            ? GridView.builder(
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
                    onTap: () => _navigateToNovelDetailScreen(context, n),
                  );
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
      ),
    );
  }

  Future<void> _navigateToNovelDetailScreen(
    BuildContext context,
    Novel n,
  ) async {
    final bool? needRefresh = await context.push(
      RoutePath.novel,
      extra: {'novelId': n.id},
    );
    if (needRefresh == null || needRefresh == false) {
      return;
    }
    await _easyRefreshController.callRefresh();
  }
}
