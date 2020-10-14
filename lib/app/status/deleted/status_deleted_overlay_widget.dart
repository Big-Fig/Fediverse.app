import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/overlay/fedi_blurred_overlay_warning_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusDeletedOverlayWidget extends StatelessWidget {
  final Widget child;

  StatusDeletedOverlayWidget({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) => FediBlurredOverlayWarningWidget(
        descriptionText: tr("app.status.deleted.desc"),
        child: child,
      );
}
