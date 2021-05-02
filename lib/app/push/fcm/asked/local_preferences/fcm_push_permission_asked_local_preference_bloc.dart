import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFcmPushPermissionAskedLocalPreferenceBloc
    implements ILocalPreferenceBloc<bool> {
  static IFcmPushPermissionAskedLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IFcmPushPermissionAskedLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
