import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';

class FediBigHorizontalSpacer extends StatelessWidget {
  const FediBigHorizontalSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SizedBox(
        width: FediSizes.bigPadding,
      );
}
