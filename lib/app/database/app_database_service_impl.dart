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

class AppDatabaseService extends AsyncInitLoadingBloc
    implements IDatabaseService {
  final String dbName;

  AppDatabaseService({@required this.dbName});

  AppDatabase appDatabase;

  MoorInspector inspector;

  String filePath;
  File file;

  @override
  Future internalAsyncInit() async {
    filePath = await calculateDatabaseFilePath(dbName);
    file = File(filePath);

    appDatabase = AppDatabase(
      VmDatabase(
        file,
        logStatements: false,
      ),
    );

    addDisposable(
      disposable: CustomDisposable(
        () async {
          await appDatabase.close();
        },
      ),
    );

    if (!kReleaseMode) {
      await _addMoorInspectorSupport();
    }
  }

  Future _addMoorInspectorSupport() async {
      var packageId = await FediPackageInfoHelper.getPackageId();
    
    final moorInspectorBuilder = MoorInspectorBuilder()
      ..bundleId = packageId
      ..icon = 'flutter'
      ..addDatabase(filePath, appDatabase);
    inspector = moorInspectorBuilder.build();
    
    //Start server and announcement server
    await inspector.start();
    
    addDisposable(custom: () async {
      await inspector.stop();
    });
  }


  static Future<String> calculateDatabaseFilePath(String dbName) async {
    var path = '$dbName.sqlite';
    final dbFolder = await getApplicationDocumentsDirectory();
    var filePath = p.join(
      dbFolder.path,
      path,
    );
    return filePath;
  }

  @override
  Future clear() async {
    for (var table in appDatabase.allTables) {
      // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
      await appDatabase.delete(table).go();
    }
  }

  @override
  Future delete() async {
    await appDatabase.close();
    await file.delete();
  }

  static AppDatabaseService of(BuildContext context, {bool listen = true}) =>
      Provider.of<AppDatabaseService>(context, listen: listen);
}
