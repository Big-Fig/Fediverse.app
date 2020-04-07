import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/refactored/database/database_service.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:provider/provider.dart';

class MoorDatabaseService extends AsyncInitLoadingBloc
    implements IDatabaseService {
  final String dbName;

  MoorDatabaseService({@required this.dbName});

  AppDatabase appDatabase;

  @override
  Future internalAsyncInit() async {
//    appDatabase = AppDatabase(LazyDatabase(() async {
//      final dbFolder = await getApplicationDocumentsDirectory();
//      final file = File(p.join(dbFolder.path, 'app.db'));
//      return VmDatabase(file);
//    }));

//    appDatabase = AppDatabase(FlutterQueryExecutor.inDatabaseFolder(
//        path: 'db.sqlite', logStatements: true));
    appDatabase = AppDatabase(FlutterQueryExecutor.inDatabaseFolder(
        path: '$dbName.sqlite', logStatements: false));

    addDisposable(disposable: CustomDisposable(() {
      appDatabase.close();
    }));
  }

  @override
  Future clear() async {
    for (var table in appDatabase.allTables) {
      // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
      await appDatabase.delete(table).go();
    }
  }

  static MoorDatabaseService of(BuildContext context, {bool listen = true}) =>
      Provider.of<MoorDatabaseService>(context, listen: listen);
}
