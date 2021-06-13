import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAskPushPermissionLocalPreferenceBloc
    implements ILocalPreferenceBloc<bool> {
  static IAskPushPermissionLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAskPushPermissionLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
