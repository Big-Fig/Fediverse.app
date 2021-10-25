import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../api/pagination/unifedi_api_pagination_model.dart';

part 'unifedi_api_pagination_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_pagination_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiPaginationPleromaAdapter
    with _$UnifediApiPaginationPleromaAdapter
    implements IUnifediApiPagination {
  const UnifediApiPaginationPleromaAdapter._();
  const factory UnifediApiPaginationPleromaAdapter(
    @HiveField(0) PleromaApiPagination valuePagination,
  ) = _UnifediApiPaginationPleromaAdapter;

  @override
  int? get limit => valuePagination.limit;

  @override
  String? get maxId => valuePagination.maxId;

  @override
  String? get minId => valuePagination.minId;
  factory UnifediApiPaginationPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPaginationPleromaAdapterFromJson(json);
}

extension IUnifediApiPaginationPleromaExtension on IUnifediApiPagination {
  PleromaApiPagination toPleromaApiPagination() => PleromaApiPagination(
        limit: limit,
        maxId: maxId,
        minId: minId,
        sinceId: null,
      );
}

extension PleromaApiPaginationUnifediExtension on IPleromaApiPagination {
  UnifediApiPaginationPleromaAdapter toUnifediApiPaginationPleromaAdapter() =>
      UnifediApiPaginationPleromaAdapter(
        toPleromaApiPagination(),
      );
}

extension PleromaApiPaginationUnifediListExtension
    on List<IPleromaApiPagination> {
  List<UnifediApiPaginationPleromaAdapter>
      toUnifediApiPaginationPleromaAdapterList() => map(
            (item) => item.toUnifediApiPaginationPleromaAdapter(),
          ).toList();
}
