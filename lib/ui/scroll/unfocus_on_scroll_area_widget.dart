import 'package:flutter/cupertino.dart';

class UnfocusOnScrollAreaWidget extends StatelessWidget {
  final Widget child;

  const UnfocusOnScrollAreaWidget({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanDown: (_) {
        FocusScope.of(context).requestFocus(
          FocusNode(),
        );
      },
      child: child,
    );
  }
}
