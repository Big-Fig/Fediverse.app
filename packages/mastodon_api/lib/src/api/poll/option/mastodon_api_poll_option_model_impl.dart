import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mastodon_api_poll_option_model.dart';

part 'mastodon_api_poll_option_model_impl.freezed.dart';

part 'mastodon_api_poll_option_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class MastodonApiPollOption
    with _$MastodonApiPollOption
    implements IMastodonApiPollOption {
  const factory MastodonApiPollOption({
    @HiveField(0) required String title,
    @HiveField(1) @JsonKey(name: 'votes_count') required int? votesCount,
  }) = _MastodonApiPollOption;

  factory MastodonApiPollOption.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiPollOptionFromJson(json);
}

extension MastodonApiPollOptionInterfaceExtension on IMastodonApiPollOption {
  MastodonApiPollOption toMastodonApiPollOption({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiPollOption(
          title: title,
          votesCount: votesCount,
        ),
        forceNewObject: forceNewObject,
      );
}

extension MastodonApiPollOptionInterfaceListExtension
    on List<IMastodonApiPollOption> {
  List<MastodonApiPollOption> toMastodonApiPollOptionList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiPollOption item) => item.toMastodonApiPollOption(),
        forceNewObject: forceNewObject,
      );

  List<String> toMastodonApiPollOptionTitles() => map(
        (pollOption) => pollOption.title,
      ).toList();
}
