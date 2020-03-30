
import 'package:fedi/refactored/app/auth/instance/instance_model.dart';
import 'package:fedi/refactored/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICurrentInstanceLocalPreferenceBloc
    implements LocalPreferenceBloc<Instance> {
  static ICurrentInstanceLocalPreferenceBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ICurrentInstanceLocalPreferenceBloc>(context, listen: listen);
}
