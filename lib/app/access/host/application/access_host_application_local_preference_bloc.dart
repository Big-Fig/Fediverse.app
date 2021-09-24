import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccessHostApplicationLocalPreferenceBloc
    implements LocalPreferenceBloc<UnifediApiClientApplication?> {
  static IAccessHostApplicationLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAccessHostApplicationLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
