import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class FediDarkStatusBarStyleArea extends StatelessWidget {
  final Widget child;

  FediDarkStatusBarStyleArea({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark, child: child),
    );
  }
}
