import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc
    implements StringLocalPreferenceBloc {
  static IPleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc of(BuildContext context,
      {bool listen = true}) =>
      Provider.of<IPleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc>(context,
          listen: listen);
}
