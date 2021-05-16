import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

class YrkWidgetSize extends StatefulWidget {
  final Widget child;
  final Function onChanged;

  const YrkWidgetSize({
    Key? key,
    required this.onChanged,
    required this.child,
  }) : super(key: key);

  @override
  _YrkWidgetSizeState createState() => _YrkWidgetSizeState();
}

class _YrkWidgetSizeState extends State<YrkWidgetSize> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance!.addPostFrameCallback(postFrameCallback);
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }

  var widgetKey = GlobalKey();
  var oldSize;

  void postFrameCallback(_) {
    var context = widgetKey.currentContext;
    if (context == null) return;

    var newSize = context.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    widget.onChanged(newSize);
  }
}