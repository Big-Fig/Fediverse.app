import 'package:fedi/app/account/account_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor_ffi/moor_ffi.dart';

import 'account_repository_model_helper.dart';

var dbAccount1 = createTestAccount("seed1");
var dbAccount2 = createTestAccount("seed2");

void main() {
  AppDatabase database;
  AccountRepository accountRepository;

  setUp(() {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(dao: database.accountDao);
  });

  tearDown(() async {
    await database.close();
  });

  test('insert & find by id', () async {
    var id = await accountRepository.insert(dbAccount1);
    assert(id != null, true);
    expectDbAccount(await accountRepository.findById(id), dbAccount1);
  });
  test('updateById', () async {
    var id = await accountRepository.insert(dbAccount1);
    assert(id != null, true);

    await accountRepository.updateById(id, dbAccount2);
    expectDbAccount(await accountRepository.findById(id), dbAccount2);
  });
}
