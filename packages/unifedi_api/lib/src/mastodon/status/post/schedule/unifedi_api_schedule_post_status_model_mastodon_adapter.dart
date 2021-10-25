import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../api/status/post/poll/unifedi_api_post_status_poll_model.dart';
import '../../../../api/status/post/schedule/unifedi_api_schedule_post_status_model.dart';
import '../../../visibility/unifedi_api_visibility_sealed_mastodon_converter.dart';
import '../poll/unifedi_api_post_status_poll_model_mastodon_adapter.dart';

part 'unifedi_api_schedule_post_status_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_schedule_post_status_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiSchedulePostStatusMastodonAdapter
    with _$UnifediApiSchedulePostStatusMastodonAdapter
    implements IUnifediApiSchedulePostStatus {
  const UnifediApiSchedulePostStatusMastodonAdapter._();
  const factory UnifediApiSchedulePostStatusMastodonAdapter(
    @HiveField(0) MastodonApiSchedulePostStatus value,
  ) = _UnifediApiSchedulePostStatusMastodonAdapter;

  @override
  String? get inReplyToId => value.inReplyToId;

  @override
  String? get language => value.language;

  @override
  List<String>? get mediaIds => value.mediaIds;

  @override
  IUnifediApiPostStatusPoll? get poll =>
      value.poll?.toUnifediApiPostStatusPollMastodonAdapter();

  @override
  bool get sensitive => value.sensitive;

  @override
  String? get spoilerText => value.spoilerText;

  @override
  String? get status => value.status;

  @override
  String get visibility =>
      value.visibilityAsMastodonApi.toUnifediApiVisibility().stringValue;

  @override
  String? get contentType => null;

  @override
  int? get expiresInSeconds => null;

  @override
  String? get inReplyToConversationId => null;

  @override
  bool? get preview => null;

  @override
  DateTime get scheduledAt => value.scheduledAt;

  @override
  List<String>? get to => null;

  factory UnifediApiSchedulePostStatusMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiSchedulePostStatusMastodonAdapterFromJson(json);
}

extension MastodonApiSchedulePostStatusUnifediExtension
    on IMastodonApiSchedulePostStatus {
  UnifediApiSchedulePostStatusMastodonAdapter
      toUnifediApiSchedulePostStatusMastodonAdapter() =>
          UnifediApiSchedulePostStatusMastodonAdapter(
            toMastodonApiSchedulePostStatus(),
          );
}

extension IUnifediApiSchedulePostStatusMastodonExtension
    on IUnifediApiSchedulePostStatus {
  MastodonApiSchedulePostStatus toMastodonApiSchedulePostStatus() =>
      MastodonApiSchedulePostStatus(
        inReplyToId: inReplyToId,
        language: language,
        visibility: visibility.toMastodonApiVisibility().stringValue,
        mediaIds: mediaIds,
        poll: poll?.toMastodonApiPostStatusPoll(),
        sensitive: sensitive,
        spoilerText: spoilerText,
        status: status,
        scheduledAt: scheduledAt,
      );
}

extension MastodonApiSchedulePostStatusUnifediListExtension
    on List<IMastodonApiSchedulePostStatus> {
  List<UnifediApiSchedulePostStatusMastodonAdapter>
      toUnifediApiSchedulePostStatusMastodonAdapterList() => map(
            (item) => item.toUnifediApiSchedulePostStatusMastodonAdapter(),
          ).toList();
}
