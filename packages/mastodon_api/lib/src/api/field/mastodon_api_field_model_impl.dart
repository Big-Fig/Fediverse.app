import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mastodon_api_field_model.dart';

// ignore_for_file: no-magic-number

part 'mastodon_api_field_model_impl.freezed.dart';

part 'mastodon_api_field_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class MastodonApiField with _$MastodonApiField implements IMastodonApiField {
  const factory MastodonApiField({
    @HiveField(0) required String? name,
    @HiveField(1) required String? value,
    @HiveField(2) @JsonKey(name: 'verified_at') required DateTime? verifiedAt,
  }) = _MastodonApiField;

  factory MastodonApiField.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiFieldFromJson(json);
}

extension MastodonApiFieldInterfaceExtension on IMastodonApiField {
  MastodonApiField toMastodonApiField({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiField(
          name: name,
          value: value,
          verifiedAt: verifiedAt,
        ),
        forceNewObject: forceNewObject,
      );
}

extension MastodonApiFieldInterfaceListExtension on List<IMastodonApiField> {
  List<MastodonApiField> toMastodonApiFieldList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiField item) => item.toMastodonApiField(),
        forceNewObject: forceNewObject,
      );
}
