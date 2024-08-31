import 'package:equatable/equatable.dart';
import 'package:masiro/data/model/volume.dart';

class NovelDetail extends Equatable {
  final NovelDetailHeader header;
  final List<Volume> volumes;

  const NovelDetail({
    required this.volumes,
    required this.header,
  });

  @override
  List<Object?> get props => [header, volumes];
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
