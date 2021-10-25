import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../pleroma_api_model.dart';

part 'pleroma_api_access_scopes_permission_type_sealed.freezed.dart';

// ignore_for_file: no-magic-number
@freezed
class PleromaApiAccessScopesPermissionType
    with _$PleromaApiAccessScopesPermissionType
    implements IPleromaApiUnion {
  static const readStringValue =
      MastodonApiAccessScopesPermissionType.readStringValue;
  static const writeStringValue =
      MastodonApiAccessScopesPermissionType.writeStringValue;
  static const followStringValue =
      MastodonApiAccessScopesPermissionType.followStringValue;
  static const pushStringValue =
      MastodonApiAccessScopesPermissionType.pushStringValue;
  static const adminReadStringValue =
      MastodonApiAccessScopesPermissionType.adminReadStringValue;
  static const adminWriteStringValue =
      MastodonApiAccessScopesPermissionType.adminWriteStringValue;

  static const readValue = PleromaApiAccessScopesPermissionType.read();
  static const writeValue = PleromaApiAccessScopesPermissionType.write();
  static const followValue = PleromaApiAccessScopesPermissionType.follow();
  static const pushValue = PleromaApiAccessScopesPermissionType.push();
  static const adminReadValue =
      PleromaApiAccessScopesPermissionType.adminRead();
  static const adminWriteValue =
      PleromaApiAccessScopesPermissionType.adminWrite();

  static const values = [
    readValue,
    writeValue,
    followValue,
    adminReadValue,
    adminWriteValue,
  ];

  const factory PleromaApiAccessScopesPermissionType.read({
    @Default(PleromaApiAccessScopesPermissionType.readStringValue)
        String stringValue,
  }) = _Read;

  const factory PleromaApiAccessScopesPermissionType.write({
    @Default(PleromaApiAccessScopesPermissionType.writeStringValue)
        String stringValue,
  }) = _Write;

  const factory PleromaApiAccessScopesPermissionType.follow({
    @Default(PleromaApiAccessScopesPermissionType.followStringValue)
        String stringValue,
  }) = _Valid;

  const factory PleromaApiAccessScopesPermissionType.push({
    @Default(PleromaApiAccessScopesPermissionType.pushStringValue)
        String stringValue,
  }) = _Push;

  const factory PleromaApiAccessScopesPermissionType.adminRead({
    @Default(PleromaApiAccessScopesPermissionType.adminReadStringValue)
        String stringValue,
  }) = _AdminRead;

  const factory PleromaApiAccessScopesPermissionType.adminWrite({
    @Default(PleromaApiAccessScopesPermissionType.adminReadStringValue)
        String stringValue,
  }) = _AdminWrite;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static PleromaApiAccessScopesPermissionType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: null,
      );
}

extension PleromaApiAccessScopesPermissionTypeStringExtension on String {
  PleromaApiAccessScopesPermissionType
      toPleromaApiAccessScopesPermissionType() =>
          PleromaApiAccessScopesPermissionType.fromStringValue(this);
}
