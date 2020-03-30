import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Views/Alert.dart';
import 'package:fedi/Views/ProgressDialog.dart';
import 'package:fedi/refactored/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/refactored/app/auth/instance/join/join_instance_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/join/register/join_instance_register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Color darkGray = Color.fromARGB(175, 40, 40, 35);
final Color romaGreen = Colors.blue; // Color.fromARGB(255, 146, 196, 78);

class JoinInstanceWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          buildLogoWidget(),
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
      child: Text(AppLocalizations.of(context).tr("login.action.terms")),
      color: Colors.black12,
      onPressed: () {
        Navigator.pushNamed(context, '/terms');
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
        AppLocalizations.of(context).tr("login.action.join_instance"),
      ),
      onPressed: () {
        goToJoinInstanceRegisterPage(context);
      },
    );
  }

  Padding buildJoinFediDescText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        AppLocalizations.of(context).tr("login.text.join_explaination"),
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
        "- " + AppLocalizations.of(context).tr("login.text.or") + " -",
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
                    AppLocalizations.of(context).tr("login.action.sign_up")),
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
                child: Text(AppLocalizations.of(context)
                    .tr("login.action.login_to_instance")),
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
    var joinInstanceBloc = IJoinInstanceBloc.of(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        autocorrect: false,
        textCapitalization: TextCapitalization.none,
        controller: joinInstanceBloc.hostTextController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white54,
          hintText: AppLocalizations.of(context).tr("login.field.host.hint"),
          helperText:
              AppLocalizations.of(context).tr("login.field.host.helper_text"),
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
        width: 60,
      ),
    );
  }

  signUpToInstance(BuildContext context) async {
    var joinInstanceBloc = IJoinInstanceBloc.of(context, listen: false);

    var hostTextController = joinInstanceBloc.hostTextController;
    if (hostTextController.text == "" ||
        hostTextController.text.contains("fedi.app")) {
      goToJoinInstanceRegisterPage(context);
      return;
    }
    var _pr = new ProgressDialog(context, ProgressDialogType.Normal);
    _pr.setMessage(AppLocalizations.of(context).tr("login.check.progress"));
    _pr.show();

    var host = hostTextController.text.split("/").first;
    if (await canLaunch(host)) {
      launch(host);
    }

  }

  logInToInstance(BuildContext context) {
    var joinInstanceBloc = IJoinInstanceBloc.of(context, listen: false);

    var hostTextController = joinInstanceBloc.hostTextController;
    if (hostTextController.text == "") {
      hostTextController.text = "fedi.app";
      return;
    }
    var _pr = new ProgressDialog(context, ProgressDialogType.Normal);
    _pr.setMessage(AppLocalizations.of(context).tr("login.check.progress"));
    _pr.show();

    var host = hostTextController.text.split("/").first;

    if (!host.startsWith("http")) {
      // todo: remove hack
      host = "https://$host";
    }

    var bloc = AuthHostBloc.createFromContext(context,
        instanceBaseUrl: Uri.parse(host));

    bloc.launchLoginToAccount(successCallback: (instance) {
      _pr.hide();
      bloc.dispose();
      if (instance != null) {
        var alert = Alert(
            context,
            AppLocalizations.of(context).tr("login.check.error.alert.title"),
            AppLocalizations.of(context).tr("login.check.error.alert.content"),
            () => {});
        alert.showAlert();
      }
    }, errorCallback: (error) {
      _pr.hide();
      bloc.dispose();
      var alert = Alert(
          context,
          AppLocalizations.of(context).tr("login.check.error.alert.title"),
          AppLocalizations.of(context).tr("login.check.error.alert.content"),
          () => {});
      alert.showAlert();
    });
  }
}
