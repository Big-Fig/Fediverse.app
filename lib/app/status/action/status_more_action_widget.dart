import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/action/status_action_more_dialog.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusMoreActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);
    return FediIconButton(
      color: FediColors.darkGrey,
      iconSize: FediSizes.bigIconSize,
      icon: Icon(FediIcons.menu),
      tooltip: tr("app.status.action.more"),
      onPressed: () {
        showStatusActionMoreDialog(
          context: context,
          statusBloc: statusBloc,
        );
      },
    );
  }

  const StatusMoreActionWidget();
}
