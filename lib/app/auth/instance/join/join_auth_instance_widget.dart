import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/app/auth/host/auth_host_model.dart';
import 'package:fedi/app/auth/instance/auth_instance_pleroma_rest_error_data.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/join/join_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_page.dart';
import 'package:fedi/app/tos/tos_page.dart';
import 'package:fedi/app/ui/button/text/fedi_transparent_text_button.dart';
import 'package:fedi/app/ui/edit_text/fedi_transparent_edit_text_field.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/error/error_data_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:logging/logging.dart';

var _logger = Logger("join_auth_instance_widget.dart");
const _defaultInstanceDomain = "fedi.app";

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
    var textStyle = IFediUiTextTheme.of(context).mediumShortWhite;
    return InkWell(
      onTap: () {
        goToTosPage(context);
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: S.of(context).app_auth_instance_join_action_tos_prefix,
              style: textStyle,
            ),
            TextSpan(
              text: S.of(context).app_auth_instance_join_action_tos_terms,
              style: textStyle.copyWith(
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: S.of(context).app_auth_instance_join_action_tos_postfix,
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
                  S.of(context).app_auth_instance_join_action_signUp,
                  onPressed: () {
                    signUpToInstance(context);
                  },
                  color: IFediUiColorTheme.of(context).white,
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
                  S.of(context).app_auth_instance_join_action_login,
                  onPressed: () {
                    logInToInstance(context);
                  },
                  color: IFediUiColorTheme.of(context).white,
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
          hintText: S.of(context).app_auth_instance_join_field_host_hint,
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
          customBorderColor:
              IFediUiColorTheme.of(context).white.withOpacity(0.8),
          textStyle: IFediUiTextTheme.of(context).subHeaderTallWhite,
          highlightMentions: false,
          maxLength: null,
        ),
        Text(
          S.of(context).app_auth_instance_join_field_host_helper,
          style: IFediUiTextTheme.of(context).mediumShortWhite.copyWith(
              color: IFediUiColorTheme.of(context).white.withOpacity(0.5)),
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

    if (uriText?.isNotEmpty != true) {
      uriText = _defaultInstanceDomain;
    }

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
    var asyncDialogResult =
        await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
            context: context,
            contentMessage:
                S.of(context).app_auth_instance_join_progress_dialog_content,
            asyncCode: () async {
              AuthHostBloc authHostBloc;
              authHostBloc = AuthHostBloc.createFromContext(
                context,
                instanceBaseUrl: hostUri,
              );
              await authHostBloc.checkApplicationRegistration();
              await authHostBloc.checkIsRegistrationsEnabled();
              await authHostBloc?.dispose();
            },
            errorDataBuilders: [
          (
            context,
            error,
            stackTrace,
          ) {
            if (error is DisabledRegistrationAuthHostException) {
              return createRegistrationDisabledErrorData(
                context,
                error,
                stackTrace,
              );
            } else if (error is InvitesOnlyRegistrationAuthHostException) {
              return createRegistrationInvitesOnlyErrorData(
                context,
                error,
                stackTrace,
              );
            } else {
              return null;
            }
          },
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
      AuthInstancePleromaRestErrorData.createFromContext(
        context: context,
        error: error,
        stackTrace: stackTrace,
      );

  ErrorData createRegistrationDisabledErrorData(
          BuildContext context, error, StackTrace stackTrace) =>
      ErrorData(
        error: error,
        stackTrace: stackTrace,
        titleText: S
            .of(context)
            .app_auth_instance_join_registrationDisabled_dialog_title,
        contentText: S
            .of(context)
            .app_auth_instance_join_registrationDisabled_dialog_content,
      );

  ErrorData createRegistrationInvitesOnlyErrorData(
          BuildContext context, error, StackTrace stackTrace) =>
      ErrorData(
        error: error,
        stackTrace: stackTrace,
        titleText:
            S.of(context).app_auth_instance_join_invitesOnly_dialog_title,
        contentText:
            S.of(context).app_auth_instance_join_invitesOnly_dialog_content,
      );

  Future logInToInstance(BuildContext context) async {
    var joinInstanceBloc = IJoinAuthInstanceBloc.of(context, listen: false);
    var dialogResult =
        await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
            context: context,
            contentMessage:
            S.of(context).app_auth_instance_join_progress_dialog_content,
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
                await bloc?.dispose();
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
