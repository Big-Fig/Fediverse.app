import 'package:fedi/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:fedi/app/ui/badge/int/fedi_int_badge_bloc.dart';
import 'package:fedi/app/ui/badge/int/fedi_int_badge_bloc_bool_adapter.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';

class FediIntBadgeBlocBoolAdapterProxyProvider extends StatelessWidget {
  final Widget child;

  FediIntBadgeBlocBoolAdapterProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) {
    return DisposableProxyProvider<IFediIntBadgeBloc, IFediBoolBadgeBloc>(
      update: (context, fediIntBadgeBloc, previous) =>
          FediIntBadgeBlocBoolAdapter(
        fediIntBadgeBloc: fediIntBadgeBloc,
      ),
      child: child,
    );
  }
}
