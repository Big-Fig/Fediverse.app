import 'package:fedi/app/instance/location/instance_location_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountFeaturedHashtagListBloc
    implements IInstanceLocationBloc {
  static IAccountFeaturedHashtagListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAccountFeaturedHashtagListBloc>(
        context,
        listen: listen,
      );
}
