import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/widgets.dart';

class FediBorderRadius {
  static const BorderRadius topOnlyBigBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(FediSizes.borderRadiusBigSize),
    topRight: Radius.circular(FediSizes.borderRadiusBigSize),
  );
  static const BorderRadius allBigBorderRadius = BorderRadius.all(
    Radius.circular(FediSizes.borderRadiusBigSize),
  );
  static const BorderRadius editTextBorderRadius = BorderRadius.all(
    Radius.circular(30.0),
  );
}
