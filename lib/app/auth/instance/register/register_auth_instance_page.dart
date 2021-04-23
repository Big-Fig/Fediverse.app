import 'package:fedi/app/auth/host/auth_host_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_bloc_impl.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_widget.dart';
import 'package:fedi/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi/app/toast/toast_service.dart';
import 'package:fedi/app/ui/button/icon/fedi_dismiss_icon_button.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_api_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterAuthInstancePage extends StatelessWidget {
  const RegisterAuthInstancePage();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediPageTitleAppBar(
          title: S.of(context).app_auth_instance_register_title,
          leading: const FediDismissIconButton(),
        ),
        body: const SafeArea(
          child: RegisterAuthInstanceWidget(),
        ),
      );
}

Future<AuthHostRegistrationResult?> goToRegisterAuthInstancePage(
  BuildContext context, {
  required Uri instanceBaseUri,
}) async =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisposableProvider<IRegisterAuthInstanceBloc>(
          create: (context) {
            var registerAuthInstanceBloc = RegisterAuthInstanceBloc(
              instanceBaseUri: instanceBaseUri,
              localPreferencesService: ILocalPreferencesService.of(
                context,
                listen: false,
              ),
              connectionService: IConnectionService.of(
                context,
                listen: false,
              ),
              currentInstanceBloc: ICurrentAuthInstanceBloc.of(
                context,
                listen: false,
              ),
              pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc:
                  IPleromaApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc.of(
                context,
                listen: false,
              ),
              localizationSettingsBloc: ILocalizationSettingsBloc.of(
                context,
                listen: false,
              ),
            );

            registerAuthInstanceBloc.addDisposable(
              streamSubscription:
                  registerAuthInstanceBloc.successRegistrationStream.listen(
                (AuthHostRegistrationResult registrationResult) async {
                  if (registrationResult.isPossibleToLogin) {
                    await ICurrentAuthInstanceBloc.of(context, listen: false)
                        .changeCurrentInstance(
                      registrationResult.authInstance!,
                    );
                  } else {
                    if (registrationResult.approvalRequired!) {
                      _showApprovalRequiredToast(context);
                    } else if (registrationResult.emailConfirmationRequired) {
                      _showEmailConfirmationRequiredToast(context);
                    } else {
                      _showCantLoginToast(
                        context,
                        errorDescription: registrationResult
                            .authInstanceFetchError
                            ?.toString(),
                      );
                    }
                  }

                  Navigator.pop(context, registrationResult);
                },
              ),
            );

            return registerAuthInstanceBloc;
          },
          child: const RegisterAuthInstancePage(),
        ),
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
              errorDescription ?? "",
            ),
  );
}
