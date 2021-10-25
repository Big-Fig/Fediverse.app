import 'package:fedi_app/app/instance/location/instance_location_model.dart';

abstract class IInstanceLocationBloc {
  InstanceLocation get instanceLocation;
  Uri? get remoteInstanceUriOrNull;
}

extension IInstanceLocationBlocExtension on IInstanceLocationBloc {
  bool get isLocal => instanceLocation.isLocal;
  bool get isRemote => instanceLocation.isRemote;
}
