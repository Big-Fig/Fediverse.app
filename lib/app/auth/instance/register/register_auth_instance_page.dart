import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_bloc_impl.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_dismiss_icon_button.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterAuthInstancePage extends StatelessWidget {
  final Uri instanceBaseUrl;

  const RegisterAuthInstancePage({@required this.instanceBaseUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
          title: AppLocalizations.of(context)
              .tr("app.auth.instance.register.title"),
          leading: FediDismissIconButton()),
      body: SafeArea(
          child: RegisterAuthInstanceWidget(instanceBaseUrl: instanceBaseUrl)),
    );
  }
}

void goToRegisterAuthInstancePage(BuildContext context,
    {@required Uri instanceBaseUrl}) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<IRegisterAuthInstanceBloc>(
            create: (context) => JoinAuthInstanceRegisterBloc(),
            child: RegisterAuthInstancePage(instanceBaseUrl: instanceBaseUrl))),
  );
}
