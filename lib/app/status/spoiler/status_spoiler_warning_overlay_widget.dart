import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/overlay/fedi_blurred_overlay_warning_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusSpoilerWarningOverlayWidget extends StatelessWidget {
  final Widget child;

  StatusSpoilerWarningOverlayWidget({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var myAccountSettingsBloc =
        IMyAccountSettingsBloc.of(context, listen: false);

    var isAlwaysShowSpoiler =
        myAccountSettingsBloc.isAlwaysShowSpoilerFieldBloc.currentValue == true;
    if (isAlwaysShowSpoiler) {
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
              child: const _StatusSpoilerWarningOverlayBodyWidget(),
            ),
          ],
        ),
      );
    }
  }
}

class _StatusSpoilerWarningOverlayBodyWidget extends StatelessWidget {
  const _StatusSpoilerWarningOverlayBodyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediBlurredOverlayWarningWidget(
      buttonText: S.of(context).app_status_spoiler_action_view,
      buttonAction: () {
        var statusBloc = IStatusBloc.of(context, listen: false);

        statusBloc.changeDisplaySpoiler(true);
      },
    );
  }
}
