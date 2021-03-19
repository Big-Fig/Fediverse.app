import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFcmPushPermissionAskedLocalPreferencesBloc
    implements ILocalPreferenceBloc<bool?> {
  static IFcmPushPermissionAskedLocalPreferencesBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IFcmPushPermissionAskedLocalPreferencesBloc>(
        context,
        listen: listen,
      );
}
