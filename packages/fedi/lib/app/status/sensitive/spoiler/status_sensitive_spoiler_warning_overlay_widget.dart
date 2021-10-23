import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_bloc.dart';
import 'package:fedi/app/status/sensitive/status_sensitive_bloc.dart';
import 'package:fedi/app/ui/overlay/fedi_blurred_overlay_warning_widget.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusSensitiveSpoilerWarningOverlayWidget extends StatelessWidget {
  final Widget child;

  const StatusSensitiveSpoilerWarningOverlayWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusSensitiveBloc = IStatusSensitiveBloc.of(context);

    var isAlwaysShowSpoiler = statusSensitiveBloc.isAlwaysShowSpoiler;
    if (isAlwaysShowSpoiler) {
      return child;
    } else {
      return ConstrainedBox(
        constraints: const BoxConstraints(
          // todo: refactor
          // ignore: no-magic-number
          minHeight: 54,
          // ignore: no-magic-number
          minWidth: 200,
        ),
        child: Stack(
          children: [
            child,
            const Positioned.fill(
              child: _StatusSensitiveSpoilerWarningOverlayBodyWidget(),
            ),
          ],
        ),
      );
    }
  }
}

class _StatusSensitiveSpoilerWarningOverlayBodyWidget extends StatelessWidget {
  const _StatusSensitiveSpoilerWarningOverlayBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediBlurredOverlayWarningWidget(
        buttonText: S.of(context).app_status_spoiler_action_view,
        replaceBlurWithColor:
            IStatusSensitiveSettingsBloc.of(context).isNeedReplaceBlurWithFill
                ? IFediUiColorTheme.of(context).primaryDark
                : null,
        // ignore: no-magic-number
        sigma: 10.0,
        buttonAction: () {
          var statusSensitiveBloc =
              IStatusSensitiveBloc.of(context, listen: false);

          // ignore: cascade_invocations
          statusSensitiveBloc.enableDisplay();
        },
      );
}
