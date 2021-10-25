import 'package:fedi_app/repository/repository_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moor/moor.dart' as moor;

part 'instance_announcement_repository_model.freezed.dart';

@freezed
class InstanceAnnouncementRepositoryFilters
    with _$InstanceAnnouncementRepositoryFilters {
  static final InstanceAnnouncementRepositoryFilters empty =
      InstanceAnnouncementRepositoryFilters.only();

  const InstanceAnnouncementRepositoryFilters._();

  const factory InstanceAnnouncementRepositoryFilters({
    required bool? withDismissed,
    required bool? withExpired,
    required bool? withNotStartedYet,
  }) = _InstanceAnnouncementRepositoryFilters;

  static InstanceAnnouncementRepositoryFilters only({
    bool? withDismissed,
    bool? withExpired,
    bool? withNotStartedYet,
  }) =>
      InstanceAnnouncementRepositoryFilters(
        withDismissed: withDismissed,
        withExpired: withExpired,
        withNotStartedYet: withNotStartedYet,
      );
}

enum InstanceAnnouncementOrderType {
  remoteId,
  updatedAt,
}

@freezed
class InstanceAnnouncementOrderingTermData
    with _$InstanceAnnouncementOrderingTermData
    implements RepositoryOrderingTerm {
  const InstanceAnnouncementOrderingTermData._();

  const factory InstanceAnnouncementOrderingTermData({
    required InstanceAnnouncementOrderType orderType,
    required moor.OrderingMode orderingMode,
  }) = _InstanceAnnouncementOrderingTermData;

  static const InstanceAnnouncementOrderingTermData remoteIdDesc =
      InstanceAnnouncementOrderingTermData(
    orderingMode: moor.OrderingMode.desc,
    orderType: InstanceAnnouncementOrderType.remoteId,
  );
  static const InstanceAnnouncementOrderingTermData remoteIdAsc =
      InstanceAnnouncementOrderingTermData(
    orderingMode: moor.OrderingMode.asc,
    orderType: InstanceAnnouncementOrderType.remoteId,
  );
  static const InstanceAnnouncementOrderingTermData updatedAtDesc =
      InstanceAnnouncementOrderingTermData(
    orderingMode: moor.OrderingMode.desc,
    orderType: InstanceAnnouncementOrderType.updatedAt,
  );
  static const InstanceAnnouncementOrderingTermData updatedAtAsc =
      InstanceAnnouncementOrderingTermData(
    orderingMode: moor.OrderingMode.asc,
    orderType: InstanceAnnouncementOrderType.updatedAt,
  );

  static const List<InstanceAnnouncementOrderingTermData> defaultTerms = [
    updatedAtDesc,
  ];
}
