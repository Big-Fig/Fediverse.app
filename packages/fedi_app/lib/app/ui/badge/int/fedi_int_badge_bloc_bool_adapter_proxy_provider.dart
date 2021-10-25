import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:fedi_app/app/ui/badge/int/fedi_int_badge_bloc.dart';
import 'package:fedi_app/app/ui/badge/int/fedi_int_badge_bloc_bool_adapter.dart';
import 'package:flutter/cupertino.dart';

class FediIntBadgeBlocBoolAdapterProxyProvider extends StatelessWidget {
  final Widget child;

  const FediIntBadgeBlocBoolAdapterProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      DisposableProxyProvider<IFediIntBadgeBloc, IFediBoolBadgeBloc>(
        update: (context, fediIntBadgeBloc, previous) =>
            FediIntBadgeBlocBoolAdapter(
          fediIntBadgeBloc: fediIntBadgeBloc,
        ),
        child: child,
      );
}
