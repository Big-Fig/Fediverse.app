import 'package:fedi/refactored/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/refactored/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICurrentAuthInstanceLocalPreferenceBloc
    implements LocalPreferenceBloc<AuthInstance> {
  static ICurrentAuthInstanceLocalPreferenceBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ICurrentAuthInstanceLocalPreferenceBloc>(context,
          listen: listen);
}
