import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/status/post/poll/unifedi_api_post_status_poll_model.dart';
import '../../../../api/status/post/schedule/unifedi_api_schedule_post_status_model.dart';
import '../../../visibility/unifedi_api_visibility_sealed_pleroma_converter.dart';
import '../poll/unifedi_api_post_status_poll_model_pleroma_adapter.dart';

part 'unifedi_api_schedule_post_status_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_schedule_post_status_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiSchedulePostStatusPleromaAdapter
    with _$UnifediApiSchedulePostStatusPleromaAdapter
    implements IUnifediApiSchedulePostStatus {
  const UnifediApiSchedulePostStatusPleromaAdapter._();
  const factory UnifediApiSchedulePostStatusPleromaAdapter(
    @HiveField(0) PleromaApiSchedulePostStatus value,
  ) = _UnifediApiSchedulePostStatusPleromaAdapter;

  @override
  String? get contentType => value.contentType;

  @override
  int? get expiresInSeconds => value.expiresInSeconds;

  @override
  String? get inReplyToConversationId => value.inReplyToConversationId;

  @override
  String? get inReplyToId => value.inReplyToId;

  @override
  String? get language => value.language;

  @override
  List<String>? get mediaIds => value.mediaIds;

  @override
  IUnifediApiPostStatusPoll? get poll =>
      value.poll?.toUnifediApiPostStatusPollPleromaAdapter();

  @override
  bool? get preview => value.preview;

  @override
  bool get sensitive => value.sensitive;

  @override
  String? get spoilerText => value.spoilerText;

  @override
  String? get status => value.status;

  @override
  List<String>? get to => value.to;

  @override
  String get visibility =>
      value.visibilityAsPleromaApi.toUnifediApiVisibility().stringValue;

  @override
  DateTime get scheduledAt => value.scheduledAt;
  factory UnifediApiSchedulePostStatusPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiSchedulePostStatusPleromaAdapterFromJson(json);
}

extension PleromaApiSchedulePostStatusUnifediExtension
    on IPleromaApiSchedulePostStatus {
  UnifediApiSchedulePostStatusPleromaAdapter
      toUnifediApiSchedulePostStatusPleromaAdapter() =>
          UnifediApiSchedulePostStatusPleromaAdapter(
            toPleromaApiSchedulePostStatus(),
          );
}

extension IUnifediApiSchedulePostStatusPleromaExtension
    on IUnifediApiSchedulePostStatus {
  PleromaApiSchedulePostStatus toPleromaApiSchedulePostStatus() =>
      PleromaApiSchedulePostStatus(
        contentType: contentType,
        expiresInSeconds: expiresInSeconds,
        inReplyToConversationId: inReplyToConversationId,
        inReplyToId: inReplyToId,
        language: language,
        visibility: visibility.toPleromaApiVisibility().stringValue,
        mediaIds: mediaIds,
        poll: poll?.toPleromaApiPostStatusPoll(),
        preview: preview,
        sensitive: sensitive,
        spoilerText: spoilerText,
        status: status,
        to: to,
        scheduledAt: scheduledAt,
      );
}

extension PleromaApiSchedulePostStatusUnifediListExtension
    on List<IPleromaApiSchedulePostStatus> {
  List<UnifediApiSchedulePostStatusPleromaAdapter>
      toUnifediApiSchedulePostStatusPleromaAdapterList() => map(
            (item) => item.toUnifediApiSchedulePostStatusPleromaAdapter(),
          ).toList();
}
