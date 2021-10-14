import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';

class FediBigVerticalSpacer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const SizedBox(
        height: FediSizes.bigPadding,
      );

  const FediBigVerticalSpacer();
}
