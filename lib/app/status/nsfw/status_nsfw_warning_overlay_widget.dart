import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/overlay/fedi_blurred_overlay_warning_widget.dart';
import 'package:fedi/generated/l10n.dart';
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
      return ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 54,
        ),
        child: Stack(
          children: [
            child,
            Positioned.fill(
              child: const _StatusNsfwWarningOverlayBodyWidget(),
            ),
          ],
        ),
      );
    }
  }
}

class _StatusNsfwWarningOverlayBodyWidget extends StatelessWidget {
  const _StatusNsfwWarningOverlayBodyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediBlurredOverlayWarningWidget(
        buttonText: S.of(context).app_status_nsfw_action_view,
        buttonAction: () {
          var statusBloc = IStatusBloc.of(context, listen: false);

          statusBloc.changeDisplayNsfwSensitive(true);
        },
      );
}
