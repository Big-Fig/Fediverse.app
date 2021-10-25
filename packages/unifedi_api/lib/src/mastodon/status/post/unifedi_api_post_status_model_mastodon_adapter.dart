import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/status/post/poll/unifedi_api_post_status_poll_model.dart';
import '../../../api/status/post/unifedi_api_post_status_model.dart';
import '../../visibility/unifedi_api_visibility_sealed_mastodon_converter.dart';
import 'poll/unifedi_api_post_status_poll_model_mastodon_adapter.dart';

part 'unifedi_api_post_status_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_post_status_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiPostStatusMastodonAdapter
    with _$UnifediApiPostStatusMastodonAdapter
    implements IUnifediApiPostStatus {
  const UnifediApiPostStatusMastodonAdapter._();
  const factory UnifediApiPostStatusMastodonAdapter(
    @HiveField(0) MastodonApiPostStatus value,
  ) = _UnifediApiPostStatusMastodonAdapter;

  @override
  String? get contentType => null;

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
  bool? get preview => null;

  @override
  bool get sensitive => value.sensitive;

  @override
  String? get spoilerText => value.spoilerText;

  @override
  String? get status => value.status;

  @override
  List<String>? get to => null;

  @override
  String get visibility =>
      value.visibilityAsMastodonApi.toUnifediApiVisibility().stringValue;
  factory UnifediApiPostStatusMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPostStatusMastodonAdapterFromJson(json);
}

extension MastodonApiPostStatusUnifediExtension on IMastodonApiPostStatus {
  UnifediApiPostStatusMastodonAdapter toUnifediApiPostStatusMastodonAdapter() =>
      UnifediApiPostStatusMastodonAdapter(
        toMastodonApiPostStatus(),
      );
}

extension IUnifediApiPostStatusMastodonExtension on IUnifediApiPostStatus {
  MastodonApiPostStatus toMastodonApiPostStatus() => MastodonApiPostStatus(
        inReplyToId: inReplyToId,
        language: language,
        visibility: visibility.toMastodonApiVisibility().stringValue,
        mediaIds: mediaIds,
        poll: poll?.toMastodonApiPostStatusPoll(),
        sensitive: sensitive,
        spoilerText: spoilerText,
        status: status,
      );
}

extension MastodonApiPostStatusUnifediListExtension
    on List<IMastodonApiPostStatus> {
  List<UnifediApiPostStatusMastodonAdapter>
      toUnifediApiPostStatusMastodonAdapterList() => map(
            (item) => item.toUnifediApiPostStatusMastodonAdapter(),
          ).toList();
}
