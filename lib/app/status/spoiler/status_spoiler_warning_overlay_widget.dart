import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/overlay/fedi_blurred_overlay_warning_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusSpoilerWarningOverlayWidget extends StatelessWidget {
  final Widget child;

  StatusSpoilerWarningOverlayWidget({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) => FediBlurredOverlayWarningWidget(
        buttonText: tr("app.status.spoiler.action.view"),
        buttonAction: () {
          var statusBloc = IStatusBloc.of(context, listen: false);

          statusBloc.changeDisplaySpoiler(true);
        },
        descriptionText: tr("app.status.spoiler.desc"),
        child: child,
      );
}
