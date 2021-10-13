import 'package:fedi/ui/theme/ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UiThemeProxyProvider extends StatelessWidget {
  final Widget child;

  const UiThemeProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) => ProxyProvider<IUiTheme, IUiColorTheme>(
        update: (context, value, previous) => value.colorTheme,
        child: ProxyProvider<IUiTheme, IUiTextTheme>(
          update: (context, value, previous) => value.textTheme,
          child: child,
        ),
      );
}
