import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/status/status_bloc.dart';
import 'package:fedi_app/app/status/thread/local_status_thread_page.dart';
import 'package:fedi_app/app/status/thread/remote_status_thread_page.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _showThisThreadContainerHeight = 48.0;

class StatusShowThisThreadActionWidget extends StatelessWidget {
  const StatusShowThisThreadActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);

    var isLocal = statusBloc.instanceLocation == InstanceLocation.local;

    return InkWell(
      onTap: () {
        if (isLocal) {
          goToLocalStatusThreadPage(
            context,
            status: statusBloc.status,
            initialMediaAttachment: null,
          );
        } else {
          goToRemoteStatusThreadPageBasedOnRemoteInstanceStatus(
            context,
            remoteInstanceStatus: statusBloc.status,
            remoteInstanceInitialMediaAttachment: null,
          );
        }
      },
      child: SizedBox(
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
