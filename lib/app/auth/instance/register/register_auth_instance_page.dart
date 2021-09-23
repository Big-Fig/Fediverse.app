import 'dart:io';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/auth/host/auth_host_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_bloc_impl.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_page_keys.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_widget.dart';
import 'package:fedi/app/auth/oauth_last_launched/local_preferences/auth_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/localization/settings/local_preferences/localization_settings_local_preference_bloc.dart';
import 'package:fedi/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi/app/toast/toast_service.dart';
import 'package:fedi/app/ui/button/icon/fedi_dismiss_icon_button.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class RegisterUnifediApiAccessPage extends StatelessWidget {
  const RegisterUnifediApiAccessPage();

  @override
  Widget build(BuildContext context) {
    var registerUnifediApiAccessBloc =
        IRegisterUnifediApiAccessBloc.of(context);

    return Scaffold(
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_auth_instance_register_title(
              registerUnifediApiAccessBloc.instanceBaseUri.host,
            ),
        leading: const FediDismissIconButton(),
      ),
      body: const SafeArea(
        child: RegisterUnifediApiAccessWidget(
          key: Key(
            RegisterUnifediApiAccessPageKeys.registerUnifediApiAccessWidgetKey,
          ),
        ),
      ),
    );
  }
}

// ignore: long-method
Future<AuthHostRegistrationResult?> goToRegisterUnifediApiAccessPage(
  BuildContext context, {
  required Uri instanceBaseUri,
}) async =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DisposableProvider<IRegisterUnifediApiAccessBloc>(
            create: (context) {
              var localizationSettingsLocalPreferenceBloc =
                  ILocalizationSettingsLocalPreferenceBloc.of(
                context,
                listen: false,
              );

              var localeName = localizationSettingsLocalPreferenceBloc
                      .value?.localizationLocale?.localeString ??
                  Platform.localeName;

              var registerUnifediApiAccessBloc = RegisterUnifediApiAccessBloc(
                localeName: localeName,
                instanceBaseUri: instanceBaseUri,
                localPreferencesService: ILocalPreferencesService.of(
                  context,
                  listen: false,
                ),
                connectionService: Provider.of<IConnectionService>(
                  context,
                  listen: false,
                ),
                currentInstanceBloc: ICurrentUnifediApiAccessBloc.of(
                  context,
                  listen: false,
                ),
                pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc:
                    IAuthApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc.of(
                  context,
                  listen: false,
                ),
                localizationSettingsBloc: ILocalizationSettingsBloc.of(
                  context,
                  listen: false,
                ),
                configService: IConfigService.of(
                  context,
                  listen: false,
                ),
              );

              registerUnifediApiAccessBloc.registrationResultStream.listen(
                (AuthHostRegistrationResult registrationResult) async {
                  if (registrationResult.isPossibleToLogin) {
                    await ICurrentUnifediApiAccessBloc.of(
                      context,
                      listen: false,
                    ).changeCurrentInstance(
                      registrationResult.authInstance!,
                    );
                  } else {
                    if (registrationResult.approvalRequired) {
                      _showApprovalRequiredToast(context);
                    } else if (registrationResult.emailConfirmationRequired) {
                      _showEmailConfirmationRequiredToast(context);
                    } else {
                      var error = registrationResult.anyError;
                      if (error is IUnifediApiRestErrorException) {
                        _showCantLoginToast(
                          context,
                          errorDescription:
                              error.unifediError.descriptionOrContent,
                        );
                      } else {
                        _showCantLoginToast(
                          context,
                          errorDescription: error?.toString(),
                        );
                      }
                    }
                  }

                  Navigator.pop(context, registrationResult);
                },
              ).disposeWith(registerUnifediApiAccessBloc);

              return registerUnifediApiAccessBloc;
            },
            child: const RegisterUnifediApiAccessPage(),
          );
        },
      ),
    );

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
