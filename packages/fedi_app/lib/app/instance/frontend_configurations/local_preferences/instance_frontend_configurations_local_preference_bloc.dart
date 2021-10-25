import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IInstanceFrontendConfigurationsLocalPreferenceBloc
    implements ObjectLocalPreferenceBloc<IUnifediApiFrontendConfigurations?> {
  static IInstanceFrontendConfigurationsLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceFrontendConfigurationsLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
