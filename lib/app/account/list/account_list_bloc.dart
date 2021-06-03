import 'package:fedi/app/instance/location/instance_location_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountListBloc implements IInstanceLocationBloc {
  static IAccountListBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAccountListBloc>(context, listen: listen);
}
