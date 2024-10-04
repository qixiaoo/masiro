import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

/// `AfterLayout` allows you to access the `RenderObject` of its `child`,
/// so that you can get the size of the child widget.
///
/// Source: https://book.flutterchina.club/chapter14/layout.html#_14-4-6-afterlayout
class AfterLayout extends SingleChildRenderObjectWidget {
  final ValueSetter<RenderAfterLayout> callback;

  const AfterLayout({
    super.key,
    super.child,
    required this.callback,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderAfterLayout(callback);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderAfterLayout renderObject,
  ) {
    renderObject.callback = callback;
  }
}

class RenderAfterLayout extends RenderProxyBox {
  ValueSetter<RenderAfterLayout> callback;

  RenderAfterLayout(this.callback);

  @override
  void performLayout() {
    super.performLayout();
    SchedulerBinding.instance
        .addPostFrameCallback((timeStamp) => callback(this));
  }

  Offset get offset => localToGlobal(Offset.zero);

  Rect get rect => offset & size;
}
