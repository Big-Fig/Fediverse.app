import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/filter/pleroma_api_filter_model.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiFilterService extends IPleromaApi {
  static IPleromaApiFilterService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPleromaApiFilterService>(context, listen: listen);

  Future<List<IPleromaApiFilter>> getFilters({
    IPleromaApiPaginationRequest? pagination,
  });

  Future<IPleromaApiFilter> getFilter({
    required String? filterRemoteId,
  });

  Future deleteFilter({
    required String? filterRemoteId,
  });

  Future<IPleromaApiFilter> createFilter({
    required IPostPleromaApiFilter postPleromaFilter,
  });

  Future<IPleromaApiFilter> updateFilter({
    required String? filterRemoteId,
    required IPostPleromaApiFilter postPleromaFilter,
  });
}
