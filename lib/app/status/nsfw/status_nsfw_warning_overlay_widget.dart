import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/overlay/fedi_blurred_overlay_warning_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusNsfwWarningOverlayWidget extends StatelessWidget {
  final Widget child;

  StatusNsfwWarningOverlayWidget({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var myAccountSettingsBloc =
        IMyAccountSettingsBloc.of(context, listen: false);

    var isAlwaysShowNsfw =
        myAccountSettingsBloc.isAlwaysShowNsfwFieldBloc.currentValue == true;
    if (isAlwaysShowNsfw) {
      return child;
    } else {
      return FediBlurredOverlayWarningWidget(
        buttonText: tr("app.status.nsfw.action.view"),
        buttonAction: () {
          var statusBloc = IStatusBloc.of(context, listen: false);

          statusBloc.changeDisplayNsfwSensitive(true);
        },
        child: child,
      );
    }
  }
}
