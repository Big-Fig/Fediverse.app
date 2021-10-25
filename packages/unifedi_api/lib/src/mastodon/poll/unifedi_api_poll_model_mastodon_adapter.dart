import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';
import '../../api/poll/option/unifedi_api_poll_option_model.dart';
import '../../api/poll/unifedi_api_poll_model.dart';
import 'option/unifedi_api_poll_option_model_mastodon_adapter.dart';

part 'unifedi_api_poll_model_mastodon_adapter.freezed.dart';
part 'unifedi_api_poll_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiPollMastodonAdapter
    with _$UnifediApiPollMastodonAdapter
    implements IUnifediApiPoll {
  const UnifediApiPollMastodonAdapter._();
  const factory UnifediApiPollMastodonAdapter(
    @HiveField(0) MastodonApiPoll value,
  ) = _UnifediApiPollMastodonAdapter;

  @override
  bool get expired => value.expired;

  @override
  DateTime? get expiresAt => value.expiresAt;

  @override
  String? get id => value.id;

  @override
  bool get multiple => value.multiple;

  @override
  List<IUnifediApiPollOption> get options =>
      value.options.toUnifediApiPollOptionMastodonAdapterList();

  @override
  List<int>? get ownVotes => value.ownVotes;

  @override
  bool? get voted => value.voted;

  @override
  int? get votersCount => value.votersCount;

  @override
  int? get votesCount => value.votesCount;
  factory UnifediApiPollMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPollMastodonAdapterFromJson(json);
}

extension MastodonApiPollUnifediExtension on IMastodonApiPoll {
  UnifediApiPollMastodonAdapter toUnifediApiPollMastodonAdapter() =>
      UnifediApiPollMastodonAdapter(
        toMastodonApiPoll(),
      );
}

extension MastodonApiPollUnifediListExtension on List<IMastodonApiPoll> {
  List<UnifediApiPollMastodonAdapter> toUnifediApiPollMastodonAdapterList() =>
      map(
        (item) => item.toUnifediApiPollMastodonAdapter(),
      ).toList();
}
