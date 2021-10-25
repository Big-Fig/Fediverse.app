import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/access/local_preferences/access_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi_app/app/auth/oauth_last_launched/local_preferences/auth_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:fedi_app/app/config/config_service.dart';
import 'package:fedi_app/app/init/deep_link/deep_link_init_bloc.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:logging/logging.dart';
import 'package:uni_links/uni_links.dart';

var _logger = Logger('deep_link_init_bloc_impl.dart');

class DeepLinkInitBloc extends AsyncInitLoadingBloc
    implements IDeepLinkInitBloc {
  final IAuthApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc
      oAuthLastLaunchedHostToLoginLocalPreferenceBloc;
  final ILocalPreferencesService localPreferencesService;
  final IConnectionService connectionService;
  final ICurrentAccessBloc currentUnifediApiAccessBloc;
  final IConfigService configService;

  DeepLinkInitBloc({
    required this.oAuthLastLaunchedHostToLoginLocalPreferenceBloc,
    required this.localPreferencesService,
    required this.connectionService,
    required this.currentUnifediApiAccessBloc,
    required this.configService,
  });

  @override
  Future<void> internalAsyncInit() async {
    var initialUri = await getInitialUri();

    if (initialUri != null) {
      await _handleLoginOnAndroidWithoutChrome(initialUri);
    }
  }

  Future<void> _handleLoginOnAndroidWithoutChrome(Uri initialUri) async {
    var lastLaunchedHost =
        oAuthLastLaunchedHostToLoginLocalPreferenceBloc.value;

    _logger.finest(
      () => 'initialUri = $initialUri '
          'lastLaunchedHost = $lastLaunchedHost',
    );
    if (lastLaunchedHost != null) {
      var authHostBloc = AuthHostBloc(
        configService: configService,
        instanceBaseUri: Uri.parse(lastLaunchedHost),
        preferencesService: localPreferencesService,
        connectionService: connectionService,
        currentInstanceBloc: currentUnifediApiAccessBloc,
        oAuthLastLaunchedHostToLoginLocalPreferenceBloc:
            oAuthLastLaunchedHostToLoginLocalPreferenceBloc,
      );
      await authHostBloc.performAsyncInit();

      var instanceService =
          authHostBloc.unifediApiManager.createInstanceService();

      var authCode =
          instanceService.extractAuthCodeFromCallbackUrl(initialUri.toString());

      try {
        var authInstance = await authHostBloc.loginWithAuthCode(authCode);

        var apiAccessLocalPreferenceBloc = AccessLocalPreferenceBloc(
          preferencesService: localPreferencesService,
          userAtHost: authInstance.userAtHost,
        );
        await apiAccessLocalPreferenceBloc.performAsyncInit();

        await apiAccessLocalPreferenceBloc.setValue(authInstance);

        await apiAccessLocalPreferenceBloc.dispose();
        await currentUnifediApiAccessBloc.changeCurrentInstance(authInstance);
        // ignore: avoid_catches_without_on_clauses
      } catch (e, stackTrace) {
        _logger.warning(
          () => 'Failed to _handleLoginOnAndroidWithoutChrome ',
          e,
          stackTrace,
        );
      }

      await instanceService.dispose();
    }
  }
}
