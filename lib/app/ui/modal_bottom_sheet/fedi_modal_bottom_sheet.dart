import 'dart:core';

import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:flutter/material.dart';

void showFediModalBottomSheetDialog({
  @required BuildContext context,
  @required Widget child,
}) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) => ClipRRect(
            borderRadius: FediBorderRadius.topOnlyDefaultBorderRadius,
            child: Container(
              color: Colors.white,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 4.0 * 3.0,
              ),
              child: Padding(
                padding: FediPadding.verticalBigPadding,
                child: child,
              ),
            ),
          ));
}
