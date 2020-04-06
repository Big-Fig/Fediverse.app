import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/auth/instance/join/register/join_auth_instance_register_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/join/register/join_auth_instance_register_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/instance/join/register/join_auth_instance_register_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JoinAuthInstanceRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).tr("sign_up.title.sign_up"),
        ),
      ),
      body: SafeArea(child: JoinAuthInstanceRegisterWidget()),
    );
  }

}

void goToJoinAuthInstanceRegisterPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DisposableProvider<IJoinAuthInstanceRegisterBloc>(
        create: (context) => JoinAuthInstanceRegisterBloc(),
        child: JoinAuthInstanceRegisterPage())),
  );
}
