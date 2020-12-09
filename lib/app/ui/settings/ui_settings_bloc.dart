import 'package:fedi/app/settings/global/global_settings_bloc.dart';
import 'package:fedi/app/ui/settings/ui_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IUiSettingsBloc implements IGlobalSettingsBloc<UiSettings> {
  static IUiSettingsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IUiSettingsBloc>(context, listen: listen);

  String get themeId;

  Stream<String> get themeIdStream;

  void changeThemeId(String value);
}
