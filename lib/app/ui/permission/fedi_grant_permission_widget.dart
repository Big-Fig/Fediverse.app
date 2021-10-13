import 'package:fedi/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/permission/permission_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediGrantPermissionWidget extends StatelessWidget {
  final IPermissionBloc permissionBloc;
  final WidgetBuilder grantedBuilder;

  FediGrantPermissionWidget({
    required this.permissionBloc,
    required this.grantedBuilder,
  }) {
    permissionBloc.checkPermissionStatus();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<bool?>(
        stream: permissionBloc.permissionGrantedStream.distinct(),
        initialData: permissionBloc.permissionGranted,
        builder: (context, snapshot) {
          var permissionGranted = snapshot.data;

          if (permissionGranted == null) {
            return Center(child: FediCircularProgressIndicator());
          }

          if (!permissionGranted) {
            return Center(
              child: Padding(
                padding: FediPadding.allBigPadding,
                child: FediPrimaryFilledTextButtonWithBorder(
                  S.of(context).permission_grant_action_grant,
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
        },
      );
}
