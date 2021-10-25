import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/ui/theme/ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FediUiThemeProxyProvider extends StatelessWidget {
  final Widget child;

  const FediUiThemeProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<IFediUiTheme, IUiTheme>(
        update: (context, value, previous) => value,
        child: ProxyProvider<IFediUiTheme, IFediUiColorTheme>(
          update: (context, value, previous) => value.colorTheme,
          child: ProxyProvider<IFediUiTheme, IFediUiTextTheme>(
            update: (context, value, previous) => value.textTheme,
            child: child,
          ),
        ),
      );
}
