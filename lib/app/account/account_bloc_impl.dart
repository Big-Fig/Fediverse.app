import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("account_bloc_impl.dart");

abstract class AccountBloc extends IAccountBloc {
  final BehaviorSubject<IAccount> accountSubject;


  final IPleromaAccountService pleromaAccountService;

  // todo: remove hack. Don't init when bloc quickly disposed. Help
  AccountBloc({
    @required this.pleromaAccountService,
    @required IAccount account,
    @required bool isNeedRefreshFromNetworkOnInit,
    @required bool delayInit,
  }) : accountSubject = BehaviorSubject.seeded(account) {
    assert(account != null);
    // _logger.finest(() => "AccountBloc constructor ${account.remoteId}");
    addDisposable(subject: accountSubject);

    if (delayInit) {
      Future.delayed(Duration(seconds: 1), () {
        _init(
          account: account,
          isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
        );
      });
    } else {
      _init(
        account: account,
        isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
      );
    }
  }

  void _init({
    @required IAccount account,
    @required bool isNeedRefreshFromNetworkOnInit,
  }) {
    if (!isDisposed) {
      actualInit(
        account: account,
        isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
      );
    }
  }

  Future actualInit({
    @required IAccount account,
    @required bool isNeedRefreshFromNetworkOnInit,
  });

  @override
  IAccount get account => accountSubject.value;

  @override
  Stream<IAccount> get accountStream => accountSubject.stream.distinct();

  Future<IPleromaAccount> loadRemoteAccount() async {
    IPleromaAccount remoteAccount;
    try {
      remoteAccount = await pleromaAccountService.getAccount(
          accountRemoteId: account.remoteId);
    } catch (e, stackTrace) {
      _logger.severe(
          () => "requestRefreshFromNetwork exception ", e, stackTrace);
    }
    return remoteAccount;
  }
}
