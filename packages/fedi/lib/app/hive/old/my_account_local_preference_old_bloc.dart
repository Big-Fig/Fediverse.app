import 'package:fedi/app/hive/old/my_account_old_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountLocalPreferenceBlocOld
    implements LocalPreferenceBloc<PleromaMyAccountWrapperOld?> {
  static IMyAccountLocalPreferenceBlocOld of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMyAccountLocalPreferenceBlocOld>(context, listen: listen);
}
