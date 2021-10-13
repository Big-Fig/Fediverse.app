import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_bloc.dart';
import 'package:fedi/app/status/sensitive/status_sensitive_bloc.dart';
import 'package:fedi/app/ui/overlay/fedi_blurred_overlay_warning_widget.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusSensitiveNsfwWarningOverlayWidget extends StatelessWidget {
  final Widget child;

  StatusSensitiveNsfwWarningOverlayWidget({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var statusSensitiveBloc = IStatusSensitiveBloc.of(context);

    var isAlwaysShowNsfw = statusSensitiveBloc.isAlwaysShowNsfw;
    if (isAlwaysShowNsfw) {
      return child;
    } else {
      return ConstrainedBox(
        constraints: BoxConstraints(
          // todo: refactor
          // ignore: no-magic-number
          minHeight: 54,
          // ignore: no-magic-number
          minWidth: 200,
        ),
        child: Stack(
          children: [
            child,
            Positioned.fill(
              child: const _StatusSensitiveNsfwWarningOverlayBodyWidget(),
            ),
          ],
        ),
      );
    }
  }
}

class _StatusSensitiveNsfwWarningOverlayBodyWidget extends StatelessWidget {
  const _StatusSensitiveNsfwWarningOverlayBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediBlurredOverlayWarningWidget(
        buttonText: S.of(context).app_status_nsfw_action_view,
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
