import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/join/join_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_page.dart';
import 'package:fedi/app/tos/tos_page.dart';
import 'package:fedi/app/ui/button/text/fedi_grey_filled_text_button.dart';
import 'package:fedi/app/ui/edit_text/fedi_filled_edit_text_field.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:fedi/error/error_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("join_auth_instance_widget.dart");

class JoinAuthInstanceWidget extends StatelessWidget {
  final bool isFromScratch;

  JoinAuthInstanceWidget({@required this.isFromScratch});

  @override
  Widget build(BuildContext context) {
    return Form(
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildJoinFediButton(context),
          ),
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
        tr("app.auth.instance.join.action"
            ".tos"),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: FediColors.ultraLightGrey,
        ),
      ),
      color: null,
      onPressed: () {
        goToTosPage(context);
      },
    );
  }

  Widget buildJoinFediButton(BuildContext context) {
    return FediGreyFilledTextButton(
        tr("app.auth.instance.join"
            ".action"
            ".join_fedi"), onPressed: () {
      goToRegisterAuthInstancePage(context,
          instanceBaseUrl: Uri.parse('https://fedi.app'));
    }, textColor: FediColors.darkGrey);
  }

  Padding buildJoinFediDescText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        tr("app.auth.instance.join.no_account"
            ".content"),
        style: TextStyle(
          color: FediColors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Container buildOrText(BuildContext context) {
    return Container(
      child: Text(
        tr("app.auth.instance.join.no_account"
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
            child: FediGreyFilledTextButton(
                tr("app.auth.instance.join"
                    ".action"
                    ".sign_up"), onPressed: () {
              signUpToInstance(context);
            }, textColor: FediColors.darkGrey),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(left: 5, right: 10),
            child: FediGreyFilledTextButton(
                tr("app.auth.instance.join"
                    ".action"
                    ".login"), onPressed: () {
              logInToInstance(context);
            }, textColor: FediColors.darkGrey),
          ),
        ),
      ],
    );
  }

  Widget buildHostTextField(BuildContext context) {
    var joinInstanceBloc = IJoinAuthInstanceBloc.of(context, listen: true);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: FediFilledEditTextField(
          expanded: false,
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

  Future signUpToInstance(BuildContext context) async {
    var joinInstanceBloc = IJoinAuthInstanceBloc.of(context, listen: false);
    var hostUri = extractCurrentUri(joinInstanceBloc);
    var asyncDialogResult = await doAsyncOperationWithDialog(
        context: context,
        contentMessage: tr("app.auth.instance.join"
            ".progress.dialog.content"),
        asyncCode: () async {
          AuthHostBloc authHostBloc;
          authHostBloc =
              AuthHostBloc.createFromContext(context, instanceBaseUrl: hostUri);
          await authHostBloc.checkApplicationRegistration();
          authHostBloc?.dispose();
        },
        errorDataBuilders: [
          (
            context,
            error,
            stackTrace,
          ) {
            // todo: handle specific error
            return createInstanceDeadErrorData(
              context,
              error,
              stackTrace,
            );
          }
        ]);
    if (asyncDialogResult.success) {
      goToRegisterAuthInstancePage(context, instanceBaseUrl: hostUri);
    }
  }

  ErrorData createInstanceDeadErrorData(
          BuildContext context, error, StackTrace stackTrace) =>
      ErrorData(
          error: error,
          stackTrace: stackTrace,
          titleText: tr("app.auth.instance.join"
              ".fail.dialog.title"),
          contentText: tr("app.auth.instance.join"
              ".fail.dialog.content"));

  Future logInToInstance(BuildContext context) async {
    var joinInstanceBloc = IJoinAuthInstanceBloc.of(context, listen: false);
    var dialogResult = await doAsyncOperationWithDialog(
        context: context,
        contentMessage: tr("app.auth.instance.join"
            ".progress.dialog.content"),
        cancelable: true,
        asyncCode: () async {
          var hostUri = extractCurrentUri(joinInstanceBloc);
          AuthHostBloc bloc;
          try {
            bloc = AuthHostBloc.createFromContext(context,
                instanceBaseUrl: hostUri);
            var instance = await bloc.launchLoginToAccount();

            return instance;
          } finally {
            bloc?.dispose();
          }
        },
        errorDataBuilders: [
          (context, error, stackTrace) {
            // todo: handle specific error
            return createInstanceDeadErrorData(context, error, stackTrace);
          }
        ]);

    if (dialogResult.result != null) {
      if (!isFromScratch) {
        await Navigator.pop(context);
        await Navigator.pop(context);
      }
      await ICurrentAuthInstanceBloc.of(context, listen: false)
          .changeCurrentInstance(dialogResult.result);
    }
  }
}
