import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/database/database_service.dart';
import 'package:fedi/disposable/disposable.dart';
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

    // todo: improve re-opening new database during account switch
    moorRuntimeOptions.dontWarnAboutMultipleDatabases = true;


    appDatabase = AppDatabase(FlutterQueryExecutor.inDatabaseFolder(
        path: '$dbName.sqlite', logStatements: false));

    addDisposable(disposable: CustomDisposable(() async {
      await appDatabase.close();
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
