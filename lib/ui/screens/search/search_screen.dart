import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masiro/bloc/screen/search/search_screen_bloc.dart';
import 'package:masiro/bloc/screen/search/search_screen_state.dart';
import 'package:masiro/ui/screens/search/novel_list.dart';
import 'package:masiro/ui/screens/search/search_top_bar.dart';
import 'package:masiro/ui/widgets/error_message.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: BlocProvider(
          create: (_) => SearchScreenBloc(),
          child: Column(
            children: [
              const SearchTopBar(),
              Expanded(child: buildBody(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocBuilder<SearchScreenBloc, SearchScreenState>(
      builder: (context, state) {
        switch (state) {
          case SearchScreenLoadingState():
            return const Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(),
              ),
            );
          case SearchScreenErrorState():
            return ErrorMessage(message: state.message);
          case SearchScreenLoadedState():
            return NovelList(
              novels: state.novels,
              status: state.infiniteListStatus,
              totalCount: state.totalCount,
            );
        }
      },
    );
  }
}
