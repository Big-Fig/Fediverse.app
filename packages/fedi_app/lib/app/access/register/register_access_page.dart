import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/access/register/register_access_bloc.dart';
import 'package:fedi_app/app/access/register/register_access_bloc_impl.dart';
import 'package:fedi_app/app/access/register/register_access_page_keys.dart';
import 'package:fedi_app/app/access/register/register_access_widget.dart';
import 'package:fedi_app/app/access/register/response/register_access_response_model.dart';
import 'package:fedi_app/app/auth/oauth_last_launched/local_preferences/auth_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:fedi_app/app/config/config_service.dart';
import 'package:fedi_app/app/localization/settings/local_preferences/localization_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_dismiss_icon_button.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';
import 'package:fedi_app/localization/localization_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterAccessPage extends StatelessWidget {
  const RegisterAccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var registerUnifediApiAccessBloc = IRegisterAccessBloc.of(context);

    var instanceBaseUri = registerUnifediApiAccessBloc.instanceBaseUri;

    var urlOnInstanceForDisplay =
        IConfigService.of(context).processUrlOnInstanceForDisplay(
      urlOnInstance: instanceBaseUri.toString(),
    );

    return Scaffold(
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_auth_instance_register_title(
              Uri.parse(urlOnInstanceForDisplay).host,
            ),
        leading: const FediDismissIconButton(),
      ),
      body: const SafeArea(
        child: RegisterAccessWidget(
          onRegister: _onRegister,
          key: Key(
            RegisterAccessPageKeys.registerAccessWidgetKey,
          ),
        ),
      ),
    );
  }
}

void _onRegister(
  BuildContext context,
  RegisterAccessResponse registerResponse,
) {
  Navigator.pop(context, registerResponse);
}

// ignore: long-method
Future<RegisterAccessResponse?> goToRegisterUnifediApiAccessPage(
  BuildContext context, {
  required Uri instanceBaseUri,
}) =>
    Navigator.push<RegisterAccessResponse>(
      context,
      MaterialPageRoute(
        builder: (context) => DisposableProvider<IRegisterAccessBloc>(
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

            var registerUnifediApiAccessBloc = RegisterAccessBloc(
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
              currentInstanceBloc: ICurrentAccessBloc.of(
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
          child: const RegisterAccessPage(),
        ),
      ),
    );
