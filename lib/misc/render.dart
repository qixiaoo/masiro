import 'package:flutter/material.dart';
import 'package:masiro/data/repository/model/chapter_detail.dart';

int getFirstVisibleCharacterIndex(
  String text,
  TextStyle? style,
  double width,
  double topOffset,
) {
  final textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    textDirection: TextDirection.ltr,
  );
  textPainter.layout(minWidth: 20, maxWidth: width);
  final textPosition = textPainter.getPositionForOffset(Offset(0, topOffset));
  return textPosition.offset;
}

int getArticleCharacterIndex(
  List<ChapterContentElement> elements,
  int elementIndex,
  int elementCharacterIndex,
) {
  var position = 0;
  for (var i = 0; i < elementIndex; i++) {
    final e = elements[i];
    if (e is TextContent) {
      position = position + e.text.length;
    }
  }
  return position + elementCharacterIndex;
}

double getTextElementTopOffset(
  String text,
  TextStyle? style,
  double width,
  int characterIndex,
) {
  if (characterIndex <= 0) {
    return 0.0;
  }
  var invisibleText = text.substring(0, characterIndex);
  final lastCharacter = invisibleText[invisibleText.length - 1];
  if (lastCharacter == '\n') {
    invisibleText = text.substring(0, characterIndex - 1);
  }
  final textPainter = TextPainter(
    text: TextSpan(text: invisibleText, style: style),
    textDirection: TextDirection.ltr,
  );
  textPainter.layout(minWidth: 20, maxWidth: width);
  return -textPainter.height;
}
