import 'package:fedi/app/context/app_context_bloc_impl.dart';
import 'package:fedi/app/init/deep_link/deep_link_init_bloc_impl.dart';
import 'package:fedi/app/init/init_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';

class InitBloc extends AsyncInitLoadingBloc implements IInitBloc {
  @override
  AppContextBloc appContextBloc;

  DeepLinkInitBloc deepLinkInitBloc;

  @override
  Future internalAsyncInit() async {
    appContextBloc = AppContextBloc();
    addDisposable(disposable: appContextBloc);

    await appContextBloc.performAsyncInit();

    deepLinkInitBloc = DeepLinkInitBloc(
      pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc:
          appContextBloc.get(),
      localPreferencesService: appContextBloc.get(),
      connectionService: appContextBloc.get(),
      currentAuthInstanceBloc: appContextBloc.get(),
    );

    await deepLinkInitBloc.performAsyncInit();
  }
}
