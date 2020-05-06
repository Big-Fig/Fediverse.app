import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusSpoilerAlertWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appLocalizations = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        child: Text(appLocalizations.tr("app.status.spoiler.action.view")),
        onPressed: () {
          var statusBloc = IStatusBloc.of(context, listen: false);

          statusBloc.changeDisplaySpoiler(true);
        },
      ),
    );
  }
}
