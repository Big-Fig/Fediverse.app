import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccessApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc
    implements StringNullableLocalPreferenceBloc {
  static IAccessApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAccessApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
