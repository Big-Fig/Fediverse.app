import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/thread/status_thread_page.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _showThisThreadContainerHeight = 48.0;

class StatusShowThisThreadActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);
    return InkWell(
      onTap: () {
        goToStatusThreadPage(
          context,
          status: statusBloc.status,
          initialMediaAttachment: null,
        );
      },
      child: Container(
        height: _showThisThreadContainerHeight,
        child: Center(
          child: Text(
            S.of(context).app_status_action_showThisThread,
            style: IFediUiTextTheme.of(context).bigShortPrimary,
          ),
        ),
      ),
    );
  }
}
