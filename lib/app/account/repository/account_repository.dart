import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountRepository
    implements
        Disposable,
        IReadIdListRepository<DbAccountWrapper, int>,
        IWriteIdListRepository<DbAccount, int> {
  static IAccountRepository of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAccountRepository>(context, listen: listen);

  Future<DbAccountWrapper> findByRemoteId(String remoteId);

  Future upsertRemoteAccounts(List<IPleromaAccount> remoteAccounts);

  Future upsertRemoteAccount(IPleromaAccount remoteAccount);

  Future updateAccountFollowings(
      String accountRemoteId, List<PleromaAccount> followings);

  Future<List<String>> getAccountFollowingsRemoteIds(String accountRemoteId);
}
