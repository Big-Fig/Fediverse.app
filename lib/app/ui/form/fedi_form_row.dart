import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';

class FediFormRow extends StatelessWidget {
  final Widget child;

  const FediFormRow({required this.child});

  @override
  Widget build(BuildContext context) => Padding(
        padding: FediPadding.verticalBigPadding,
        child: child,
      );
}
