import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/ui/theme/ui_theme_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICurrentUiThemeBloc<T extends IUiTheme> extends Disposable {
  static ICurrentUiThemeBloc of(BuildContext context,
      {bool listen = true}) =>
      Provider.of<ICurrentUiThemeBloc>(context,
          listen: listen);

  T get currentTheme;
  Stream<T> get currentThemeStream;


  Future changeTheme(T theme);
}