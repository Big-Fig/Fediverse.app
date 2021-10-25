import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/status/post/poll/unifedi_api_post_status_poll_model.dart';
import '../../../api/status/post/unifedi_api_post_status_model.dart';
import '../../visibility/unifedi_api_visibility_sealed_pleroma_converter.dart';
import 'poll/unifedi_api_post_status_poll_model_pleroma_adapter.dart';

part 'unifedi_api_post_status_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_post_status_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiPostStatusPleromaAdapter
    with _$UnifediApiPostStatusPleromaAdapter
    implements IUnifediApiPostStatus {
  const UnifediApiPostStatusPleromaAdapter._();
  const factory UnifediApiPostStatusPleromaAdapter(
    @HiveField(0) PleromaApiPostStatus value,
  ) = _UnifediApiPostStatusPleromaAdapter;

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
  factory UnifediApiPostStatusPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPostStatusPleromaAdapterFromJson(json);
}

extension PleromaApiPostStatusUnifediExtension on IPleromaApiPostStatus {
  UnifediApiPostStatusPleromaAdapter toUnifediApiPostStatusPleromaAdapter() =>
      UnifediApiPostStatusPleromaAdapter(
        toPleromaApiPostStatus(),
      );
}

extension IUnifediApiPostStatusPleromaExtension on IUnifediApiPostStatus {
  PleromaApiPostStatus toPleromaApiPostStatus() => PleromaApiPostStatus(
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
      );
}

extension PleromaApiPostStatusUnifediListExtension
    on List<IPleromaApiPostStatus> {
  List<UnifediApiPostStatusPleromaAdapter>
      toUnifediApiPostStatusPleromaAdapterList() => map(
            (item) => item.toUnifediApiPostStatusPleromaAdapter(),
          ).toList();
}
