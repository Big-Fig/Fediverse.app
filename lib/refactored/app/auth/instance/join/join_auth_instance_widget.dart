import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/instance/join/join_auth_instance_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/register/register_auth_instance_page.dart';
import 'package:fedi/refactored/app/theme/theme.dart';
import 'package:fedi/refactored/app/tos/tos_page.dart';
import 'package:fedi/refactored/dialog/alert/simple_alert_dialog.dart';
import 'package:fedi/refactored/dialog/progress/indeterminate_progress_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("join_auth_instance_widget.dart");

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
        goToRegisterAuthInstancePage(context,
            instanceBaseUrl: Uri.parse("https://fedi.app"));
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
                color: romaDarkGrayColor,
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
                color: romaDarkGrayColor,
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

  Uri extractCurrentUri(IJoinAuthInstanceBloc joinInstanceBloc) {
    var uriText = joinInstanceBloc.hostTextController.text;
    var parsedUri = Uri.parse(uriText);

    Uri uri;
    var scheme = parsedUri.scheme;
    if (scheme?.isNotEmpty != true) {
      uri = Uri.parse("https://$uriText");
    } else {
      uri = parsedUri;
    }

    _logger.finest(() => "extractCurrentUri $uri");
    return uri;
  }

  signUpToInstance(BuildContext context) async {
    var joinInstanceBloc = IJoinAuthInstanceBloc.of(context, listen: false);

    var hostUri = extractCurrentUri(joinInstanceBloc);

    goToRegisterAuthInstancePage(context, instanceBaseUrl: hostUri);
  }

  logInToInstance(BuildContext context) {
    var joinInstanceBloc = IJoinAuthInstanceBloc.of(context, listen: false);

    var progressDialog = IndeterminateProgressDialog(
        contentMessage: AppLocalizations.of(context).tr("app.auth.instance.join"
            ".progress.dialog.content"));
    progressDialog.show(context);

    var hostUri = extractCurrentUri(joinInstanceBloc);
    var bloc =
        AuthHostBloc.createFromContext(context, instanceBaseUrl: hostUri);

    bloc.launchLoginToAccount(successCallback: (instance) {
      progressDialog.hide(context);
      bloc.dispose();
      if (instance != null) {
        var alertDialog = SimpleAlertDialog(
            title: AppLocalizations.of(context).tr("app.auth.instance.join"
                ".fail.dialog.title"),
            content: AppLocalizations.of(context).tr("app.auth.instance.join"
                ".fail.dialog.content"));
        alertDialog.show(context);
      }
    }, errorCallback: (error) {
      progressDialog.hide(context);
      bloc.dispose();
      var alert = SimpleAlertDialog(
          title: AppLocalizations.of(context).tr("app.auth.instance.join"
              ".fail.dialog.title"),
          content: AppLocalizations.of(context).tr("app.auth.instance.join"
              ".fail.dialog.content"));
      alert.show(context);
    });
  }
}
