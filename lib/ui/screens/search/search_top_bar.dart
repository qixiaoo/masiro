import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masiro/bloc/screen/search/search_screen_bloc.dart';
import 'package:masiro/bloc/screen/search/search_screen_event.dart';

const searchBarHeight = 72.0;

class SearchTopBar extends StatefulWidget {
  const SearchTopBar({super.key});

  @override
  State<SearchTopBar> createState() => _SearchTopBarState();
}

class _SearchTopBarState extends State<SearchTopBar> {
  late final FocusNode _searchBarFocusNode;
  late final SearchController _searchController;

  @override
  void initState() {
    super.initState();
    _searchBarFocusNode = FocusNode(debugLabel: 'Search Bar');
    _searchController = SearchController();
  }

  @override
  void dispose() {
    _searchBarFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SearchScreenBloc>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchAnchor(
        searchController: _searchController,
        viewOnSubmitted: (keyword) {
          bloc.add(SearchScreenSearched(keyword: keyword));
          _searchController.closeView(keyword);
          _searchBarFocusNode.unfocus();
        },
        builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0),
            ),
            focusNode: _searchBarFocusNode,
            controller: controller,
            leading: const Icon(Icons.search),
            trailing: const [
              // TODO(qixiao): Implement functionality to allow user to set filter options
              IconButton(
                icon: Icon(Icons.filter_list_rounded),
                onPressed: null,
              ),
            ],
            onTap: () => controller.openView(),
          );
        },
        suggestionsBuilder: (context, controller) {
          // Don't display any suggestions for now.
          return List.empty(growable: false);
        },
      ),
    );
  }
}
