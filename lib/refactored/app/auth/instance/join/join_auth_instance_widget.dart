import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/instance/join/join_auth_instance_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/register/register_auth_instance_page.dart';
import 'package:fedi/refactored/app/dialog/alert/my_alert_dialog.dart';
import 'package:fedi/refactored/app/dialog/progress/indeterminate_progress_dialog.dart';
import 'package:fedi/refactored/app/tos/tos_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Todo: refactor colors
final Color darkGray = Color.fromARGB(175, 40, 40, 35);
final Color romaGreen = Colors.blue; // Color.fromARGB(255, 146, 196, 78);

class JoinAuthInstanceWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildLogoWidget(),
          ),
          SizedBox(
            height: 60,
          ),
          buildHostTextField(context),
          Spacer(),
          buildActionButtons(context),
          Spacer(),
          buildOrText(context),
          Spacer(),
          buildJoinFediDescText(context),
          buildJoinFediButton(context),
          Spacer(
            flex: 3,
          ),
          buildTermsOfServiceButton(context),
        ],
      ),
    );
  }

  FlatButton buildTermsOfServiceButton(BuildContext context) {
    return FlatButton(
      child: Text(
          AppLocalizations.of(context).tr("app.auth.instance.join.action.tos")),
      color: Colors.black12,
      onPressed: () {
        goToTosPage(context);
      },
    );
  }

  OutlineButton buildJoinFediButton(BuildContext context) {
    return OutlineButton(
      textColor: Colors.white,
      borderSide: BorderSide(
        width: 2.0,
        color: Colors.white,
        style: BorderStyle.solid,
      ),
      child: Text(
        AppLocalizations.of(context).tr("app.auth.instance.join.action"
            ".join_fedi"),
      ),
      onPressed: () {
        goToRegisterAuthInstancePage(context);
      },
    );
  }

  Padding buildJoinFediDescText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        AppLocalizations.of(context).tr("app.auth.instance.join.no_account"
            ".content"),
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Container buildOrText(BuildContext context) {
    return Container(
      child: Text(
        AppLocalizations.of(context).tr("app.auth.instance.join.no_account"
            ".prefix"),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Row buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: FlatButton(
                child: Text(
                    AppLocalizations.of(context).tr("app.auth.instance.join"
                        ".action"
                        ".sign_up")),
                color: darkGray,
                textColor: Colors.white,
                onPressed: () {
                  signUpToInstance(context);
                }),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(left: 5, right: 10),
            child: FlatButton(
                child: Text(
                    AppLocalizations.of(context).tr("app.auth.instance.join"
                        ".action"
                        ".login")),
                color: darkGray,
                textColor: Colors.white,
                onPressed: () {
                  logInToInstance(context);
                }),
          ),
        ),
      ],
    );
  }

  Widget buildHostTextField(BuildContext context) {
    var joinInstanceBloc = IJoinAuthInstanceBloc.of(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        autocorrect: false,
        textCapitalization: TextCapitalization.none,
        controller: joinInstanceBloc.hostTextController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white54,
          hintText: AppLocalizations.of(context).tr("app.auth.instance.join"
              ".field.host.hint"),
          helperText: AppLocalizations.of(context).tr("app.auth.instance.join"
              ".field.host.helper"),
          border: InputBorder.none,
          helperStyle: TextStyle(color: Colors.white),
        ),
        keyboardType: TextInputType.url,
      ),
    );
  }

  Container buildLogoWidget() {
    return Container(
      child: Image(
        image: AssetImage("assets/images/theme/logo.png"),
        width: 100,
      ),
    );
  }

  signUpToInstance(BuildContext context) async {
    var joinInstanceBloc = IJoinAuthInstanceBloc.of(context, listen: false);

    var hostTextController = joinInstanceBloc.hostTextController;
    // todo: fix hardcode
    if (hostTextController.text == "" ||
        hostTextController.text.contains("fedi.app")) {
      goToRegisterAuthInstancePage(context);
      return;
    }
    var progressDialog = IndeterminateProgressDialog(
        contentMessage: AppLocalizations.of(context).tr("app.auth.instance.join"
            ".progress.dialog.content"));
    progressDialog.show(context);

    var host = hostTextController.text.split("/").first;
    if (await canLaunch(host)) {
      launch(host);
    }
  }

  logInToInstance(BuildContext context) {
    var joinInstanceBloc = IJoinAuthInstanceBloc.of(context, listen: false);

    var hostTextController = joinInstanceBloc.hostTextController;
    if (hostTextController.text == "") {
      hostTextController.text = "fedi.app";
      return;
    }
    var progressDialog = IndeterminateProgressDialog(contentMessage: AppLocalizations.of(context).tr("app.auth.instance.join"
        ".progress.dialog.content"));
    progressDialog.show(context);

    var host = hostTextController.text.split("/").first;

    if (!host.startsWith("http")) {
      // todo: remove hack
      host = "https://$host";
    }

    var bloc = AuthHostBloc.createFromContext(context,
        instanceBaseUrl: Uri.parse(host));

    bloc.launchLoginToAccount(successCallback: (instance) {
      progressDialog.hide(context);
      bloc.dispose();
      if (instance != null) {
        var alertDialog = MyAlertDialog(
            title: AppLocalizations.of(context).tr("app.auth.instance.join"
                ".fail.dialog.title"),
            content: AppLocalizations.of(context).tr("app.auth.instance.join"
                ".fail.dialog.content"));
        alertDialog.show(context);
      }
    }, errorCallback: (error) {
      progressDialog.hide(context);
      bloc.dispose();
      var alert = MyAlertDialog(
          title: AppLocalizations.of(context).tr("app.auth.instance.join"
              ".fail.dialog.title"),
          content: AppLocalizations.of(context).tr("app.auth.instance.join"
              ".fail.dialog.content"));
      alert.show(context);
    });
  }
}
