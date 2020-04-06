import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/auth/instance/register/register_auth_instance_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/register/register_auth_instance_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/instance/register/register_auth_instance_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterAuthInstancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).tr("app.auth.instance.register"
              ".title"),
        ),
      ),
      body: SafeArea(child: RegisterAuthInstanceWidget()),
    );
  }
}

void goToRegisterAuthInstancePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<IRegisterAuthInstanceBloc>(
            create: (context) => JoinAuthInstanceRegisterBloc(),
            child: RegisterAuthInstancePage())),
  );
}
