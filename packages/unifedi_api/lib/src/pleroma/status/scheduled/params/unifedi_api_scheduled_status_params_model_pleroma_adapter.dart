import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/status/post/poll/unifedi_api_post_status_poll_model.dart';
import '../../../../api/status/scheduled/params/unifedi_api_scheduled_status_params_model.dart';
import '../../../visibility/unifedi_api_visibility_sealed_pleroma_converter.dart';
import '../../post/poll/unifedi_api_post_status_poll_model_pleroma_adapter.dart';

part 'unifedi_api_scheduled_status_params_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_scheduled_status_params_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiScheduledStatusParamsPleromaAdapter
    with _$UnifediApiScheduledStatusParamsPleromaAdapter
    implements IUnifediApiScheduledStatusParams {
  const UnifediApiScheduledStatusParamsPleromaAdapter._();
  const factory UnifediApiScheduledStatusParamsPleromaAdapter(
    @HiveField(0) PleromaApiScheduledStatusParams value,
  ) = _UnifediApiScheduledStatusParamsPleromaAdapter;

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
  DateTime get scheduledAt => value.scheduledAt;

  @override
  bool get sensitive => value.sensitive;

  @override
  String? get spoilerText => value.spoilerText;

  @override
  String? get text => value.text;

  @override
  List<String>? get to => value.to;

  @override
  String get visibility =>
      value.visibilityAsPleromaApi.toUnifediApiVisibility().stringValue;
  factory UnifediApiScheduledStatusParamsPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiScheduledStatusParamsPleromaAdapterFromJson(json);
}

extension PleromaApiScheduledStatusParamsUnifediExtension
    on IPleromaApiScheduledStatusParams {
  UnifediApiScheduledStatusParamsPleromaAdapter
      toUnifediApiScheduledStatusParamsPleromaAdapter() =>
          UnifediApiScheduledStatusParamsPleromaAdapter(
            toPleromaApiScheduledStatusParams(),
          );
}

extension PleromaApiScheduledStatusParamsUnifediListExtension
    on List<IPleromaApiScheduledStatusParams> {
  List<UnifediApiScheduledStatusParamsPleromaAdapter>
      toUnifediApiScheduledStatusParamsPleromaAdapterList() => map(
            (item) => item.toUnifediApiScheduledStatusParamsPleromaAdapter(),
          ).toList();
}
