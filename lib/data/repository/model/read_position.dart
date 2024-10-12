import 'package:equatable/equatable.dart';

const startPosition = ReadPosition(
  elementIndex: 0,
  elementTopOffset: 0,
  elementCharacterIndex: 0,
  articleCharacterIndex: 0,
);

class ReadPosition extends Equatable {
  final int elementIndex;
  final double elementTopOffset;
  final int? elementCharacterIndex;
  final int? articleCharacterIndex;

  const ReadPosition({
    required this.elementIndex,
    required this.elementTopOffset,
    this.elementCharacterIndex,
    this.articleCharacterIndex,
  });

  bool isTextPosition() {
    return elementCharacterIndex != null && articleCharacterIndex != null;
  }

  @override
  List<Object?> get props => [
        elementIndex,
        elementTopOffset,
        elementCharacterIndex,
        articleCharacterIndex,
      ];
}
