import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountRepository
    implements
        IReadIdListRepository<IAccount, int>,
        IWriteIdListRepository<DbAccount, int> {
  static IAccountRepository of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAccountRepository>(context, listen: listen);
}
