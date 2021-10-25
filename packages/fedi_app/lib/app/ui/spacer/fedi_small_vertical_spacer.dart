import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';

class FediSmallVerticalSpacer extends StatelessWidget {
  const FediSmallVerticalSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SizedBox(
        height: FediSizes.smallPadding,
      );
}
