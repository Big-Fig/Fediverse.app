import 'package:fedi/app/share/external/external_share_bloc.dart';
import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/app/share/share_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ExternalShareBlocProxyProvider extends StatelessWidget {
  final Widget child;

  ExternalShareBlocProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IExternalShareBloc, IShareBloc>(
      update: (context, value, previous) => value,
      child: ProxyProvider<IExternalShareBloc, IShareMessageInputBloc>(
        update: (context, value, previous) => value.shareMessageInputBloc,
        child: child,
      ),
    );
  }
}
