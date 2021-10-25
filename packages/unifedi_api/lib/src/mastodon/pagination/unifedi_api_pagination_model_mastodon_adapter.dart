import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../api/pagination/unifedi_api_pagination_model.dart';

part 'unifedi_api_pagination_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_pagination_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiPaginationMastodonAdapter
    with _$UnifediApiPaginationMastodonAdapter
    implements IUnifediApiPagination {
  const UnifediApiPaginationMastodonAdapter._();
  const factory UnifediApiPaginationMastodonAdapter(
    @HiveField(0) MastodonApiPagination valuePagination,
  ) = _UnifediApiPaginationMastodonAdapter;

  @override
  int? get limit => valuePagination.limit;

  @override
  String? get maxId => valuePagination.maxId;

  @override
  String? get minId => valuePagination.minId;
  factory UnifediApiPaginationMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPaginationMastodonAdapterFromJson(json);
}

extension IUnifediApiPaginationMastodonExtension on IUnifediApiPagination {
  MastodonApiPagination toMastodonApiPagination() => MastodonApiPagination(
        limit: limit,
        maxId: maxId,
        minId: minId,
        sinceId: null,
        // sinceId: sinceId,
      );
}

extension MastodonApiPaginationUnifediExtension on IMastodonApiPagination {
  UnifediApiPaginationMastodonAdapter toUnifediApiPaginationMastodonAdapter() =>
      UnifediApiPaginationMastodonAdapter(
        toMastodonApiPagination(),
      );
}

extension MastodonApiPaginationUnifediListExtension
    on List<IMastodonApiPagination> {
  List<UnifediApiPaginationMastodonAdapter>
      toUnifediApiPaginationMastodonAdapterList() => map(
            (item) => item.toUnifediApiPaginationMastodonAdapter(),
          ).toList();
}
