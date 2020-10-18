import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICurrentUiThemeIdLocalPreferenceBloc
    implements ILocalPreferenceBloc<String> {
  static ICurrentUiThemeIdLocalPreferenceBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ICurrentUiThemeIdLocalPreferenceBloc>(context,
          listen: listen);
}
