import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/auth/instance/join/join_auth_instance_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/join/join_auth_instance_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/instance/join/join_auth_instance_widget.dart';
import 'package:fedi/refactored/app/theme/theme.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMoreJoinAuthInstancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: romaBlueColor,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).tr("app.auth.instance.join.new"
            ".title")),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: JoinAuthInstanceWidget(),
      ),
    );
  }
}

void goToAddMoreJoinAuthInstancePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<IJoinAuthInstanceBloc>(
            create: (context) => JoinAuthInstanceBloc(),
            child: AddMoreJoinAuthInstancePage())),
  );
}
