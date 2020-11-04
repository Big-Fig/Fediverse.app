import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_model.dart';
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

  bool checkIsChatMessageFromMe(IChatMessage chatMessage);
}
