import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

class PleromaChatMessageRepositoryFilters {
  final List<IPleromaChat>? onlyInChats;
  final bool onlyPendingStatePublishedOrNull;
  final bool onlyNotDeleted;
  final bool onlyNotHiddenLocallyOnDevice;
  final bool groupByChatId;

  static const PleromaChatMessageRepositoryFilters empty =
      PleromaChatMessageRepositoryFilters(
    onlyPendingStatePublishedOrNull: false,
    onlyNotDeleted: false,
    onlyNotHiddenLocallyOnDevice: false,
  );

  const PleromaChatMessageRepositoryFilters({
    this.onlyInChats,
    required this.onlyPendingStatePublishedOrNull,
    required this.onlyNotDeleted,
    required this.onlyNotHiddenLocallyOnDevice,
    this.groupByChatId = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaChatMessageRepositoryFilters &&
          runtimeType == other.runtimeType &&
          onlyInChats == other.onlyInChats &&
          onlyPendingStatePublishedOrNull ==
              other.onlyPendingStatePublishedOrNull &&
          onlyNotDeleted == other.onlyNotDeleted &&
          onlyNotHiddenLocallyOnDevice == other.onlyNotHiddenLocallyOnDevice;

  @override
  int get hashCode =>
      onlyInChats.hashCode ^
      onlyPendingStatePublishedOrNull.hashCode ^
      onlyNotDeleted.hashCode ^
      onlyNotHiddenLocallyOnDevice.hashCode;

  @override
  String toString() => 'PleromaChatMessageRepositoryFilters{'
      'onlyInChats: $onlyInChats, '
      'onlyPendingStatePublishedOrNull: $onlyPendingStatePublishedOrNull, '
      'onlyNotDeleted: $onlyNotDeleted'
      'onlyNotHiddenLocallyOnDevice: $onlyNotHiddenLocallyOnDevice'
      '}';
}

enum PleromaChatMessageOrderType {
  remoteId,
  createdAt,
}

class PleromaChatMessageRepositoryOrderingTermData extends RepositoryOrderingTerm {
  final PleromaChatMessageOrderType orderType;
  @override
  final OrderingMode orderingMode;

  const PleromaChatMessageRepositoryOrderingTermData({
    required this.orderType,
    required this.orderingMode,
  });

  static const PleromaChatMessageRepositoryOrderingTermData remoteIdDesc =
      PleromaChatMessageRepositoryOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: PleromaChatMessageOrderType.remoteId,
  );
  static const PleromaChatMessageRepositoryOrderingTermData remoteIdAsc =
      PleromaChatMessageRepositoryOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: PleromaChatMessageOrderType.remoteId,
  );

  static const PleromaChatMessageRepositoryOrderingTermData createdAtDesc =
      PleromaChatMessageRepositoryOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: PleromaChatMessageOrderType.createdAt,
  );
  static const PleromaChatMessageRepositoryOrderingTermData createdAtAsc =
      PleromaChatMessageRepositoryOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: PleromaChatMessageOrderType.createdAt,
  );

  static const List<PleromaChatMessageRepositoryOrderingTermData> defaultTerms = [
    createdAtDesc,
  ];

  @override
  String toString() {
    return 'PleromaChatMessageRepositoryOrderingTermData{'
        'orderByType: $orderType, '
        'orderingMode: $orderingMode'
        '}';
  }
}
