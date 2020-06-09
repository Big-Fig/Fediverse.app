import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/app/auth/instance/join/join_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_page.dart';
import 'package:fedi/app/tos/tos_page.dart';
import 'package:fedi/app/ui/button/text/fedi_grey_filled_text_button.dart';
import 'package:fedi/app/ui/edit/fedi_filled_edit_text_field.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/dialog/alert/base_alert_dialog.dart';
import 'package:fedi/dialog/alert/simple_alert_dialog.dart';
import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("join_auth_instance_widget.dart");

class JoinAuthInstanceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(child: Column(children: <Widget>[
      Padding(padding: const EdgeInsets.all(8.0), child: buildLogoWidget(),),
      SizedBox(height: 60,),
      buildHostTextField(context),
      Spacer(),
      buildActionButtons(context),
      Spacer(),
      buildOrText(context),
      Spacer(),
      buildJoinFediDescText(context),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: buildJoinFediButton(context),),
      Spacer(flex: 3,),
      buildTermsOfServiceButton(context),
    ],),);
  }

  FlatButton buildTermsOfServiceButton(BuildContext context) {
    return FlatButton(
      child: Text(tr("app.auth.instance.join.action"
          ".tos"), textAlign: TextAlign.center,
        style: TextStyle(color: FediColors.ultraLightGrey,),),
      color: null,
      onPressed: () {
        goToTosPage(context);
      },);
  }

  Widget buildJoinFediButton(BuildContext context) {
    return FediGreyFilledTextButton(tr("app.auth.instance.join"
        ".action"
        ".join_fedi"), onPressed: () {
      goToRegisterAuthInstancePage(
          context, instanceBaseUrl: Uri.parse('https://fedi.app'));
    }, textColor: FediColors.darkGrey);
  }

  Padding buildJoinFediDescText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(tr("app.auth.instance.join.no_account"
          ".content"), style: TextStyle(color: FediColors.white,),
        textAlign: TextAlign.center,),);
  }

  Container buildOrText(BuildContext context) {
    return Container(child: Text(tr("app.auth.instance.join.no_account"
        ".prefix"), style: TextStyle(color: Colors.white,),),);
  }

  Row buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(flex: 1, child: Padding(
          padding: EdgeInsets.only(left: 10, right: 5),
          child: FediGreyFilledTextButton(tr("app.auth.instance.join"
              ".action"
              ".sign_up"), onPressed: () {
            signUpToInstance(context);
          }, textColor: FediColors.darkGrey),),),
        Expanded(flex: 1, child: Padding(
          padding: EdgeInsets.only(left: 5, right: 10),
          child: FediGreyFilledTextButton(tr("app.auth.instance.join"
              ".action"
              ".login"), onPressed: () {
            logInToInstance(context);
          }, textColor: FediColors.darkGrey),),),
      ],);
  }

  Widget buildHostTextField(BuildContext context) {
    var joinInstanceBloc = IJoinAuthInstanceBloc.of(context, listen: true);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: FediFilledEditTextField(expanded: false,
          hintText: tr("app.auth.instance.join"
              ".field.host.hint"),
          onSubmitted: (String value) {
            logInToInstance(context);
          },
          textInputAction: TextInputAction.go,
          autofocus: false,
          maxLines: 1,
          textEditingController: joinInstanceBloc.hostTextController,
          keyboardType: TextInputType.url),
    );
  }

  Container buildLogoWidget() {
    return Container(child: Image(
      image: AssetImage("assets/images/theme/logo.png"), width: 100,),);
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

  Future signUpToInstance(BuildContext context) async {
    await doAsyncOperationWithDialog(
        context: context, contentMessage: tr("app.auth.instance.join"
        ".progress.dialog.content"), asyncCode: () async {
      var joinInstanceBloc = IJoinAuthInstanceBloc.of(context, listen: false);

      var hostUri = extractCurrentUri(joinInstanceBloc);

      AuthHostBloc authHostBloc;
      try {
        authHostBloc =
            AuthHostBloc.createFromContext(context, instanceBaseUrl: hostUri);
        await authHostBloc.checkApplicationRegistration();
      } finally {
        authHostBloc?.dispose();
      }

      goToRegisterAuthInstancePage(context, instanceBaseUrl: hostUri);
    }, errorAlertDialogBuilders: [(context, error) {
      // todo: handle specific error
      return createInstanceDeadErrorAlertDialog(context);
    }
    ]);
  }

  BaseAlertDialog createInstanceDeadErrorAlertDialog(BuildContext context) =>
      SimpleAlertDialog(title: tr("app.auth.instance.join"
          ".fail.dialog.title"), content: tr("app.auth.instance.join"
          ".fail.dialog.content"), context: context);

  Future logInToInstance(BuildContext context) {
    var joinInstanceBloc = IJoinAuthInstanceBloc.of(context, listen: false);
    return doAsyncOperationWithDialog(context: context,
        contentMessage: tr("app.auth.instance.join"
            ".progress.dialog.content"),
        cancelable: true,
        asyncCode: () async {
          var hostUri = extractCurrentUri(joinInstanceBloc);
          AuthHostBloc bloc;
          try {
            bloc = AuthHostBloc.createFromContext(
                context, instanceBaseUrl: hostUri);
            await bloc.launchLoginToAccount();
          } finally {
            bloc.dispose();
          }
        },
        errorAlertDialogBuilders: [(context, error) {
          // todo: handle specific error
          return createInstanceDeadErrorAlertDialog(context);
        }
        ]);
  }

  const JoinAuthInstanceWidget();
}
