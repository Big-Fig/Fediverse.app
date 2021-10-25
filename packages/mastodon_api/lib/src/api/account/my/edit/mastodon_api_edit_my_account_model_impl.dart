import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../field/mastodon_api_field_model_impl.dart';
import 'mastodon_api_edit_my_account_model.dart';

// ignore_for_file: no-magic-number

part 'mastodon_api_edit_my_account_model_impl.freezed.dart';

part 'mastodon_api_edit_my_account_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class MastodonApiEditMyAccount
    with _$MastodonApiEditMyAccount
    implements IMastodonApiEditMyAccount {
  const factory MastodonApiEditMyAccount({
    @JsonKey(name: 'fields_attributes')
    @HiveField(1)
        required List<MastodonApiField>? fieldsAttributes,
    @HiveField(2) required bool? discoverable,
    @HiveField(3) required bool? bot,
    @JsonKey(name: 'display_name') @HiveField(4) required String? displayName,
    @HiveField(5) required String? note,
    @HiveField(6) required bool? locked,
    @HiveField(7) required String? privacy,
    @HiveField(8) required bool? sensitive,
    @HiveField(9) required String? language,
    @JsonKey(name: 'avatar_local_file_path')
    @HiveField(10)
        required String? avatarLocalFilePath,
    @JsonKey(name: 'delete_avatar') @HiveField(11) required bool? deleteAvatar,
    @JsonKey(name: 'header_local_file_path')
    @HiveField(12)
        required String? headerLocalFilePath,
    @JsonKey(name: 'delete_header') @HiveField(13) required bool? deleteHeader,
  }) = _MastodonApiEditMyAccount;

  factory MastodonApiEditMyAccount.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiEditMyAccountFromJson(json);
}

extension IMastodonApiEditMyAccountExtension on IMastodonApiEditMyAccount {
  MastodonApiEditMyAccount toMastodonApiEditMyAccount({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiEditMyAccount(
          fieldsAttributes: fieldsAttributes?.toMastodonApiFieldList(),
          discoverable: discoverable,
          bot: bot,
          displayName: displayName,
          note: note,
          locked: locked,
          privacy: privacy,
          sensitive: sensitive,
          language: language,
          avatarLocalFilePath: avatarLocalFilePath,
          deleteAvatar: deleteAvatar,
          headerLocalFilePath: headerLocalFilePath,
          deleteHeader: deleteHeader,
        ),
        forceNewObject: forceNewObject,
      );
}
