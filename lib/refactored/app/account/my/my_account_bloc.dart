import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/pleroma/account/my/pleroma_my_account_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountBloc extends IAccountBloc {
  static IMyAccountBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IMyAccountBloc>(context, listen: listen);

  AuthInstance get instance;

  bool get isLocalCacheExist;

  bool checkAccountIsMe(IAccount account);

  bool checkIsStatusFromMe(IStatus status);

  void updateMyAccountByRemote(IPleromaMyAccount remoteMyAccount);
}
