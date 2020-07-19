import 'package:fedi/app/localization/localization_service_impl.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ILocalizationService
    implements IAsyncInitLoadingBloc, Disposable {
  static ILocalizationService of(BuildContext context, {bool listen = true}) =>
      Provider.of<ILocalizationService>(context, listen: listen);

  LocalizationBloc get localizationBloc;

}
