import 'package:fedi/app/context/app_context_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';

abstract class IInitBloc extends IAsyncInitLoadingBloc {
  IAppContextBloc get appContextBloc;
}
