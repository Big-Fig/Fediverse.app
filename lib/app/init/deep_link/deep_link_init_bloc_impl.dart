import 'package:fedi/app/auth/host/auth_host_bloc_impl.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/init/deep_link/deep_link_init_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_oauth_service.dart';
import 'package:logging/logging.dart';
import 'package:uni_links2/uni_links.dart';

var _logger = Logger("deep_link_init_bloc_impl.dart");

class DeepLinkInitBloc extends AsyncInitLoadingBloc
    implements IDeepLinkInitBloc {
  final IPleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc
      pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc;
  final ILocalPreferencesService localPreferencesService;
  final IConnectionService connectionService;
  final ICurrentAuthInstanceBloc currentAuthInstanceBloc;

  DeepLinkInitBloc({
    required this.pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc,
    required this.localPreferencesService,
    required this.connectionService,
    required this.currentAuthInstanceBloc,
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

    _logger.finest(() => "initialUri = $initialUri "
        "lastLaunchedHost = $lastLaunchedHost");
    if (lastLaunchedHost != null) {
      var authHostBloc = AuthHostBloc(
        instanceBaseUri: Uri.parse(lastLaunchedHost),
        preferencesService: localPreferencesService,
        connectionService: connectionService,
        currentInstanceBloc: currentAuthInstanceBloc,
        pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc:
            pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc,
        // doesn't matter here
        isPleroma: false,
      );
      await authHostBloc.performAsyncInit();
      String authCode = IPleromaOAuthService.extractAuthCodeFromUri(initialUri);

      try {
        var authInstance = await authHostBloc.loginWithAuthCode(authCode);

        await currentAuthInstanceBloc.changeCurrentInstance(authInstance);
      } catch (e, stackTrace) {
        _logger.warning(
          () => "Failed to _handleLoginOnAndroidWithoutChrome ",
          e,
          stackTrace,
        );
      }
    }
  }
}
