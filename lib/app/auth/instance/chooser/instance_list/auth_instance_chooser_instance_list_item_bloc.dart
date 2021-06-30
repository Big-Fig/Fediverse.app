import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAuthInstanceChooserInstanceListItemBloc implements IDisposable {
  static IAuthInstanceChooserInstanceListItemBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAuthInstanceChooserInstanceListItemBloc>(
        context,
        listen: listen,
      );

  bool get isSelected;

  AuthInstance get instance;
}
