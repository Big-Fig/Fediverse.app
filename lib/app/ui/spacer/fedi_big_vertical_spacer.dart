import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';

class FediBigVerticalSpacer extends StatelessWidget {
  const FediBigVerticalSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SizedBox(
        height: FediSizes.bigPadding,
      );
}
