import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/web_sockets/web_sockets_handler_manager_bloc.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/web_sockets/listen_type/web_sockets_listen_type_model.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';

abstract class AccountStatusesCachedListBloc extends IStatusCachedListBloc {
  final IAccount account;
  final IPleromaAccountService pleromaAccountService;

  AccountStatusesCachedListBloc({
    @required this.account,
    @required this.pleromaAccountService,
    @required IWebSocketsHandlerManagerBloc webSocketsHandlerManagerBloc,
  }) : super() {
    addDisposable(
      disposable: webSocketsHandlerManagerBloc.listenAccountChannel(
        listenType: WebSocketsListenType.foreground,
        accountId: account.remoteId,
        notification: false,
      ),
    );
  }

  @override
  IPleromaApi get pleromaApi => pleromaAccountService;

  @override
  Stream<bool> get settingsChangedStream => Stream.empty();
}
