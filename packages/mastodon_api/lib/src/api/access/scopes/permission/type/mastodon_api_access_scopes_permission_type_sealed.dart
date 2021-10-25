import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../mastodon_api_model.dart';

part 'mastodon_api_access_scopes_permission_type_sealed.freezed.dart';

// ignore_for_file: no-magic-number
@freezed
class MastodonApiAccessScopesPermissionType
    with _$MastodonApiAccessScopesPermissionType
    implements IMastodonApiUnion {
  static const readStringValue = 'read';
  static const writeStringValue = 'write';
  static const followStringValue = 'follow';
  static const pushStringValue = 'push';
  static const adminReadStringValue = 'admin:read';
  static const adminWriteStringValue = 'admin:write';

  static const readValue = MastodonApiAccessScopesPermissionType.read();
  static const writeValue = MastodonApiAccessScopesPermissionType.write();
  static const followValue = MastodonApiAccessScopesPermissionType.follow();
  static const pushValue = MastodonApiAccessScopesPermissionType.push();
  static const adminReadValue =
      MastodonApiAccessScopesPermissionType.adminRead();
  static const adminWriteValue =
      MastodonApiAccessScopesPermissionType.adminWrite();

  static const values = [
    readValue,
    writeValue,
    followValue,
    adminReadValue,
    adminWriteValue,
  ];

  const factory MastodonApiAccessScopesPermissionType.read({
    @Default(MastodonApiAccessScopesPermissionType.readStringValue)
        String stringValue,
  }) = _Read;

  const factory MastodonApiAccessScopesPermissionType.write({
    @Default(MastodonApiAccessScopesPermissionType.writeStringValue)
        String stringValue,
  }) = _Write;

  const factory MastodonApiAccessScopesPermissionType.follow({
    @Default(MastodonApiAccessScopesPermissionType.followStringValue)
        String stringValue,
  }) = _Valid;

  const factory MastodonApiAccessScopesPermissionType.push({
    @Default(MastodonApiAccessScopesPermissionType.pushStringValue)
        String stringValue,
  }) = _Push;

  const factory MastodonApiAccessScopesPermissionType.adminRead({
    @Default(MastodonApiAccessScopesPermissionType.adminReadStringValue)
        String stringValue,
  }) = _AdminRead;

  const factory MastodonApiAccessScopesPermissionType.adminWrite({
    @Default(MastodonApiAccessScopesPermissionType.adminReadStringValue)
        String stringValue,
  }) = _AdminWrite;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static MastodonApiAccessScopesPermissionType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: null,
      );
}

extension MastodonApiAccessScopesPermissionTypeStringExtension on String {
  MastodonApiAccessScopesPermissionType
      toMastodonApiAccessScopesPermissionType() =>
          MastodonApiAccessScopesPermissionType.fromStringValue(this);
}
