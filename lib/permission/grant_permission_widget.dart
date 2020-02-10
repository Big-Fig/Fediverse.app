import 'package:fedi/permission/permission_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GrantPermissionWidget extends StatelessWidget {
  final IPermissionBloc permissionBloc;
  final WidgetBuilder grantedBuilder;
  GrantPermissionWidget(
      {@required this.permissionBloc, @required this.grantedBuilder});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: permissionBloc.permissionGrantedStream.distinct(),
        initialData: permissionBloc.permissionGranted,
        builder: (context, snapshot) {
          var permissionGranted = snapshot.data;

          if (!permissionGranted) {
            return Center(
              child: RaisedButton(
                child: Text("Ask permissions"),
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
