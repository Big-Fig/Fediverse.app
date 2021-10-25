import 'package:pleroma_api/pleroma_api.dart';
import '../../../../../api/access/scopes/permission/type/unifedi_api_access_scopes_permission_type_sealed.dart';
import '../../../../../converter/sealed_converter.dart';

const _converter = UnifediApiAccessScopesPermissionTypePleromaConverter();

class UnifediApiAccessScopesPermissionTypePleromaConverter
    implements
        SealedConverter<UnifediApiAccessScopesPermissionType,
            PleromaApiAccessScopesPermissionType> {
  const UnifediApiAccessScopesPermissionTypePleromaConverter();

  @override
  UnifediApiAccessScopesPermissionType convertFrom(
    PleromaApiAccessScopesPermissionType item,
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
  PleromaApiAccessScopesPermissionType convertTo(
    UnifediApiAccessScopesPermissionType item,
  ) =>
      item.map(
        read: (_) => PleromaApiAccessScopesPermissionType.readValue,
        write: (_) => PleromaApiAccessScopesPermissionType.writeValue,
        follow: (_) => PleromaApiAccessScopesPermissionType.followValue,
        push: (_) => PleromaApiAccessScopesPermissionType.pushValue,
        adminRead: (_) => PleromaApiAccessScopesPermissionType.adminReadValue,
        adminWrite: (_) => PleromaApiAccessScopesPermissionType.adminWriteValue,
      );
}

extension PleromaApiAccessScopesPermissionTypeUnifediExtension
    on PleromaApiAccessScopesPermissionType {
  UnifediApiAccessScopesPermissionType
      toUnifediApiAccessScopesPermissionType() => _converter.convertFrom(this);
}

extension UnifediApiAccessScopesPermissionTypePleromaExtension
    on UnifediApiAccessScopesPermissionType {
  PleromaApiAccessScopesPermissionType
      toPleromaApiAccessScopesPermissionType() => _converter.convertTo(this);
}
