import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/access/register/register_access_bloc.dart';
import 'package:fedi/app/access/register/register_access_bloc_impl.dart';
import 'package:fedi/app/access/register/register_access_page_keys.dart';
import 'package:fedi/app/access/register/register_access_widget.dart';
import 'package:fedi/app/access/register/response/register_response_model.dart';
import 'package:fedi/app/auth/oauth_last_launched/local_preferences/auth_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/localization/settings/local_preferences/localization_settings_local_preference_bloc.dart';
import 'package:fedi/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_dismiss_icon_button.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterUnifediApiAccessPage extends StatelessWidget {
  const RegisterUnifediApiAccessPage({Key? key}) : super(key: key);

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
          onRegister: _onRegister,
          key: Key(
            RegisterUnifediApiAccessPageKeys.registerUnifediApiAccessWidgetKey,
          ),
        ),
      ),
    );
  }
}

void _onRegister(
  BuildContext context,
  RegisterResponse registerResponse,
) {
  Navigator.pop(context, registerResponse);
}

// ignore: long-method
Future<RegisterResponse?> goToRegisterUnifediApiAccessPage(
  BuildContext context, {
  required Uri instanceBaseUri,
}) =>
    Navigator.push<RegisterResponse>(
      context,
      MaterialPageRoute(
        builder: (context) => DisposableProvider<IRegisterUnifediApiAccessBloc>(
          create: (context) {
            var localizationSettingsLocalPreferenceBloc =
                ILocalizationSettingsLocalPreferenceBloc.of(
              context,
              listen: false,
            );

            // var platformLocaleName = Platform.localeName;
            // var localeName = .languageCode ??
            //     platformLocaleName;
            //
            var localeName = LocalizationLocale
                .calculateLocaleBaseOnLocalizationLocaleOrPlatformLocale(
              localizationLocale: localizationSettingsLocalPreferenceBloc
                  .value?.localizationLocale,
            ).languageCode;

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
              unifediOAuthLastLaunchedHostToLoginLocalPreferenceBloc:
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

            return registerUnifediApiAccessBloc;
          },
          child: const RegisterUnifediApiAccessPage(),
        ),
      ),
    );
