import 'package:fedi/refactored/permission/permission_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStoragePermissionBloc extends IPermissionBloc {
  static IStoragePermissionBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IStoragePermissionBloc>(context, listen: listen);
}
