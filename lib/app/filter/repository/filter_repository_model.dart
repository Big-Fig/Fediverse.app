import 'package:fedi/repository/repository_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moor/moor.dart' as moor;
import 'package:unifedi_api/unifedi_api.dart';

part 'filter_repository_model.freezed.dart';

@freezed
class FilterRepositoryFilters with _$FilterRepositoryFilters {
  static const FilterRepositoryFilters empty = FilterRepositoryFilters();

  const factory FilterRepositoryFilters({
    final List<UnifediApiFilterContextType>? onlyWithContextTypes,
    final bool? notExpired,
  }) = _FilterRepositoryFilters;
}

enum FilterOrderType {
  remoteId,
}

@freezed
class FilterOrderingTermData
    with _$FilterOrderingTermData
    implements RepositoryOrderingTerm {
  const factory FilterOrderingTermData({
    required FilterOrderType orderType,
    required moor.OrderingMode orderingMode,
  }) = _FilterOrderingTermData;

  static const FilterOrderingTermData remoteIdDesc = FilterOrderingTermData(
    orderingMode: moor.OrderingMode.desc,
    orderType: FilterOrderType.remoteId,
  );
  static const FilterOrderingTermData remoteIdAsc = FilterOrderingTermData(
    orderingMode: moor.OrderingMode.asc,
    orderType: FilterOrderType.remoteId,
  );

  static const List<FilterOrderingTermData> defaultTerms = [
    remoteIdDesc,
  ];
}
