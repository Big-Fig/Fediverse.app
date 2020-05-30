import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class FediLightStatusBarStyleArea extends StatelessWidget {
  final Widget child;

  FediLightStatusBarStyleArea({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light, child: child),
    );
  }
}
