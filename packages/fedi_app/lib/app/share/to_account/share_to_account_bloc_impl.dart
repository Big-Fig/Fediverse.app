import 'package:collection/collection.dart' show IterableExtension;
import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/share/to_account/share_to_account_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class ShareToAccountBloc extends DisposableOwner
    implements IShareToAccountBloc {
  @override
  List<IAccount>? get alreadySharedToAccounts =>
      alreadySharedToAccountsSubject.valueOrNull;

  @override
  Stream<List<IAccount>?> get alreadySharedToAccountsStream =>
      alreadySharedToAccountsSubject.stream;

  BehaviorSubject<List<IAccount>?> alreadySharedToAccountsSubject =
      BehaviorSubject.seeded([]);

  ShareToAccountBloc() {
    alreadySharedToAccountsSubject.disposeWith(this);
  }

  Future<List<IUnifediApiAccount>> customRemoteAccountListLoader({
    required int? limit,
    required IAccount? newerThan,
    required IAccount? olderThan,
  });

  Future<List<IAccount>> customLocalAccountListLoader({
    required int? limit,
    required IAccount? newerThan,
    required IAccount? olderThan,
  });

  @override
  Future<bool> shareToAccount(IAccount account) async {
    var success = await actuallyShareToAccount(account);

    if (success) {
      alreadySharedToAccounts!.add(account);
      alreadySharedToAccountsSubject.add(alreadySharedToAccounts);
    }

    return success;
  }

  @override
  bool isAlreadySharedToAccount(IAccount account) =>
      _calculateIsAlreadySharedToAccount(alreadySharedToAccounts!, account);

  @override
  Stream<bool> isAlreadySharedToAccountStream(IAccount account) =>
      alreadySharedToAccountsStream.map(
        (alreadySharedToAccounts) => _calculateIsAlreadySharedToAccount(
          alreadySharedToAccounts!,
          account,
        ),
      );

  static bool _calculateIsAlreadySharedToAccount(
    List<IAccount> alreadySharedToAccounts,
    IAccount account,
  ) {
    var alreadySharedAccount = alreadySharedToAccounts.firstWhereOrNull(
      (currentAccount) => currentAccount.remoteId == account.remoteId,
    );

    return alreadySharedAccount != null;
  }

  Future<bool> actuallyShareToAccount(IAccount account);
}
