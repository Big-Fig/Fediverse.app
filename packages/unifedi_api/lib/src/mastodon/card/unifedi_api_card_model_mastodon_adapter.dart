import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../api/card/unifedi_api_card_model.dart';
import 'type/unifedi_api_card_type_sealed_mastodon_converter.dart';

part 'unifedi_api_card_model_mastodon_adapter.freezed.dart';
part 'unifedi_api_card_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiCardMastodonAdapter
    with _$UnifediApiCardMastodonAdapter
    implements IUnifediApiCard {
  const UnifediApiCardMastodonAdapter._();
  const factory UnifediApiCardMastodonAdapter(
    @HiveField(0) MastodonApiCard value,
  ) = _UnifediApiCardMastodonAdapter;

  @override
  String? get authorName => value.authorName;

  @override
  String? get authorUrl => value.authorUrl;

  @override
  String? get description => value.description;

  @override
  String? get embedUrl => value.embedUrl;

  @override
  int? get height => value.height;

  @override
  String? get html => value.html;

  @override
  String? get image => value.image;

  @override
  String? get providerName => value.providerName;

  @override
  String? get providerUrl => value.providerUrl;

  @override
  String? get title => value.title;

  @override
  String get type => value.typeAsMastodonApi.toUnifediApiCardType().stringValue;

  @override
  String? get url => value.url;

  @override
  int? get width => value.width;
  factory UnifediApiCardMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiCardMastodonAdapterFromJson(json);
}

extension MastodonApiCardUnifediExtension on IMastodonApiCard {
  UnifediApiCardMastodonAdapter toUnifediApiCardMastodonAdapter() =>
      UnifediApiCardMastodonAdapter(
        toMastodonApiCard(),
      );
}

extension MastodonApiCardUnifediListExtension on List<IMastodonApiCard> {
  List<UnifediApiCardMastodonAdapter> toUnifediApiCardMastodonAdapterList() =>
      map(
        (item) => item.toUnifediApiCardMastodonAdapter(),
      ).toList();
}
