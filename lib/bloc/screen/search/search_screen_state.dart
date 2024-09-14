import 'package:equatable/equatable.dart';
import 'package:masiro/data/repository/model/novel.dart';

sealed class SearchScreenState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchScreenLoadingState extends SearchScreenState {}

class SearchScreenErrorState extends SearchScreenState {
  final String? message;

  SearchScreenErrorState({this.message});

  @override
  List<Object?> get props => [message];
}

class SearchScreenLoadedState extends SearchScreenState {
  final String keyword;

  /// Stores the search results of novels
  final List<Novel> novels;

  /// Stores the current page number
  final int page;

  final int totalCount;

  final int totalPages;

  /// Indicates the loading status of the infinitely scrollable list of novels
  final InfiniteListStatus infiniteListStatus;

  SearchScreenLoadedState({
    this.keyword = '',
    this.novels = const [],
    this.page = 1,
    this.totalCount = 0,
    this.totalPages = 0,
    this.infiniteListStatus = InfiniteListStatus.success,
  });

  SearchScreenLoadedState copyWith({
    String? keyword,
    List<Novel>? novels,
    int? page,
    int? totalCount,
    int? totalPages,
    InfiniteListStatus? infiniteListStatus,
  }) {
    return SearchScreenLoadedState(
      keyword: keyword ?? this.keyword,
      novels: novels ?? this.novels,
      page: page ?? this.page,
      totalCount: totalCount ?? this.totalCount,
      totalPages: totalPages ?? this.totalPages,
      infiniteListStatus: infiniteListStatus ?? this.infiniteListStatus,
    );
  }

  @override
  List<Object?> get props => [
        keyword,
        novels,
        page,
        totalCount,
        totalPages,
        infiniteListStatus,
      ];
}

enum InfiniteListStatus { loading, success, failure }
