import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:flutter/widgets.dart';

class FediBorderRadius {
  static const BorderRadius topOnlyBigBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(FediSizes.borderRadiusBigSize),
    // ignore: no-equal-arguments
    topRight: Radius.circular(FediSizes.borderRadiusBigSize),
  );
  static const BorderRadius allBigBorderRadius = BorderRadius.all(
    Radius.circular(FediSizes.borderRadiusBigSize),
  );
  static const BorderRadius allSmallBorderRadius = BorderRadius.all(
    Radius.circular(FediSizes.borderRadiusSmallSize),
  );
  static const BorderRadius editTextBorderRadius = BorderRadius.all(
    Radius.circular(30.0),
  );
}
