import 'package:equatable/equatable.dart';

class Volume extends Equatable {
  final int id;
  final String title;
  final List<Chapter> chapters;

  const Volume({
    required this.id,
    required this.title,
    required this.chapters,
  });

  @override
  List<Object?> get props => [id, title, chapters];
}

class Chapter extends Equatable {
  final int id;
  final int novelId;
  final int volumeId;
  final String title;
  final int limitLv;
  final int cost;
  final DateTime createdTime;
  final DateTime updatedTime;

  const Chapter({
    required this.id,
    required this.novelId,
    required this.volumeId,
    required this.title,
    required this.limitLv,
    required this.cost,
    required this.createdTime,
    required this.updatedTime,
  });

  @override
  List<Object?> get props => [
        id,
        novelId,
        volumeId,
        title,
        limitLv,
        cost,
        createdTime.millisecondsSinceEpoch,
        updatedTime.millisecondsSinceEpoch,
      ];
}
