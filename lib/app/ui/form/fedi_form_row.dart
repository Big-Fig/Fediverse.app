import 'package:flutter/cupertino.dart';

class FediFormRow extends StatelessWidget {
  final Widget child;

  FediFormRow({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:16.0),
      child: child,
    );
  }

}
