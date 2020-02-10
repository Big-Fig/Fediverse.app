import 'package:fedi/permission/permission_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICameraPermissionBloc extends IPermissionBloc {
  static ICameraPermissionBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICameraPermissionBloc>(context, listen: listen);
}
