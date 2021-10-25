import 'package:fedi_app/app/ui/overlay/fedi_blurred_overlay_warning_widget.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusDeletedOverlayWidget extends StatelessWidget {
  const StatusDeletedOverlayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FediBlurredOverlayWarningWidget(
        descriptionText: S.of(context).app_status_deleted_desc,
      );
}
