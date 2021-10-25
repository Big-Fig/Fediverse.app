import 'package:fedi_app/app/instance/location/instance_location_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceAnnouncementListBloc implements IInstanceLocationBloc {
  static IInstanceAnnouncementListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceAnnouncementListBloc>(context, listen: listen);
}
