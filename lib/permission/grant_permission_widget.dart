import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/permission/permission_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GrantPermissionWidget extends StatelessWidget {
  final IPermissionBloc permissionBloc;
  final WidgetBuilder grantedBuilder;

  GrantPermissionWidget(
      {@required this.permissionBloc, @required this.grantedBuilder}) {
    permissionBloc.checkPermissionStatus();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: permissionBloc.permissionGrantedStream.distinct(),
        initialData: permissionBloc.permissionGranted,
        builder: (context, snapshot) {
          var permissionGranted = snapshot.data;

          if(permissionGranted == null) {
            return Center(child: FediCircularProgressIndicator());
          }

          if (!permissionGranted) {
            return Center(
              child: Padding(
                padding: FediPadding.allBigPadding,
                child: FediPrimaryFilledTextButton(
                  tr("permission.grant.action.grant"),
                  expanded: false,
                  onPressed: () {
                    permissionBloc.requestPermission();
                  },
                ),
              ),
            );
          } else {
            return grantedBuilder(context);
          }
        });
  }
}
