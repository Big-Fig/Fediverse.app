import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';

class FediMediumVerticalSpacer extends StatelessWidget {
  const FediMediumVerticalSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SizedBox(
        height: FediSizes.mediumPadding,
      );
}
