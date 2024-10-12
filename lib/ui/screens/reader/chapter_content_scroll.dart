import 'package:flutter/material.dart';
import 'package:masiro/data/repository/model/chapter_detail.dart';
import 'package:masiro/data/repository/model/read_position.dart';
import 'package:masiro/misc/helper.dart';
import 'package:masiro/misc/render.dart';
import 'package:masiro/ui/widgets/cached_image.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ChapterContentScroll extends StatefulWidget {
  final ChapterContent content;
  final EdgeInsets? padding;
  final ReadPosition position;
  final void Function(ReadPosition position)? onPositionChange;

  const ChapterContentScroll({
    super.key,
    required this.content,
    this.padding,
    this.position = startPosition,
    this.onPositionChange,
  });

  @override
  State<ChapterContentScroll> createState() => _ChapterContentScrollState();
}

class _ChapterContentScrollState extends State<ChapterContentScroll> {
  late final ItemScrollController itemScrollController;
  late final ItemPositionsListener itemPositionsListener;

  late (int, double) Function() getScrollListInitialPosition;

  @override
  void initState() {
    super.initState();

    itemScrollController = ItemScrollController();

    itemPositionsListener = ItemPositionsListener.create()
      ..itemPositions.addListener(_onItemPositionsChange);

    getScrollListInitialPosition = onceFn<(int, double)>(
      () => _positionToScrollItemIndexAndAlignment(widget.position),
    );
  }

  @override
  void dispose() {
    itemPositionsListener.itemPositions.removeListener(_onItemPositionsChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final content = widget.content;
    final padding = widget.padding;
    final elements = content.elements;
    final windowSize = MediaQuery.of(context).size;

    final (initialIndex, initialAlignment) = getScrollListInitialPosition();

    return ScrollablePositionedList.builder(
      initialScrollIndex: initialIndex,
      initialAlignment: initialAlignment,
      itemScrollController: itemScrollController,
      itemPositionsListener: itemPositionsListener,
      padding: padding,
      itemCount: elements.length,
      itemBuilder: (BuildContext context, int index) {
        final e = elements[index];
        return switch (e) {
          TextContent() => Text(e.text),
          ImageContent() => CachedImage(
              url: e.src,
              width: windowSize.width,
              height: windowSize.height,
              fit: BoxFit.contain,
            )
        };
      },
    );
  }

  (int, double) _positionToScrollItemIndexAndAlignment(ReadPosition position) {
    final size = MediaQuery.of(context).size;
    final padding = widget.padding ?? EdgeInsets.zero;
    final width = size.width - padding.left - padding.right;
    final height = size.height;
    final index = position.elementIndex;
    final element = widget.content.elements[index];

    switch (element) {
      case ImageContent():
        return (index, position.elementTopOffset / height);
      case TextContent():
        // TODO(qixiaoo): Make text style configurable
        final style = DefaultTextStyle.of(context).style;
        final topOffset = getTextElementTopOffset(
          element.text,
          style,
          width,
          position.elementCharacterIndex!,
        );
        return (index, topOffset / height);
    }
  }

  void _jumpToReadPosition(ReadPosition position) {
    final (index, alignment) = _positionToScrollItemIndexAndAlignment(position);
    itemScrollController.jumpTo(index: index, alignment: alignment);
  }

  void _onItemPositionsChange() {
    if (widget.onPositionChange == null) {
      return;
    }

    final size = MediaQuery.of(context).size;
    final padding = widget.padding ?? EdgeInsets.zero;
    final width = size.width - padding.left - padding.right;
    final height = size.height;

    // Find item with the minimum `itemLeadingEdge` value,
    // as it represents the first visible item in the scroll list.
    final firstVisibleItem = itemPositionsListener.itemPositions.value
        .reduce((a, b) => a.itemLeadingEdge < b.itemLeadingEdge ? a : b);

    final elements = widget.content.elements;
    final elementIndex = firstVisibleItem.index;
    final firstVisibleItemContent = elements[elementIndex];
    final topOffset = firstVisibleItem.itemLeadingEdge * height;

    // If the `firstVisibleItem.itemLeadingEdge` is greater than 0,
    // it indicates that the first item of `ChapterContent.elements` has not been scrolled past.
    // Therefore, we can directly notify the parent widget of the current position.
    if (firstVisibleItem.itemLeadingEdge > 0) {
      widget.onPositionChange!(startPosition);
      return;
    }

    if (firstVisibleItemContent is ImageContent) {
      widget.onPositionChange!(
        ReadPosition(
          elementIndex: elementIndex,
          elementTopOffset: topOffset,
        ),
      );
      return;
    }

    if (firstVisibleItemContent is TextContent) {
      // TODO(qixiaoo): Make text style configurable
      final style = DefaultTextStyle.of(context).style;
      final elementCharacterIndex = getFirstVisibleCharacterIndex(
        firstVisibleItemContent.text,
        style,
        width,
        topOffset.abs(),
      );
      widget.onPositionChange!(
        ReadPosition(
          elementIndex: elementIndex,
          elementTopOffset: topOffset,
          elementCharacterIndex: elementCharacterIndex,
          articleCharacterIndex: getArticleCharacterIndex(
            elements,
            elementIndex,
            elementCharacterIndex,
          ),
        ),
      );
      return;
    }
  }
}
