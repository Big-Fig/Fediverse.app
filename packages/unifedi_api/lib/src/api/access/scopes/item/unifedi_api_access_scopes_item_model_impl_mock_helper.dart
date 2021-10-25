import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import '../permission/type/unifedi_api_access_scopes_permission_type_sealed.dart';
import '../target/type/unifedi_api_access_scopes_target_type_sealed.dart';
import 'unifedi_api_access_scopes_item_model_impl.dart';

class UnifediApiAccessScopesItemMockHelper {
  static UnifediApiAccessScopesItem generate({
    required String seed,
  }) =>
      UnifediApiAccessScopesItem(
        permission: EnumMockHelper.generate(
          seed: seed,
          values: UnifediApiAccessScopesPermissionType.values,
        ).stringValue,
        target: EnumMockHelper.generate(
          seed: seed,
          values: UnifediApiAccessScopesTargetType.values,
        ).stringValue,
      );
}
