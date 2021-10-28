import 'package:fedi_app/app/about/about_page.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/access/join/join_access_bloc.dart';
import 'package:fedi_app/app/access/join/join_access_widget_keys.dart';
import 'package:fedi_app/app/access/register/register_access_page.dart';
import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi_app/app/auth/host/access_host_bloc_impl.dart';
import 'package:fedi_app/app/config/config_service.dart';
import 'package:fedi_app/app/instance/details/remote/remote_instance_details_page.dart';
import 'package:fedi_app/app/server_list/server_list_auto_complete_widget.dart';
import 'package:fedi_app/app/toast/toast_service.dart';
import 'package:fedi_app/app/tos/tos_page.dart';
import 'package:fedi_app/app/ui/button/text/with_border/fedi_transparent_text_button_with_border.dart';
import 'package:fedi_app/app/ui/edit_text/fedi_transparent_edit_text_field.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:fedi_app/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/app/url/url_helper.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger = Logger('join_access_widget.dart');

class JoinAccessWidget extends StatelessWidget {
  const JoinAccessWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        behavior: HitTestBehavior.translucent,
        child: Padding(
          padding: FediPadding.allBigPadding,
          child: Column(
            children: <Widget>[
              const Spacer(
                flex: 1,
              ),
              const Padding(
                padding: FediPadding.allSmallPadding,
                child: _JoinUnifediApiAccessLogoWidget(),
              ),
              const Spacer(
                flex: 1,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  bottom: FediSizes.bigPadding,
                ),
                child: _JoinUnifediApiAccessHostTextFieldWidget(),
              ),
              const Padding(
                padding: FediPadding.verticalBigPadding,
                child: _JoinUnifediApiAccessActionsWidget(),
              ),
              const _JoinUnifediApiAccessHelpMeChooseWidget(),
              const Spacer(
                flex: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: FediSizes.bigPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    _JoinUnifediApiAccessTermsOfServiceButtonWidget(),
                    _JoinUnifediApiAccessAboutButtonWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

class _JoinUnifediApiAccessHelpMeChooseWidget extends StatelessWidget {
  const _JoinUnifediApiAccessHelpMeChooseWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var configService = IConfigService.of(context);

    var helpChooseInstanceUrl = configService.helpChooseInstanceUrl;
    if (helpChooseInstanceUrl != null) {
      return InkWell(
        onTap: () => UrlHelper.handleUrlClick(
          context: context,
          url: helpChooseInstanceUrl,
        ),
        child: Padding(
          padding: FediPadding.allMediumPadding,
          child: Text(
            S.of(context).app_auth_instance_join_action_helpMeChooseInstance,
            style: IFediUiTextTheme.of(context).mediumLightGrey.copyWith(
                  decoration: TextDecoration.underline,
                ),
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class _JoinUnifediApiAccessActionsWidget extends StatelessWidget {
  const _JoinUnifediApiAccessActionsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: FediPadding.horizontalSmallPadding,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Expanded(
                  flex: 1,
                  child: _JoinUnifediApiAccessSignUpButtonWidget(
                    key: Key(JoinAccessWidgetKeys.signUpButtonKey),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: _JoinUnifediApiAccessLoginButtonWidget(
                    key: Key(JoinAccessWidgetKeys.loginButtonKey),
                  ),
                ),
              ],
            ),
            const FediBigVerticalSpacer(),
            const _JoinUnifediApiAccessExploreAsGuestButtonWidget(),
          ],
        ),
      );
}

class _JoinUnifediApiAccessLoginButtonWidget extends StatelessWidget {
  const _JoinUnifediApiAccessLoginButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          left: FediSizes.smallPadding,
          // ignore: no-equal-arguments
          right: FediSizes.smallPadding,
        ),
        child: FediTransparentTextButtonWithBorder(
          S.of(context).app_auth_instance_join_action_login,
          onPressed: () {
            logInToInstance(context);
          },
          color: IFediUiColorTheme.of(context).white,
          expanded: true,
        ),
      );
}

class _JoinUnifediApiAccessExploreAsGuestButtonWidget extends StatelessWidget {
  const _JoinUnifediApiAccessExploreAsGuestButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var joinInstanceBloc = IJoinAccessBloc.of(context);

    return Padding(
      padding: const EdgeInsets.only(
        left: FediSizes.smallPadding,
        // ignore: no-equal-arguments
        right: FediSizes.smallPadding,
      ),
      child: FediTransparentTextButtonWithBorder(
        S.of(context).app_auth_instance_join_action_exploreAsGuest,
        key: const Key(JoinAccessWidgetKeys.exploreAsGuestButtonKey),
        onPressed: () {
          var hostUri = joinInstanceBloc.extractCurrentUri();
          goToRemoteInstanceDetailsPage(
            context,
            remoteInstanceUri: hostUri,
          );
        },
        color: IFediUiColorTheme.of(context).white,
        expanded: true,
      ),
    );
  }
}

class _JoinUnifediApiAccessSignUpButtonWidget extends StatelessWidget {
  const _JoinUnifediApiAccessSignUpButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          left: FediSizes.smallPadding,
          // ignore: no-equal-arguments
          right: FediSizes.smallPadding,
        ),
        child: FediTransparentTextButtonWithBorder(
          S.of(context).app_auth_instance_join_action_signUp,
          onPressed: () {
            signUpToInstance(context);
          },
          color: IFediUiColorTheme.of(context).white,
          expanded: true,
        ),
      );
}

class _JoinUnifediApiAccessHostTextFieldWidget extends StatelessWidget {
  const _JoinUnifediApiAccessHostTextFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var joinInstanceBloc = IJoinAccessBloc.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ServerListAutoCompleteWidget(
          textEditingController: joinInstanceBloc.hostTextController,
          focusNode: joinInstanceBloc.hostFocusNode,
          fieldViewBuilder: (
            BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted,
          ) =>
              FediTransparentEditTextField(
            key: const Key(JoinAccessWidgetKeys.hostTextFieldKey),
            autocorrect: false,
            expanded: false,
            hintText: IConfigService.of(context).appDefaultInstanceUrl,
            onSubmitted: (String value) {
              logInToInstance(context);
            },
            textInputAction: TextInputAction.go,
            autofocus: false,
            maxLines: 1,
            textEditingController: textEditingController,
            keyboardType: TextInputType.url,
            errorText: null,
            focusNode: focusNode,
            displayUnderlineBorder: true,
            customBorderColor:
                // todo: refactor
                // ignore: no-magic-number
                IFediUiColorTheme.of(context).white.withOpacity(0.8),
            textStyle: IFediUiTextTheme.of(context).subHeaderTallWhite,
            highlightMentions: false,
            maxLength: null,
          ),
        ),
        Text(
          S.of(context).app_auth_instance_join_field_host_helper,
          style: IFediUiTextTheme.of(context).mediumShortWhite.copyWith(
                // todo: refactor
                // ignore: no-magic-number
                color: IFediUiColorTheme.of(context).white.withOpacity(0.5),
              ),
        ),
      ],
    );
  }
}

class _JoinUnifediApiAccessLogoWidget extends StatelessWidget {
  const _JoinUnifediApiAccessLogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          double width;
          if (isKeyboardVisible) {
            // todo: refactor
            // ignore: no-magic-number
            width = 75.0;
          } else {
            // todo: refactor
            // ignore: no-magic-number
            width = 175.0;
          }

          return Image(
            image: const AssetImage('assets/images/theme/logo.png'),
            width: width,
          );
        },
      );
}

class _JoinUnifediApiAccessTermsOfServiceButtonWidget extends StatelessWidget {
  const _JoinUnifediApiAccessTermsOfServiceButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              text: ' ',
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
}

class _JoinUnifediApiAccessAboutButtonWidget extends StatelessWidget {
  const _JoinUnifediApiAccessAboutButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          goToAboutPage(
            context: context,
          );
        },
        child: Text(
          S.of(context).app_auth_instance_join_action_about,
          style: IFediUiTextTheme.of(context).mediumShortWhite.copyWith(
                decoration: TextDecoration.underline,
              ),
        ),
      );
}

// ignore: long-method
Future<void> signUpToInstance(BuildContext context) async {
  var joinInstanceBloc = IJoinAccessBloc.of(context, listen: false);
  var hostUri = joinInstanceBloc.extractCurrentUri();
  var asyncDialogResult =
      await UnifediAsyncOperationHelper.performUnifediAsyncOperation(
    context: context,
    contentMessage:
        S.of(context).app_auth_instance_join_progress_dialog_content,
    asyncCode: () async {
      AccessHostBloc accessHostBloc;
      accessHostBloc = AccessHostBloc.createFromContext(
        context,
        instanceBaseUri: hostUri,
      );

      await accessHostBloc.performAsyncInit();
      await accessHostBloc.registerApplication();
      await accessHostBloc.loadInstanceDetails(forceRefresh: true);
      await accessHostBloc.dispose();

      return accessHostBloc.memoryUnifediApiAccessBloc.access.instance;
    },
  );
  var unifediApiInstance = asyncDialogResult.result;
  if (unifediApiInstance != null) {
    var toastService = IToastService.of(context, listen: false);
    if (unifediApiInstance.invitesEnabled == true) {
      toastService.showErrorToast(
        context: context,
        title: S.of(context).app_auth_instance_join_invitesOnly_dialog_title,
        content:
            S.of(context).app_auth_instance_join_invitesOnly_dialog_content,
      );
    } else if (unifediApiInstance.registrations != true) {
      toastService.showErrorToast(
        context: context,
        title: S
            .of(context)
            .app_auth_instance_join_registrationDisabled_dialog_title,
      );
    } else {
      var registerResponse = await goToRegisterUnifediApiAccessPage(
        context,
        instanceBaseUri: hostUri,
      );
      if (registerResponse != null) {
        var response = registerResponse.response;
        var access = registerResponse.access;

        if (response.approvalRequired == true) {
          _showApprovalRequiredToast(context);
        } else if (response.emailConformationRequired == true) {
          _showEmailConfirmationRequiredToast(context);
        } else {
          if (access != null) {
            await ICurrentAccessBloc.of(
              context,
              listen: false,
            ).changeCurrentInstance(
              access.toUnifediApiAccess(),
            );
          } else {
            _showCantLoginToast(
              context,
              errorDescription: null,
            );
          }
        }

        if (!joinInstanceBloc.isFromScratch) {
          // exit from join from scratch
          Navigator.of(context).pop();
          // exit from bottom modal dialog, todo: refactor
          Navigator.of(context).pop();
        }
      }
    }
  }
}

void _showApprovalRequiredToast(BuildContext context) {
  IToastService.of(context, listen: false).showInfoToast(
    context: context,
    title: S
        .of(context)
        .app_auth_instance_register_approvalRequired_notification_title,
    content: S
        .of(context)
        .app_auth_instance_register_approvalRequired_notification_content,
  );
}

void _showEmailConfirmationRequiredToast(BuildContext context) {
  IToastService.of(context, listen: false).showInfoToast(
    context: context,
    title: S
        .of(context)
        .app_auth_instance_register_emailConfirmationRequired_notification_title,
    content: S
        .of(context)
        .app_auth_instance_register_emailConfirmationRequired_notification_content,
  );
}

void _showCantLoginToast(
  BuildContext context, {
  required String? errorDescription,
}) {
  IToastService.of(context, listen: false).showInfoToast(
    context: context,
    title:
        S.of(context).app_auth_instance_register_cantLogin_notification_title,
    content:
        S.of(context).app_auth_instance_register_cantLogin_notification_content(
              errorDescription ?? '',
            ),
  );
}

// ignore: long-method
Future<void> logInToInstance(BuildContext context) async {
  var joinInstanceBloc = IJoinAccessBloc.of(context, listen: false);

  var configService = IConfigService.of(context, listen: false);

  var hostUri = joinInstanceBloc.extractCurrentUri();

  var preDefinedApiAccess =
      configService.tryFindPreDefinedApiAccessForHost(hostUri: hostUri);

  var dialogResult = await UnifediAsyncOperationHelper
      .performUnifediAsyncOperation<UnifediApiAccess?>(
    context: context,
    contentMessage:
        S.of(context).app_auth_instance_join_progress_dialog_content,
    cancelable: true,
    asyncCode: () async {
      if (preDefinedApiAccess == null) {
        AccessHostBloc? bloc;
        try {
          bloc = AccessHostBloc.createFromContext(
            context,
            instanceBaseUri: hostUri,
          );
          await bloc.performAsyncInit();
          var instance = await bloc.launchLoginToAccount();

          return instance;
        } finally {
          await bloc?.dispose();
        }
      } else {
        return preDefinedApiAccess;
      }
    },
  );

  var authInstance = dialogResult.result;
  if (authInstance != null) {
    _logger.finest(() => 'before pop');
    if (!joinInstanceBloc.isFromScratch) {
      Navigator.pop(context);
      Navigator.pop(context);
    }

    _logger.finest(() => 'after pop before change auth');

    await ICurrentAccessBloc.of(context, listen: false).changeCurrentInstance(
      authInstance,
    );
    _logger.finest(() => 'after auth');
  }
}
