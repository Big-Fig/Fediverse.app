import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/permission/permission_bloc.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GrantPermissionWidget extends StatelessWidget {
  final IPermissionBloc permissionBloc;
  final WidgetBuilder grantedBuilder;
  GrantPermissionWidget(
      {@required this.permissionBloc, @required this.grantedBuilder});

  @override
  Widget build(BuildContext context) {
    return InitialDataStreamBuilder<bool>(
        stream: permissionBloc.permissionGrantedStream.distinct(),
        initialData: permissionBloc.permissionGranted,
        builder: (context, snapshot) {
          var permissionGranted = snapshot.data;

          if (!permissionGranted) {
            return Center(
              child: RaisedButton(
                child: Text(AppLocalizations.of(context)
                    .tr("permission.grant.action.grant")),
                onPressed: () {
                  permissionBloc.requestPermission();
                },
              ),
            );
          } else {
            return grantedBuilder(context);
          }
        });
  }
}
