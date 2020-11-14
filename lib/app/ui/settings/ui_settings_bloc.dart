import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IUiSettingsBloc implements IDisposable {
  static IUiSettingsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IUiSettingsBloc>(context, listen: listen);

  String get themeId;

  Stream<String> get themeIdStream;

  void changeThemeId(String value);
}
