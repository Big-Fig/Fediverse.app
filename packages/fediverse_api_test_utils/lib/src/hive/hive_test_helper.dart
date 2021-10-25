// ignore_for_file: implementation_imports, invalid_use_of_visible_for_testing_member

import 'package:fediverse_api/fediverse_api.dart';
import 'package:hive/hive.dart';
import 'package:hive/src/backend/storage_backend.dart';
import 'package:hive/src/box/box_impl.dart';
import 'package:hive/src/box/change_notifier.dart';
import 'package:hive/src/box/keystore.dart';
import 'package:hive/src/hive_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';

import 'hive_test_helper.mocks.dart';

BoxImpl _getBox({
  required HiveImpl hive,
  String? name,
  Keystore? keystore,
  CompactionStrategy? cStrategy,
  StorageBackend? backend,
}) {
  var box = BoxImpl<dynamic>(
    hive,
    name ?? 'testBox',
    null,
    cStrategy ?? (total, deleted) => false,
    backend ?? MockStorageBackend(),
  );

  // ignore: invalid_use_of_protected_member
  box.keystore = keystore ?? Keystore<dynamic>(box, ChangeNotifier(), null);

  return box;
}

// ignore_for_file: no-magic-number, avoid-late-keyword
@GenerateMocks(
  [],
  customMocks: [
    MockSpec<StorageBackend>(returnNullOnMissingStub: true),
  ],
)
class HiveTestHelper {
  static void testAdapter<T>(T Function() adapterCreator) {
    var adapter1 = adapterCreator();
    var adapter2 = adapterCreator();

    expect(adapter1 == adapter2, true);
    expect(adapter1.hashCode == adapter2.hashCode, true);
  }

  static Future<void> testHiveSaveAndLoad<T extends IFediverseApiObject>(
    T Function({
      required String seed,
    })
        testHiveObjectCreator, {
    required List<NestedTypeRegistryAdapter> nestedTypeRegistryAdapters,
  }) async {
    var hiveImpl = HiveImpl();

    // ignore: prefer_foreach
    for (final adapter in nestedTypeRegistryAdapters) {
      hiveImpl.registerNestedTypeRegistryAdapter(adapter);
    }

    var obj = testHiveObjectCreator(seed: 'seed1');

    var uniquePrefix = obj.toString().substring(0, 3) + obj.hashCode.toString();
    var boxName = 'testHiveSaveAndLoad' + uniquePrefix;

    var key = 'key';
    var box = _getBox(
      name: boxName,
      hive: hiveImpl,
    );
    await box.put(key, obj);

    dynamic objFromHive = box.get(key);

    expect(obj, objFromHive);
  }
}
