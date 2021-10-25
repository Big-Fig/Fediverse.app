import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
import '../../../field/mastodon_api_field_model_impl.dart';
import 'mastodon_api_my_account_source_model.dart';

part 'mastodon_api_my_account_source_model_impl.freezed.dart';

part 'mastodon_api_my_account_source_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class MastodonApiMyAccountSource
    with _$MastodonApiMyAccountSource
    implements IMastodonApiMyAccountSource {
  const factory MastodonApiMyAccountSource({
    @HiveField(1) required String? privacy,
    @HiveField(2) required bool? sensitive,
    @HiveField(3) required String? language,
    @HiveField(4) required String? note,
    @HiveField(5) required List<MastodonApiField>? fields,
    @HiveField(6)
    @JsonKey(name: 'follow_requests_count')
        required int? followRequestsCount,
  }) = _mastodonApiMyAccountSource;

  factory MastodonApiMyAccountSource.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiMyAccountSourceFromJson(json);
}

extension IMastodonApiMyAccountSourceExtension on IMastodonApiMyAccountSource {
  MastodonApiMyAccountSource toMastodonApiMyAccountSource({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiMyAccountSource(
          privacy: privacy,
          sensitive: sensitive,
          language: language,
          note: note,
          fields: fields?.toMastodonApiFieldList(
            forceNewObject: forceNewObject,
          ),
          followRequestsCount: followRequestsCount,
        ),
        forceNewObject: forceNewObject,
      );
}
