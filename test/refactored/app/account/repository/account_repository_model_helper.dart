import 'package:fedi/refactored/app/account/repository/account_repository_impl.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';

Future<DbAccount> insertDbAccount(
  AccountRepository accountRepository,
  DbAccount accountData,
) async {
  var id = await accountRepository.insert(accountData);
  assert(id != null, true);
  var dbAccount = accountData.copyWith(id: id);
  return dbAccount;
}
