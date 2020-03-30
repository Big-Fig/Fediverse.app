
import 'package:fedi/refactored/app/auth/instance/join/join_instance_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/join/join_instance_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/instance/join/join_instance_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class JoinNewInstancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: romaGreen,
      // todo: localization
      appBar: AppBar(
        title: Text("Join new instance"),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: JoinInstanceWidget(),
      ),
    );
  }
}


void goToJoinNewInstancePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DisposableProvider<IJoinInstanceBloc>(
        create: (context) => JoinInstanceBloc(),
        child: JoinNewInstancePage())),
  );
}
