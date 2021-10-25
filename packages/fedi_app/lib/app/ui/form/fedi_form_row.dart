import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';

class FediFormRow extends StatelessWidget {
  final Widget child;

  const FediFormRow({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: FediPadding.verticalBigPadding,
        child: child,
      );
}
