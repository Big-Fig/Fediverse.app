import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc
    implements StringNullableLocalPreferenceBloc {
  static IPleromaApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
