import 'package:flutter/cupertino.dart';

class UnfocusOnScrollAreaWidget extends StatelessWidget {
  final Widget child;

  const UnfocusOnScrollAreaWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanDown: (_) {
          FocusScope.of(context).requestFocus(
            FocusNode(),
          );
        },
        child: child,
      );
}
