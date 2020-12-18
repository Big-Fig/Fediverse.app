import 'dart:io';

import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/package_info/package_info_helper.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/database/database_service.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/ffi.dart';
import 'package:moor_inspector/moor_inspector.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class MoorDatabaseService extends AsyncInitLoadingBloc
    implements IDatabaseService {
  final String dbName;

  MoorDatabaseService({@required this.dbName});

  AppDatabase appDatabase;

  MoorInspector inspector;

  @override
  Future internalAsyncInit() async {
    var path = '$dbName.sqlite';
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, path));

    appDatabase = AppDatabase(
      VmDatabase(
        file,
        logStatements: false,
      ),
    );

    addDisposable(disposable: CustomDisposable(() async {
      await appDatabase.close();
    }));

    if (!kReleaseMode) {
      var packageId = await FediPackageInfoHelper.getPackageId();

      final moorInspectorBuilder = MoorInspectorBuilder()
        ..bundleId = packageId
        ..icon = 'flutter'
        ..addDatabase(path, appDatabase);
      inspector = moorInspectorBuilder.build();

      //Start server and announcement server
      await inspector.start();

      addDisposable(custom: () async {
        await inspector.stop();
      });
    }
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
