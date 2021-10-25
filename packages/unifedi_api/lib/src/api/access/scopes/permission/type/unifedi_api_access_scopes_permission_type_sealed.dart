import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../unifedi_api_model.dart';

part 'unifedi_api_access_scopes_permission_type_sealed.freezed.dart';

// ignore_for_file: no-magic-number
@freezed
class UnifediApiAccessScopesPermissionType
    with _$UnifediApiAccessScopesPermissionType
    implements IUnifediApiUnion {
  static const readStringValue = 'read';
  static const writeStringValue = 'write';
  static const followStringValue = 'follow';
  static const pushStringValue = 'push';
  static const adminReadStringValue = 'admin:read';
  static const adminWriteStringValue = 'admin:write';

  static const readValue = UnifediApiAccessScopesPermissionType.read();
  static const writeValue = UnifediApiAccessScopesPermissionType.write();
  static const followValue = UnifediApiAccessScopesPermissionType.follow();
  static const pushValue = UnifediApiAccessScopesPermissionType.push();
  static const adminReadValue =
      UnifediApiAccessScopesPermissionType.adminRead();
  static const adminWriteValue =
      UnifediApiAccessScopesPermissionType.adminWrite();

  static const values = [
    readValue,
    writeValue,
    followValue,
    adminReadValue,
    adminWriteValue,
  ];

  const factory UnifediApiAccessScopesPermissionType.read({
    @Default(UnifediApiAccessScopesPermissionType.readStringValue)
        String stringValue,
  }) = _Read;

  const factory UnifediApiAccessScopesPermissionType.write({
    @Default(UnifediApiAccessScopesPermissionType.writeStringValue)
        String stringValue,
  }) = _Write;

  const factory UnifediApiAccessScopesPermissionType.follow({
    @Default(UnifediApiAccessScopesPermissionType.followStringValue)
        String stringValue,
  }) = _Valid;

  const factory UnifediApiAccessScopesPermissionType.push({
    @Default(UnifediApiAccessScopesPermissionType.pushStringValue)
        String stringValue,
  }) = _Push;

  const factory UnifediApiAccessScopesPermissionType.adminRead({
    @Default(UnifediApiAccessScopesPermissionType.adminReadStringValue)
        String stringValue,
  }) = _AdminRead;

  const factory UnifediApiAccessScopesPermissionType.adminWrite({
    @Default(UnifediApiAccessScopesPermissionType.adminReadStringValue)
        String stringValue,
  }) = _AdminWrite;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static UnifediApiAccessScopesPermissionType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: null,
      );
}

extension UnifediApiAccessScopesPermissionTypeStringExtension on String {
  UnifediApiAccessScopesPermissionType
      toUnifediApiAccessScopesPermissionType() =>
          UnifediApiAccessScopesPermissionType.fromStringValue(this);
}
