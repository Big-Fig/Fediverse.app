import 'package:fedi/app/settings/global/global_settings_bloc.dart';
import 'package:fedi/app/ui/settings/font_size/ui_settings_font_size_model.dart';
import 'package:fedi/app/ui/settings/ui_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IUiSettingsBloc implements IGlobalSettingsBloc<UiSettings> {
  static IUiSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IUiSettingsBloc>(
        context,
        listen: listen,
      );

  static const UiSettingsFontSize defaultStatusFontSettingsValue =
      UiSettingsFontSize.medium;

  String? get themeId;

  Stream<String?> get themeIdStream;

  Future changeThemeId(String value);

  UiSettingsFontSize? get statusFontSize;

  Stream<UiSettingsFontSize?> get statusFontSizeStream;

  void changeStatusFontSize(UiSettingsFontSize value);
}
