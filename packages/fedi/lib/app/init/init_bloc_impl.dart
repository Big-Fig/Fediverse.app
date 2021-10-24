import 'package:fedi/app/app_model.dart';
import 'package:fedi/app/context/app_context_bloc_impl.dart';
import 'package:fedi/app/init/deep_link/deep_link_init_bloc_impl.dart';
import 'package:fedi/app/init/init_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';

class InitBloc extends AsyncInitLoadingBloc implements IInitBloc {
  @override
  final AppContextBloc appContextBloc;

  // ignore: avoid-late-keyword
  late DeepLinkInitBloc deepLinkInitBloc;

  final AppLaunchType appLaunchType;

  InitBloc({
    required this.appLaunchType,
  }) : appContextBloc = AppContextBloc(appLaunchType: appLaunchType);

  @override
  Future<void> internalAsyncInit() async {
    addDisposable(appContextBloc);

    await appContextBloc.performAsyncInit();

    deepLinkInitBloc = DeepLinkInitBloc(
      oAuthLastLaunchedHostToLoginLocalPreferenceBloc: appContextBloc.get(),
      localPreferencesService: appContextBloc.get(),
      connectionService: appContextBloc.get(),
      // ignore: no-equal-arguments
      currentUnifediApiAccessBloc: appContextBloc.get(),
      // ignore: no-equal-arguments
      configService: appContextBloc.get(),
    );

    await deepLinkInitBloc.performAsyncInit();
  }
}
