
import 'package:fedi/refactored/app/auth/instance/list/instance_list_model.dart';
import 'package:fedi/refactored/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceListLocalPreferenceBloc
    implements LocalPreferenceBloc<InstanceList> {
  static IInstanceListLocalPreferenceBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IInstanceListLocalPreferenceBloc>(context, listen: listen);
}
