import 'package:flutter/material.dart';
import 'package:masiro/data/repository/model/chapter_detail.dart';
import 'package:masiro/ui/widgets/cover.dart';

class ChapterContentScroll extends StatefulWidget {
  final ChapterContent content;
  final EdgeInsetsGeometry? padding;
  final double position;
  final void Function(double position)? onPositionChange;

  const ChapterContentScroll({
    super.key,
    required this.content,
    this.padding,
    this.position = 0,
    this.onPositionChange,
  });

  @override
  State<ChapterContentScroll> createState() => _ChapterContentScrollState();
}

class _ChapterContentScrollState extends State<ChapterContentScroll> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController(initialScrollOffset: widget.position)
      ..addListener(_handleControllerNotification);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final content = widget.content;
    final padding = widget.padding;
    final elements = content.elements;
    final windowSize = MediaQuery.of(context).size;

    return ListView.builder(
      controller: _controller,
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

  void _handleControllerNotification() {
    if (widget.onPositionChange == null) {
      return;
    }
    widget.onPositionChange!(_controller.offset);
  }
}
