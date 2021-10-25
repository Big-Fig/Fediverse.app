// ignore_for_file: cascade_invocations

import 'package:hive/hive.dart';

import '../api/access/level/fediverse_api_access_level_model_impl.dart';
import '../api/access/scopes/fediverse_api_access_scopes_model_impl.dart';
import '../api/access/scopes/item/fediverse_api_access_scopes_item_model_impl.dart';
import '../api/requirement/access/level/fediverse_api_access_level_requirement_model_impl.dart';
import '../api/requirement/access/scopes/fediverse_api_access_scopes_requirement_model_impl.dart';
import '../api/requirement/instance/metadata/version/fediverse_api_instance_metadata_version_requirement_model_impl.dart';
import '../duration/duration_hive_adapter.dart';

// ignore_for_file: no-magic-number

abstract class FediverseHiveHelper {
  static void registerFediverseAdapters(TypeRegistry typeRegistry) {
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        1,
        FediverseApiAccessLevelAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        2,
        FediverseApiAccessScopesAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        3,
        FediverseApiAccessScopesItemAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        4,
        FediverseApiAccessLevelRequirementAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        5,
        FediverseApiAccessScopesRequirementAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        6,
        FediverseApiInstanceMetadataVersionRequirementAdapter(),
      ),
    );
    typeRegistry.registerAdapter(
      OverrideIdAdapter(
        7,
        DurationHiveAdapter(),
      ),
    );
  }

  static final fediverseIdToAdapterMap = <int, TypeAdapter>{
    1: FediverseApiAccessLevelAdapter(),
    2: FediverseApiAccessScopesAdapter(),
    3: FediverseApiAccessScopesItemAdapter(),
    4: FediverseApiAccessLevelRequirementAdapter(),
    5: FediverseApiAccessScopesRequirementAdapter(),
    6: FediverseApiInstanceMetadataVersionRequirementAdapter(),
    7: DurationHiveAdapter(),
  };
}
