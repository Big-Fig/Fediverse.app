import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../api/status/post/poll/unifedi_api_post_status_poll_model.dart';
import '../../../../api/status/scheduled/params/unifedi_api_scheduled_status_params_model.dart';
import '../../../visibility/unifedi_api_visibility_sealed_mastodon_converter.dart';
import '../../post/poll/unifedi_api_post_status_poll_model_mastodon_adapter.dart';

part 'unifedi_api_scheduled_status_params_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_scheduled_status_params_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiScheduledStatusParamsMastodonAdapter
    with _$UnifediApiScheduledStatusParamsMastodonAdapter
    implements IUnifediApiScheduledStatusParams {
  const UnifediApiScheduledStatusParamsMastodonAdapter._();
  const factory UnifediApiScheduledStatusParamsMastodonAdapter(
    @HiveField(0) MastodonApiScheduledStatusParams value,
  ) = _UnifediApiScheduledStatusParamsMastodonAdapter;

  @override
  int? get expiresInSeconds => null;

  @override
  String? get inReplyToConversationId => null;

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
  DateTime get scheduledAt => value.scheduledAt;

  @override
  bool get sensitive => value.sensitive;

  @override
  String? get spoilerText => value.spoilerText;

  @override
  String? get text => value.text;

  @override
  List<String>? get to => null;

  @override
  String get visibility =>
      value.visibilityAsMastodonApi.toUnifediApiVisibility().stringValue;
  factory UnifediApiScheduledStatusParamsMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiScheduledStatusParamsMastodonAdapterFromJson(json);
}

extension MastodonApiScheduledStatusParamsUnifediExtension
    on IMastodonApiScheduledStatusParams {
  UnifediApiScheduledStatusParamsMastodonAdapter
      toUnifediApiScheduledStatusParamsMastodonAdapter() =>
          UnifediApiScheduledStatusParamsMastodonAdapter(
            toMastodonApiScheduledStatusParams(),
          );
}

extension MastodonApiScheduledStatusParamsUnifediListExtension
    on List<IMastodonApiScheduledStatusParams> {
  List<UnifediApiScheduledStatusParamsMastodonAdapter>
      toUnifediApiScheduledStatusParamsMastodonAdapterList() => map(
            (item) => item.toUnifediApiScheduledStatusParamsMastodonAdapter(),
          ).toList();
}
