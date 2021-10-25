import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';
import '../../api/mention/unifedi_api_mention_model.dart';

part 'unifedi_api_mention_model_mastodon_adapter.freezed.dart';
part 'unifedi_api_mention_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiMentionMastodonAdapter
    with _$UnifediApiMentionMastodonAdapter
    implements IUnifediApiMention {
  const UnifediApiMentionMastodonAdapter._();
  const factory UnifediApiMentionMastodonAdapter(
    @HiveField(0) MastodonApiMention value,
  ) = _UnifediApiMentionMastodonAdapter;

  @override
  String get acct => value.acct;

  @override
  String get id => value.id;

  @override
  String? get username => value.username;

  @override
  String get url => value.url;
  factory UnifediApiMentionMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiMentionMastodonAdapterFromJson(json);
}

extension MastodonApiMentionUnifediExtension on IMastodonApiMention {
  UnifediApiMentionMastodonAdapter toUnifediApiMentionMastodonAdapter() =>
      UnifediApiMentionMastodonAdapter(
        toMastodonApiMention(),
      );
}

extension MastodonApiMentionUnifediListExtension on List<IMastodonApiMention> {
  List<UnifediApiMentionMastodonAdapter>
      toUnifediApiMentionMastodonAdapterList() => map(
            (item) => item.toUnifediApiMentionMastodonAdapter(),
          ).toList();
}
