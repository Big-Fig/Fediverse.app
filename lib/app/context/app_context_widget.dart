import 'package:fedi/app/context/app_context_bloc.dart';
import 'package:flutter/widgets.dart';

class AppContextWidget extends StatelessWidget {
  final Widget child;

  const AppContextWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    var appContextBloc = IAppContextBloc.of(context);
    return appContextBloc.provideContextToChild(child: child);
  }
}
