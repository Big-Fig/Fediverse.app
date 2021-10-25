import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';
import '../../api/tag/history/unifedi_api_tag_history_model.dart';
import '../../api/tag/unifedi_api_tag_model.dart';

part 'unifedi_api_featured_tags_model_mastodon_adapter.freezed.dart';
part 'unifedi_api_featured_tags_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiFeaturedTagMastodonAdapter
    with _$UnifediApiFeaturedTagMastodonAdapter
    implements IUnifediApiTag {
  const UnifediApiFeaturedTagMastodonAdapter._();
  const factory UnifediApiFeaturedTagMastodonAdapter(
    @HiveField(0) MastodonApiFeaturedTag value,
  ) = _UnifediApiFeaturedTagMastodonAdapter;

  @override
  IUnifediApiTagHistory? get history => null;

  @override
  String get name => value.name;

  @override
  String? get url => null;

  @override
  String? get id => value.id;

  @override
  DateTime? get lastStatusAt => value.lastStatusAt;

  @override
  int? get statusesCount => value.statusesCount;
  factory UnifediApiFeaturedTagMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiFeaturedTagMastodonAdapterFromJson(json);
}

extension MastodonApiFeaturedTagUnifediExtension on IMastodonApiFeaturedTag {
  UnifediApiFeaturedTagMastodonAdapter
      toUnifediApiFeaturedTagMastodonAdapter() =>
          UnifediApiFeaturedTagMastodonAdapter(
            toMastodonApiFeaturedTag(),
          );
}

extension MastodonApiFeaturedTagUnifediListExtension
    on List<IMastodonApiFeaturedTag> {
  List<UnifediApiFeaturedTagMastodonAdapter>
      toUnifediApiFeaturedTagMastodonAdapterList() => map(
            (item) => item.toUnifediApiFeaturedTagMastodonAdapter(),
          ).toList();
}
