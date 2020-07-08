import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusSpoilerAlertWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: FediPadding.allSmallPadding,
      child: FediPrimaryFilledTextButton(
        tr("app.status.spoiler.action.view"),
        onPressed: () {
          var statusBloc = IStatusBloc.of(context, listen: false);

          statusBloc.changeDisplaySpoiler(true);
        },
      ),
    );
  }

  const StatusSpoilerAlertWidget();
}
