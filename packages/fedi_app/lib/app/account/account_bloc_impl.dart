import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';
import 'package:fedi_app/app/account/account_bloc.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class AccountBloc extends IAccountBloc {
  final BehaviorSubject<IAccount> accountSubject;

  final IUnifediApiAccountService? unifediApiAccountService;

  // todo: remove hack. Dont init when bloc quickly disposed. Help
  AccountBloc({
    required this.unifediApiAccountService,
    required IAccount account,
    required bool isNeedRefreshFromNetworkOnInit,
    required bool delayInit,
  }) : accountSubject = BehaviorSubject.seeded(account) {
    // _logger.finest(() => 'AccountBloc constructor ${account.remoteId}');
    accountSubject.disposeWith(this);

    if (delayInit) {
      Future.delayed(const Duration(seconds: 1), () {
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
    required IAccount account,
    required bool isNeedRefreshFromNetworkOnInit,
  }) {
    if (!isDisposed) {
      actualInit(
        account: account,
        isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
      );
    }
  }

  Future<void> actualInit({
    required IAccount account,
    required bool isNeedRefreshFromNetworkOnInit,
  });

  @override
  IAccount get account => accountSubject.value;

  @override
  Stream<IAccount> get accountStream => accountSubject.stream.distinct();

  Future<IUnifediApiAccount> loadRemoteAccount() async =>
      unifediApiAccountService!.getAccount(
        accountId: account.remoteId,
        withRelationship: null,
      );
}
