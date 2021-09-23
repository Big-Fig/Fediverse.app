import 'package:fedi/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/local_preferences/auth_instance_local_preference_bloc_impl.dart';
import 'package:fedi/app/auth/oauth_last_launched/local_preferences/auth_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/init/deep_link/deep_link_init_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:logging/logging.dart';
import 'package:uni_links/uni_links.dart';

var _logger = Logger('deep_link_init_bloc_impl.dart');

class DeepLinkInitBloc extends AsyncInitLoadingBloc
    implements IDeepLinkInitBloc {
  final IAuthApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc
      pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc;
  final ILocalPreferencesService localPreferencesService;
  final IConnectionService connectionService;
  final ICurrentUnifediApiAccessBloc currentUnifediApiAccessBloc;
  final IConfigService configService;

  DeepLinkInitBloc({
    required this.pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc,
    required this.localPreferencesService,
    required this.connectionService,
    required this.currentUnifediApiAccessBloc,
    required this.configService,
  });

  @override
  Future internalAsyncInit() async {
    var initialUri = await getInitialUri();

    if (initialUri != null) {
      await _handleLoginOnAndroidWithoutChrome(initialUri);
    }
  }

  Future _handleLoginOnAndroidWithoutChrome(Uri initialUri) async {
    var lastLaunchedHost =
        pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc.value;

    _logger.finest(() => 'initialUri = $initialUri '
        'lastLaunchedHost = $lastLaunchedHost');
    if (lastLaunchedHost != null) {
      var authHostBloc = AuthHostBloc(
        configService: configService,
        instanceBaseUri: Uri.parse(lastLaunchedHost),
        preferencesService: localPreferencesService,
        connectionService: connectionService,
        currentInstanceBloc: currentUnifediApiAccessBloc,
        pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc:
            pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc,
      );
      await authHostBloc.performAsyncInit();

      var instanceService =
          authHostBloc.unifediApiManager.createInstanceService();

      var authCode =
          instanceService.extractAuthCodeFromCallbackUrl(initialUri.toString());

      try {
        var authInstance = await authHostBloc.loginWithAuthCode(authCode);

        var apiAccessLocalPreferenceBloc = UnifediApiAccessLocalPreferenceBloc(
          preferencesService: localPreferencesService,
          userAtHost: authInstance.userAtHost,
        );

        await apiAccessLocalPreferenceBloc.setValue(authInstance);

        await apiAccessLocalPreferenceBloc.dispose();
        await currentUnifediApiAccessBloc.changeCurrentInstance(authInstance);
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
