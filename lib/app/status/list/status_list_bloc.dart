import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/instance/location/instance_location_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusListBloc implements IInstanceLocationBloc, IDisposable {
  static IStatusListBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IStatusListBloc>(context, listen: listen);
}
