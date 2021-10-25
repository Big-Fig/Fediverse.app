import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';
import '../../../api/poll/option/unifedi_api_poll_option_model.dart';

part 'unifedi_api_poll_option_model_mastodon_adapter.freezed.dart';
part 'unifedi_api_poll_option_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiPollOptionMastodonAdapter
    with _$UnifediApiPollOptionMastodonAdapter
    implements IUnifediApiPollOption {
  const UnifediApiPollOptionMastodonAdapter._();
  const factory UnifediApiPollOptionMastodonAdapter(
    @HiveField(0) MastodonApiPollOption value,
  ) = _UnifediApiPollOptionMastodonAdapter;

  @override
  String get title => value.title;

  @override
  int? get votesCount => value.votesCount;
  factory UnifediApiPollOptionMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPollOptionMastodonAdapterFromJson(json);
}

extension MastodonApiPollOptionUnifediExtension on IMastodonApiPollOption {
  UnifediApiPollOptionMastodonAdapter toUnifediApiPollOptionMastodonAdapter() =>
      UnifediApiPollOptionMastodonAdapter(
        toMastodonApiPollOption(),
      );
}

extension MastodonApiPollOptionUnifediListExtension
    on List<IMastodonApiPollOption> {
  List<UnifediApiPollOptionMastodonAdapter>
      toUnifediApiPollOptionMastodonAdapterList() => map(
            (item) => item.toUnifediApiPollOptionMastodonAdapter(),
          ).toList();
}
