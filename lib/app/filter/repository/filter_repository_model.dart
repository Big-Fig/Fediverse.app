import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

class FilterRepositoryFilters {
  final List<MastodonApiFilterContextType>? onlyWithContextTypes;
  final bool? notExpired;

  static const FilterRepositoryFilters empty = FilterRepositoryFilters();

  const FilterRepositoryFilters({
    this.onlyWithContextTypes,
    this.notExpired,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilterRepositoryFilters &&
          runtimeType == other.runtimeType &&
          onlyWithContextTypes == other.onlyWithContextTypes &&
          notExpired == other.notExpired;

  @override
  int get hashCode => onlyWithContextTypes.hashCode ^ notExpired.hashCode;

  @override
  String toString() {
    return 'FilterRepositoryFilters{'
        'onlyWithContextTypes: $onlyWithContextTypes, '
        'notExpired: $notExpired'
        '}';
  }
}

enum FilterOrderType {
  remoteId,
}

class FilterOrderingTermData extends RepositoryOrderingTerm {
  final FilterOrderType orderType;
  @override
  final OrderingMode orderingMode;

  static const FilterOrderingTermData remoteIdDesc = FilterOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: FilterOrderType.remoteId,
  );
  static const FilterOrderingTermData remoteIdAsc = FilterOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: FilterOrderType.remoteId,
  );

  const FilterOrderingTermData({
    required this.orderType,
    required this.orderingMode,
  });

  static const List<FilterOrderingTermData> defaultTerms = [
    remoteIdDesc,
  ];

  @override
  String toString() {
    return 'FilterOrderingTermData{'
        'orderByType: $orderType, '
        'orderingMode: $orderingMode'
        '}';
  }
}
