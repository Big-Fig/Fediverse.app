import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/join/join_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_page.dart';
import 'package:fedi/app/tos/tos_page.dart';
import 'package:fedi/app/ui/async/fedi_async_dialog.dart';
import 'package:fedi/app/ui/button/text/fedi_transparent_text_button.dart';
import 'package:fedi/app/ui/edit_text/fedi_transparent_edit_text_field.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/error/error_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:logging/logging.dart';

var _logger = Logger("join_auth_instance_widget.dart");

class JoinAuthInstanceWidget extends StatelessWidget {
  final bool isFromScratch;

  JoinAuthInstanceWidget({@required this.isFromScratch});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus.unfocus();
      },
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: FediPadding.allBigPadding,
        child: Column(
          children: <Widget>[
            Spacer(
              flex: 1,
            ),
            Padding(
              padding: FediPadding.allSmallPadding,
              child: buildLogoWidget(),
            ),
            Spacer(
              flex: 1,
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: FediSizes.bigPadding,
              ),
              child: buildHostTextField(context),
            ),
            Padding(
              padding: FediPadding.verticalBigPadding,
              child: buildActionButtons(context),
            ),
            Spacer(
              flex: 1,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: FediSizes.bigPadding,
              ),
              child: buildTermsOfServiceButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTermsOfServiceButton(BuildContext context) {
    var textStyle = FediTextStyles.mediumShortWhite;
    return InkWell(
      onTap: () {
        goToTosPage(context);
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: tr("app.auth.instance.join.action.tos.prefix"),
              style: textStyle,
            ),
            TextSpan(
              text: tr("app.auth.instance.join.action.tos.terms"),
              style: textStyle.copyWith(
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: tr("app.auth.instance.join.action.tos.postfix"),
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildActionButtons(BuildContext context) => Padding(
        padding: FediPadding.horizontalSmallPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                    left: FediSizes.smallPadding,
                    right: FediSizes.smallPadding),
                child: FediTransparentTextButton(
                  tr("app.auth.instance.join.action.sign_up"),
                  onPressed: () {
                    signUpToInstance(context);
                  },
                  color: FediColors.white,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                    left: FediSizes.smallPadding,
                    right: FediSizes.smallPadding),
                child: FediTransparentTextButton(
                  tr("app.auth.instance.join.action.login"),
                  onPressed: () {
                    logInToInstance(context);
                  },
                  color: FediColors.white,
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildHostTextField(BuildContext context) {
    var joinInstanceBloc = IJoinAuthInstanceBloc.of(context, listen: true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FediTransparentEditTextField(
          autocorrect: false,
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
          keyboardType: TextInputType.url,
          errorText: null,
          focusNode: null,
          displayUnderlineBorder: true,
          customBorderColor: FediColors.white.withOpacity(0.8),
          textStyle: FediTextStyles.subHeaderTallWhite,
          highlightMentions: false,
        ),
        Text(
          "app.auth.instance.join.field.host.helper".tr(),
          style: FediTextStyles.mediumShortWhite
              .copyWith(color: FediColors.white.withOpacity(0.5)),
        )
      ],
    );
  }

  Widget buildLogoWidget() => StreamBuilder<bool>(
      stream: KeyboardVisibility.onChange,
      builder: (context, snapshot) {
        var shown = snapshot.data;

        double width;
        if (shown == true) {
          width = 75.0;
        } else {
          width = 175.0;
        }

        return Image(
          image: AssetImage("assets/images/theme/logo.png"),
          width: width,
        );
      });

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
    var asyncDialogResult = await doAsyncOperationWithFediDialog(
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
      goToRegisterAuthInstancePage(context, instanceBaseUrl: hostUri,
          successRegistrationCallback: () {
        if (!isFromScratch) {
          // exit from join from scratch
          Navigator.of(context).pop();
          // exit from bottom modal dialog, todo: refactor
          Navigator.of(context).pop();
        }
      });
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
    var dialogResult = await doAsyncOperationWithFediDialog(
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
