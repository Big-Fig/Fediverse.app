import 'package:fedi/app/hive/hive_service_impl.dart';
import 'package:fedi/json/json_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive/src/backend/storage_backend.dart';
import 'package:hive/src/box/box_impl.dart';
import 'package:hive/src/box/change_notifier.dart';
import 'package:hive/src/box/keystore.dart';
import 'package:hive/src/hive_impl.dart';
import 'package:mockito/annotations.dart';

import 'hive_test_helper.mocks.dart';

BoxImpl _getBox({
  String? name,
  HiveImpl? hive,
  Keystore? keystore,
  CompactionStrategy? cStrategy,
  StorageBackend? backend,
}) {
  var box = BoxImpl(
    hive ?? HiveImpl(),
    name ?? 'testBox',
    null,
    cStrategy ?? (total, deleted) => false,
    backend ?? MockStorageBackend(),
  );
  box.keystore = keystore ?? Keystore(box, ChangeNotifier(), null);
  return box;
}

// ignore_for_file: no-magic-number, avoid-late-keyword
@GenerateMocks([], customMocks: [
  MockSpec<StorageBackend>(returnNullOnMissingStub: true),
])
class HiveTestHelper {
  static void testAdapter<T>(T Function() adapterCreator) {
    var adapter1 = adapterCreator();
    var adapter2 = adapterCreator();

    expect(adapter1 == adapter2, true);
    expect(adapter1.hashCode == adapter2.hashCode, true);
  }

  static Future testHiveSaveAndLoad<T extends IJsonObject>(
    T Function({
      required String seed,
    })
        testHiveObjectCreator, {
    bool skipHiveInit = false,
  }) async {
    if (!skipHiveInit) {
      HiveService.registerAdapters();
    }

    var obj = testHiveObjectCreator(seed: 'seed1');

    var uniquePrefix = obj.toString().substring(0, 3) + obj.hashCode.toString();
    var boxName = 'testHiveSaveAndLoad' + uniquePrefix;

    var key = 'key';
    var box = _getBox(name: boxName);
    await box.put(key, obj);

    var objFromHive = box.get(key);

    expect(obj, objFromHive);
  }
}
