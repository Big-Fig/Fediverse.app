import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';

class FediMiddleVerticalSpacer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: FediSizes.middlePadding,
    );
  }

  const FediMiddleVerticalSpacer();
}
