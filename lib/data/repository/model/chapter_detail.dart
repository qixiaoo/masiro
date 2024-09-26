import 'package:equatable/equatable.dart';
import 'package:masiro/data/repository/model/volume.dart';

class ChapterDetail extends Equatable {
  final int chapterId;
  final String title;
  final ChapterContent content;
  final String textContent;
  final List<Volume> volumes;
  final String csrfToken;

  const ChapterDetail({
    required this.chapterId,
    required this.title,
    required this.content,
    required this.textContent,
    required this.csrfToken,
    required this.volumes,
  });

  @override
  List<Object?> get props => [
        chapterId,
        title,
        content,
        textContent,
        volumes,
        csrfToken,
      ];
}

class ChapterContent extends Equatable {
  final List<ChapterContentElement> elements;

  const ChapterContent({required this.elements});

  @override
  List<Object?> get props => [elements];
}

sealed class ChapterContentElement extends Equatable {}

class TextContent extends ChapterContentElement {
  final String text;

  TextContent({required this.text});

  TextContent copyWith({String? text}) {
    return TextContent(text: text ?? this.text);
  }

  @override
  List<Object?> get props => [text];
}

class ImageContent extends ChapterContentElement {
  final String src;

  ImageContent({required this.src});

  @override
  List<Object?> get props => [src];
}
