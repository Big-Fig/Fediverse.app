import 'package:fedi/app/access/list/auth_instance_list_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IUnifediApiAccessListLocalPreferenceBloc
    implements LocalPreferenceBloc<UnifediApiAccessList?> {
  static IUnifediApiAccessListLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IUnifediApiAccessListLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
