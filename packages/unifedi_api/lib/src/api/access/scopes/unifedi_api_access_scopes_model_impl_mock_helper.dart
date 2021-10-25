import 'package:fediverse_api/fediverse_api_mock_helper.dart';

import 'item/unifedi_api_access_scopes_item_model_impl_mock_helper.dart';
import 'permission/type/unifedi_api_access_scopes_permission_type_sealed.dart';
import 'unifedi_api_access_scopes_model_impl.dart';

class UnifediApiAccessScopesMockHelper {
  static UnifediApiAccessScopes generate({
    required String seed,
  }) =>
      UnifediApiAccessScopes(
        globalPermissions: [
          EnumMockHelper.generate(
            seed: seed + '1',
            values: UnifediApiAccessScopesPermissionType.values,
          ).stringValue,
          EnumMockHelper.generate(
            seed: seed + '2',
            values: UnifediApiAccessScopesPermissionType.values,
          ).stringValue,
        ],
        targetPermissions: [
          UnifediApiAccessScopesItemMockHelper.generate(seed: seed + '1'),
          UnifediApiAccessScopesItemMockHelper.generate(seed: seed + '2'),
        ],
      );
}
