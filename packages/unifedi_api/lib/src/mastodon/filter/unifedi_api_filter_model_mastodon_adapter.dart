import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';
import '../../api/filter/context_type/unifedi_api_filter_context_type_model.dart';
import '../../api/filter/unifedi_api_filter_model.dart';

part 'unifedi_api_filter_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_filter_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiFilterMastodonAdapter
    with _$UnifediApiFilterMastodonAdapter
    implements IUnifediApiFilter {
  const UnifediApiFilterMastodonAdapter._();
  const factory UnifediApiFilterMastodonAdapter(
    @HiveField(0) MastodonApiFilter value,
  ) = _UnifediApiFilterMastodonAdapter;

  @override
  List<String> get context => value.context
      .map(
        (item) => item.toUnifediApiFilterContextType().stringValue,
      )
      .toList();

  @override
  DateTime? get expiresAt => value.expiresAt;

  @override
  String get id => value.id;

  @override
  bool get irreversible => value.irreversible;

  @override
  String get phrase => value.phrase;

  @override
  bool get wholeWord => value.wholeWord;
  factory UnifediApiFilterMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiFilterMastodonAdapterFromJson(json);
}

extension MastodonApiFilterUnifediExtension on IMastodonApiFilter {
  UnifediApiFilterMastodonAdapter toUnifediApiFilterMastodonAdapter() =>
      UnifediApiFilterMastodonAdapter(
        toMastodonApiFilter(),
      );
}

extension MastodonApiFilterUnifediListExtension on List<IMastodonApiFilter> {
  List<UnifediApiFilterMastodonAdapter>
      toUnifediApiFilterMastodonAdapterList() => map(
            (item) => item.toUnifediApiFilterMastodonAdapter(),
          ).toList();
}
