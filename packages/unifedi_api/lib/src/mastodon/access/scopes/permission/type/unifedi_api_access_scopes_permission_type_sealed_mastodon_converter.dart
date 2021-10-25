import 'package:mastodon_api/mastodon_api.dart';
import '../../../../../api/access/scopes/permission/type/unifedi_api_access_scopes_permission_type_sealed.dart';
import '../../../../../converter/sealed_converter.dart';

const _converter = UnifediApiAccessScopesPermissionTypeMastodonConverter();

class UnifediApiAccessScopesPermissionTypeMastodonConverter
    implements
        SealedConverter<UnifediApiAccessScopesPermissionType,
            MastodonApiAccessScopesPermissionType> {
  const UnifediApiAccessScopesPermissionTypeMastodonConverter();

  @override
  UnifediApiAccessScopesPermissionType convertFrom(
    MastodonApiAccessScopesPermissionType item,
  ) =>
      item.map(
        read: (_) => UnifediApiAccessScopesPermissionType.readValue,
        write: (_) => UnifediApiAccessScopesPermissionType.writeValue,
        follow: (_) => UnifediApiAccessScopesPermissionType.followValue,
        push: (_) => UnifediApiAccessScopesPermissionType.pushValue,
        adminRead: (_) => UnifediApiAccessScopesPermissionType.adminReadValue,
        adminWrite: (_) => UnifediApiAccessScopesPermissionType.adminWriteValue,
      );

  @override
  MastodonApiAccessScopesPermissionType convertTo(
    UnifediApiAccessScopesPermissionType item,
  ) =>
      item.map(
        read: (_) => MastodonApiAccessScopesPermissionType.readValue,
        write: (_) => MastodonApiAccessScopesPermissionType.writeValue,
        follow: (_) => MastodonApiAccessScopesPermissionType.followValue,
        push: (_) => MastodonApiAccessScopesPermissionType.pushValue,
        adminRead: (_) => MastodonApiAccessScopesPermissionType.adminReadValue,
        adminWrite: (_) =>
            MastodonApiAccessScopesPermissionType.adminWriteValue,
      );
}

extension MastodonApiAccessScopesPermissionTypeUnifediExtension
    on MastodonApiAccessScopesPermissionType {
  UnifediApiAccessScopesPermissionType
      toUnifediApiAccessScopesPermissionType() => _converter.convertFrom(this);
}

extension UnifediApiAccessScopesPermissionTypeMastodonExtension
    on UnifediApiAccessScopesPermissionType {
  MastodonApiAccessScopesPermissionType
      toMastodonApiAccessScopesPermissionType() => _converter.convertTo(this);
}
