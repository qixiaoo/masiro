import 'package:equatable/equatable.dart';

final class Novel extends Equatable {
  final int id;
  final String title;
  final String brief;
  final int rank;
  final String coverImg;
  final String? author;
  final String? lastUpdated;
  final String? lastUpdatedTime;
  final int lvLimit;

  const Novel({
    required this.id,
    required this.title,
    required this.brief,
    required this.rank,
    required this.coverImg,
    required this.author,
    required this.lastUpdated,
    required this.lastUpdatedTime,
    required this.lvLimit,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        brief,
        rank,
        coverImg,
        author,
        lastUpdated,
        lastUpdatedTime,
        lvLimit,
      ];
}
