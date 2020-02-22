import 'package:fedi/app/context/app_context_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class AppContextWidget extends StatelessWidget {
  final Widget child;

  AppContextWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    AppContextBloc appContextBloc = AppContextBloc.of(context);
    return appContextBloc.provideContextToChild(child: child);
  }
}
