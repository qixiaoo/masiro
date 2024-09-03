import 'package:equatable/equatable.dart';
import 'package:masiro/data/model/volume.dart';

class NovelDetail extends Equatable {
  final NovelDetailHeader header;
  final List<Volume> volumes;
  final int lastReadChapterId;

  const NovelDetail({
    required this.volumes,
    required this.header,
    required this.lastReadChapterId,
  });

  NovelDetail copyWith({
    NovelDetailHeader? header,
    List<Volume>? volumes,
    int? lastReadChapterId,
  }) {
    return NovelDetail(
      header: header ?? this.header,
      volumes: volumes ?? this.volumes,
      lastReadChapterId: lastReadChapterId ?? this.lastReadChapterId,
    );
  }

  @override
  List<Object?> get props => [header, volumes, lastReadChapterId];
}

class NovelDetailHeader extends Equatable {
  final String title;
  final String author;
  final List<String> translators;
  final String status;
  final String originalBook;
  final String brief;
  final bool isFavorite;
  final String csrfToken;
  final String coverImg;

  const NovelDetailHeader({
    required this.title,
    required this.author,
    required this.translators,
    required this.status,
    required this.originalBook,
    required this.brief,
    required this.isFavorite,
    required this.csrfToken,
    required this.coverImg,
  });

  @override
  List<Object?> get props => [
        title,
        author,
        translators,
        status,
        originalBook,
        brief,
        isFavorite,
        csrfToken,
        coverImg,
      ];
}
