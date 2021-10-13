import 'package:fedi/app/share/external/external_share_bloc.dart';
import 'package:fedi/app/share/share_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ExternalShareBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const ExternalShareBlocProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IExternalShareBloc, IShareBloc>(
        update: (context, value, previous) => value,
        child: child,
      );
}
