import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';
import '../../api/tag/history/unifedi_api_tag_history_model.dart';
import '../../api/tag/unifedi_api_tag_model.dart';

import 'history/unifedi_api_tag_history_model_mastodon_adapter.dart';

part 'unifedi_api_tag_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_tag_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiTagMastodonAdapter
    with _$UnifediApiTagMastodonAdapter
    implements IUnifediApiTag {
  const UnifediApiTagMastodonAdapter._();
  const factory UnifediApiTagMastodonAdapter(
    @HiveField(0) MastodonApiTag value,
  ) = _UnifediApiTagMastodonAdapter;

  @override
  IUnifediApiTagHistory? get history =>
      value.history?.toUnifediApiTagHistoryMastodonAdapter();

  @override
  String get name => value.name;

  @override
  String get url => value.url;

  @override
  String? get id => null;

  @override
  DateTime? get lastStatusAt => null;

  @override
  // ignore: avoid_returning_null
  int? get statusesCount => null;
  factory UnifediApiTagMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiTagMastodonAdapterFromJson(json);
}

extension MastodonApiTagUnifediExtension on IMastodonApiTag {
  UnifediApiTagMastodonAdapter toUnifediApiTagMastodonAdapter() =>
      UnifediApiTagMastodonAdapter(
        toMastodonApiTag(),
      );
}

extension MastodonApiTagUnifediListExtension on List<IMastodonApiTag> {
  List<UnifediApiTagMastodonAdapter> toUnifediApiTagMastodonAdapterList() =>
      map(
        (item) => item.toUnifediApiTagMastodonAdapter(),
      ).toList();
}
