import 'dart:core';

import 'package:fedi/app/ui/fedi_sizes.dart';
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
            borderRadius: FediSizes.defaultClipRRectBorderRadius,
            child: Container(
              color: Colors.white,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 4.0 * 3.0,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: child,
              ),
            ),
          ));
}
