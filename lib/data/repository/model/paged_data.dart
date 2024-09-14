import 'package:equatable/equatable.dart';

class PagedData<T> extends Equatable {
  final List<T> data;
  final int page;
  final int totalCount;
  final int totalPages;

  const PagedData({
    required this.data,
    required this.page,
    required this.totalCount,
    required this.totalPages,
  });

  @override
  List<Object?> get props => [data, page, totalCount, totalPages];
}
