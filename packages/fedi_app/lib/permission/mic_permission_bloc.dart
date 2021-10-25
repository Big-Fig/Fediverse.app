import 'package:fedi_app/permission/permission_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMicPermissionBloc extends IPermissionBloc {
  static IMicPermissionBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IMicPermissionBloc>(context, listen: listen);
}
