import 'dart:convert';
import 'dart:io';

import 'package:fedi/app/about/about_page.dart';
import 'package:fedi/app/app_model.dart';
import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/app/auth/host/auth_host_model.dart';

import 'package:fedi/app/access/auth_instance_pleroma_rest_error_data.dart';
import 'package:fedi/app/access/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/access/join/join_auth_instance_bloc.dart';
import 'package:fedi/app/access/join/join_auth_instance_widget_keys.dart';
import 'package:fedi/app/access/register/register_auth_instance_page.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/instance/details/remote/remote_instance_details_page.dart';
import 'package:fedi/app/server_list/server_list_auto_complete_widget.dart';
import 'package:fedi/app/tos/tos_page.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_transparent_text_button_with_border.dart';
import 'package:fedi/app/ui/edit_text/fedi_transparent_edit_text_field.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:fedi/error/error_data_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger = Logger('join_auth_instance_widget.dart');

class JoinUnifediApiAccessWidget extends StatelessWidget {
  const JoinUnifediApiAccessWidget({
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
              Spacer(
                flex: 1,
              ),
              Padding(
                padding: FediPadding.allSmallPadding,
                child: const _JoinUnifediApiAccessLogoWidget(),
              ),
              Spacer(
                flex: 1,
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: FediSizes.bigPadding,
                ),
                child: const _JoinUnifediApiAccessHostTextFieldWidget(),
              ),
              Padding(
                padding: FediPadding.verticalBigPadding,
                child: const _JoinUnifediApiAccessActionsWidget(),
              ),
              const _JoinUnifediApiAccessHelpMeChooseWidget(),
              Spacer(
                flex: 1,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: FediSizes.bigPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const _JoinUnifediApiAccessTermsOfServiceButtonWidget(),
                    const _JoinUnifediApiAccessAboutButtonWidget(),
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
  Widget build(BuildContext context) {
    return Padding(
      padding: FediPadding.horizontalSmallPadding,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: const _JoinUnifediApiAccessSignUpButtonWidget(
                  key: Key(JoinUnifediApiAccessWidgetKeys.signUpButtonKey),
                ),
              ),
              Expanded(
                flex: 1,
                child: const _JoinUnifediApiAccessLoginButtonWidget(
                  key: Key(JoinUnifediApiAccessWidgetKeys.loginButtonKey),
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
}

class _JoinUnifediApiAccessLoginButtonWidget extends StatelessWidget {
  const _JoinUnifediApiAccessLoginButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
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
}

class _JoinUnifediApiAccessExploreAsGuestButtonWidget extends StatelessWidget {
  const _JoinUnifediApiAccessExploreAsGuestButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var joinInstanceBloc = IJoinUnifediApiAccessBloc.of(context);

    return Padding(
      padding: EdgeInsets.only(
        left: FediSizes.smallPadding,
        // ignore: no-equal-arguments
        right: FediSizes.smallPadding,
      ),
      child: FediTransparentTextButtonWithBorder(
        S.of(context).app_auth_instance_join_action_exploreAsGuest,
        key: Key(JoinUnifediApiAccessWidgetKeys.exploreAsGuestButtonKey),
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
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
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
}

class _JoinUnifediApiAccessHostTextFieldWidget extends StatelessWidget {
  const _JoinUnifediApiAccessHostTextFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var joinInstanceBloc = IJoinUnifediApiAccessBloc.of(context);

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
            key: Key(JoinUnifediApiAccessWidgetKeys.hostTextFieldKey),
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
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
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
          image: AssetImage('assets/images/theme/logo.png'),
          width: width,
        );
      },
    );
  }
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

Future signUpToInstance(BuildContext context) async {
  var joinInstanceBloc = IJoinUnifediApiAccessBloc.of(context, listen: false);
  var hostUri = joinInstanceBloc.extractCurrentUri();
  var asyncDialogResult =
      await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
    context: context,
    contentMessage:
        S.of(context).app_auth_instance_join_progress_dialog_content,
    asyncCode: () async {
      AuthHostBloc authHostBloc;
      authHostBloc = AuthHostBloc.createFromContext(
        context,
        instanceBaseUri: hostUri,
      );
      await authHostBloc.checkApplicationRegistration();
      await authHostBloc.checkIsRegistrationsEnabled();
      await authHostBloc.dispose();
    },
    errorDataBuilders: _createSignUpErrorDataBuilders(),
  );
  if (asyncDialogResult.success) {
    var registrationResult = await goToRegisterUnifediApiAccessPage(
      context,
      instanceBaseUri: hostUri,
    );
    if (registrationResult != null && !joinInstanceBloc.isFromScratch) {
      // exit from join from scratch
      Navigator.of(context).pop();
      // exit from bottom modal dialog, todo: refactor
      Navigator.of(context).pop();
    }
  }
}

List<ErrorDataBuilder> _createSignUpErrorDataBuilders() {
  return [
    (context, error, stackTrace) {
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
    (context, error, stackTrace) {
      // todo: handle specific error
      return createInstanceDeadErrorData(
        context,
        error,
        stackTrace,
      );
    },
  ];
}

ErrorData createInstanceDeadErrorData(
  BuildContext? context,
  error,
  StackTrace stackTrace,
) =>
    UnifediApiAccessUnifediApiRestErrorData.createFromContext(
      context: context,
      error: error,
      stackTrace: stackTrace,
    );

ErrorData createRegistrationDisabledErrorData(
  BuildContext? context,
  error,
  StackTrace stackTrace,
) =>
    ErrorData(
      error: error,
      stackTrace: stackTrace,
      titleCreator: (context) => S
          .of(context)
          .app_auth_instance_join_registrationDisabled_dialog_title,
      contentCreator: null,
    );

ErrorData createRegistrationInvitesOnlyErrorData(
  BuildContext? context,
  error,
  StackTrace stackTrace,
) =>
    ErrorData(
      error: error,
      stackTrace: stackTrace,
      titleCreator: (context) =>
          S.of(context).app_auth_instance_join_invitesOnly_dialog_title,
      contentCreator: (context) =>
          S.of(context).app_auth_instance_join_invitesOnly_dialog_content,
    );

// ignore: long-method
Future logInToInstance(BuildContext context) async {
  var joinInstanceBloc = IJoinUnifediApiAccessBloc.of(context, listen: false);

  var configService = IConfigService.of(context, listen: false);

  var appLaunchType = configService.appLaunchType;
  _logger.finest(() => 'logInToInstance $appLaunchType');

  var dialogResult = await PleromaAsyncOperationHelper
      .performPleromaAsyncOperation<UnifediApiAccess?>(
    context: context,
    contentMessage:
        S.of(context).app_auth_instance_join_progress_dialog_content,
    cancelable: true,
    asyncCode: () async {
      switch (appLaunchType) {
        case AppLaunchType.normal:
          var hostUri = joinInstanceBloc.extractCurrentUri();
          AuthHostBloc? bloc;
          try {
            bloc = AuthHostBloc.createFromContext(
              context,
              instanceBaseUri: hostUri,
            );
            await bloc.performAsyncInit();
            var instance = await bloc.launchLoginToAccount();

            return instance;
          } finally {
            await bloc?.dispose();
          }

        case AppLaunchType.mock:
          var testUnifediApiAccessJsonString;
          if (Platform.isAndroid) {
            testUnifediApiAccessJsonString =
                configService.androidTestUnifediApiAccessJson!;
          } else {
            testUnifediApiAccessJsonString =
                configService.iosTestUnifediApiAccessJson!;
          }

          var testUnifediApiAccessJson =
              jsonDecode(testUnifediApiAccessJsonString);

          return UnifediApiAccess.fromJson(testUnifediApiAccessJson);
      }
    },
    errorDataBuilders: [
      (context, error, stackTrace) {
        // todo: handle specific error
        return createInstanceDeadErrorData(
          context,
          error,
          stackTrace,
        );
      },
    ],
  );

  var authInstance = dialogResult.result;
  if (authInstance != null) {
    _logger.finest(() => 'before pop');
    if (!joinInstanceBloc.isFromScratch) {
      Navigator.pop(context);
      Navigator.pop(context);
    }

    _logger.finest(() => 'after pop before change auth');

    await ICurrentUnifediApiAccessBloc.of(context, listen: false)
        .changeCurrentInstance(
      authInstance,
    );
    _logger.finest(() => 'after auth');
  }
}
