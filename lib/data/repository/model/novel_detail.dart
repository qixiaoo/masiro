import 'package:equatable/equatable.dart';
import 'package:masiro/data/repository/model/volume.dart';

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

  NovelDetailHeader copyWith({
    String? title,
    String? author,
    List<String>? translators,
    String? status,
    String? originalBook,
    String? brief,
    bool? isFavorite,
    String? csrfToken,
    String? coverImg,
  }) {
    return NovelDetailHeader(
      title: title ?? this.title,
      author: author ?? this.author,
      translators: translators ?? this.translators,
      status: status ?? this.status,
      originalBook: originalBook ?? this.originalBook,
      brief: brief ?? this.brief,
      isFavorite: isFavorite ?? this.isFavorite,
      csrfToken: csrfToken ?? this.csrfToken,
      coverImg: coverImg ?? this.coverImg,
    );
  }

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
