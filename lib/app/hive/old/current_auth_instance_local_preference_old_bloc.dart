import 'package:fedi/app/hive/old/auth_instance_old_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICurrentAuthInstanceOldLocalPreferenceBlocOld
    implements LocalPreferenceBloc<AuthInstanceOld?> {
  static ICurrentAuthInstanceOldLocalPreferenceBlocOld of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ICurrentAuthInstanceOldLocalPreferenceBlocOld>(
        context,
        listen: listen,
      );
}
