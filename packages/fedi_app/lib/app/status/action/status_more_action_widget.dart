import 'package:fedi_app/app/status/action/status_action_more_dialog.dart';
import 'package:fedi_app/app/status/status_bloc.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusMoreActionWidget extends StatelessWidget {
  const StatusMoreActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);

    return FediIconButton(
      color: IFediUiColorTheme.of(context).darkGrey,
      iconSize: FediSizes.bigIconSize,
      icon: const Icon(FediIcons.menu),
      onPressed: () {
        showStatusActionMoreDialog(
          context: context,
          statusBloc: statusBloc,
        );
      },
    );
  }
}
