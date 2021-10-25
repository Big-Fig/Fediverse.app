import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';

class FediMediumHorizontalSpacer extends StatelessWidget {
  const FediMediumHorizontalSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SizedBox(
        width: FediSizes.mediumPadding,
      );
}
