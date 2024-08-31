import 'package:flutter/material.dart';
import 'package:masiro/data/model/chapter_detail.dart';
import 'package:masiro/ui/widgets/cover.dart';

class ChapterContentScroll extends StatelessWidget {
  final ChapterContent content;
  final EdgeInsetsGeometry? padding;

  const ChapterContentScroll({
    super.key,
    required this.content,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final elements = content.elements;
    final windowSize = MediaQuery.of(context).size;

    return ListView.builder(
      padding: padding,
      itemCount: elements.length,
      itemBuilder: (BuildContext context, int index) {
        final e = elements[index];
        switch (e) {
          case TextContent():
            return Text(e.text);
          case ImageContent():
            return Cover(
              url: e.src,
              width: windowSize.width,
              height: windowSize.height,
              fit: BoxFit.contain,
            );
        }
      },
    );
  }
}
