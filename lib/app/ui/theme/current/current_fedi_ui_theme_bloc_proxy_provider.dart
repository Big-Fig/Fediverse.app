import 'package:fedi/app/ui/theme/current/current_fedi_ui_theme_bloc.dart';
import 'package:fedi/ui/theme/current/current_ui_theme_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CurrentFediUiThemeBlocProxyProvider extends StatelessWidget {
  final Widget child;

  CurrentFediUiThemeBlocProxyProvider({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<ICurrentFediUiThemeBloc, ICurrentUiThemeBloc>(
          update: (context, value, previous) => value, child: child);
}
