import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAuthApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc
    implements StringNullableLocalPreferenceBloc {
  static IAuthApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAuthApiOAuthLastLaunchedHostToLoginLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
