import 'package:fedi/permission/permission_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IContactsPermissionBloc extends IPermissionBloc {
  static IContactsPermissionBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IContactsPermissionBloc>(context, listen: listen);
}
