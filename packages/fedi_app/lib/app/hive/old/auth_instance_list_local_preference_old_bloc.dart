import 'package:fedi_app/app/hive/old/auth_instance_list_old_model.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAuthInstanceListLocalPreferenceBlocOld
    implements LocalPreferenceBloc<AuthInstanceListOld?> {
  static IAuthInstanceListLocalPreferenceBlocOld of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAuthInstanceListLocalPreferenceBlocOld>(
        context,
        listen: listen,
      );
}
