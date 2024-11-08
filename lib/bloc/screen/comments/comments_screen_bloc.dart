import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masiro/bloc/screen/comments/comments_screen_event.dart';
import 'package:masiro/bloc/screen/comments/comments_screen_state.dart';
import 'package:masiro/data/repository/masiro_repository.dart';
import 'package:masiro/data/repository/model/comment.dart';
import 'package:masiro/data/repository/model/paged_data.dart';
import 'package:masiro/di/get_it.dart';

const _defaultPageSize = 10;

typedef _CommentsScreenBloc = Bloc<CommentsScreenEvent, CommentsScreenState>;

class CommentsScreenBloc extends _CommentsScreenBloc {
  final _masiroRepository = getIt<MasiroRepository>();

  final int? novelId;
  final int? chapterId;

  CommentsScreenBloc({
    this.novelId,
    this.chapterId,
  }) : super(const CommentsScreenState()) {
    on<CommentsScreenRefreshed>(_onCommentsScreenRefreshed);
    on<CommentsScreenPrevPageRequested>(_onCommentsScreenPrevPageRequested);
    on<CommentsScreenNextPageRequested>(_onCommentsScreenNextPageRequested);
  }

  Future<void> _onCommentsScreenRefreshed(
    CommentsScreenRefreshed event,
    Emitter<CommentsScreenState> emit,
  ) async {
    final pagedData = event.pagedData;
    emit(
      CommentsScreenState(
        pagedComments: [pagedData],
        page: pagedData.page,
        totalCount: pagedData.totalCount,
        totalPages: pagedData.totalPages,
      ),
    );
  }

  Future<void> _onCommentsScreenPrevPageRequested(
    CommentsScreenPrevPageRequested event,
    Emitter<CommentsScreenState> emit,
  ) async {
    final pagedData = event.pagedData;
    final pagedComments = List<PagedData<Comment>>.from(state.pagedComments);
    pagedComments.insert(0, pagedData);
    emit(
      CommentsScreenState(
        pagedComments: pagedComments,
        page: pagedData.page,
        totalCount: pagedData.totalCount,
        totalPages: pagedData.totalPages,
      ),
    );
  }

  Future<void> _onCommentsScreenNextPageRequested(
    CommentsScreenNextPageRequested event,
    Emitter<CommentsScreenState> emit,
  ) async {
    final pagedData = event.pagedData;
    final pagedComments = List<PagedData<Comment>>.from(state.pagedComments);
    pagedComments.add(pagedData);
    emit(
      CommentsScreenState(
        pagedComments: pagedComments,
        page: pagedData.page,
        totalCount: pagedData.totalCount,
        totalPages: pagedData.totalPages,
      ),
    );
  }

  Future<bool> loadPrevPage() async {
    final page = state.pagedComments.firstOrNull?.page;

    if (page == null) {
      final result = await _getPagedComment(1);
      add(CommentsScreenRefreshed(pagedData: result));
      return true;
    }

    final prevPage = page - 1;

    if (prevPage <= 0) {
      return false;
    }

    final result = await _getPagedComment(prevPage);
    add(CommentsScreenPrevPageRequested(pagedData: result));
    return result.page - 1 > 0;
  }

  Future<bool> loadNextPage() async {
    final page = state.pagedComments.lastOrNull?.page;

    if (page == null) {
      return true;
    }

    final nextPage = page + 1;
    final totalPages = state.totalPages;

    if (nextPage > totalPages) {
      return false;
    }

    final result = await _getPagedComment(nextPage);
    add(CommentsScreenNextPageRequested(pagedData: result));
    return result.page + 1 <= result.totalPages;
  }

  Future<void> jumpToPage(int page) async {
    if (page <= 0) {
      return;
    }
    final result = await _getPagedComment(page);
    add(CommentsScreenRefreshed(pagedData: result));
    return;
  }

  Future<PagedData<Comment>> _getPagedComment(int page) {
    if (novelId != null) {
      return _masiroRepository.getNovelComments(
        novelId: novelId!,
        page: page,
        pageSize: _defaultPageSize,
      );
    } else {
      return _masiroRepository.getChapterComments(
        chapterId: chapterId!,
        page: page,
        pageSize: _defaultPageSize,
      );
    }
  }
}
