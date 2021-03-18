import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';

Future<DbAccount> insertDbAccount(
  AccountRepository accountRepository,
  DbAccount accountData,
) async {
  var id = await accountRepository.insert(accountData);
  assert(id > 0, true);
  var dbAccount = accountData.copyWith(id: id);
  return dbAccount;
}
