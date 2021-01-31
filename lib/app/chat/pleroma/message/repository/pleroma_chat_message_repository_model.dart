import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:moor/moor.dart';

class PleromaChatMessageRepositoryFilters {
  final List<IPleromaChat> onlyInChats;

  PleromaChatMessageRepositoryFilters({
    this.onlyInChats,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaChatMessageRepositoryFilters &&
          runtimeType == other.runtimeType &&
          onlyInChats == other.onlyInChats;

  @override
  int get hashCode => onlyInChats.hashCode;

  @override
  String toString() {
    return 'PleromaChatMessageRepositoryFilters{'
        'onlyInChats: $onlyInChats'
        '}';
  }
}

enum PleromaChatMessageOrderType {
  remoteId,
  createdAt,
}

class PleromaChatMessageOrderingTermData {
  final PleromaChatMessageOrderType orderType;
  final OrderingMode orderingMode;

  const PleromaChatMessageOrderingTermData({
    @required this.orderType,
    @required this.orderingMode,
  });

  static const PleromaChatMessageOrderingTermData remoteIdDesc =
      PleromaChatMessageOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: PleromaChatMessageOrderType.remoteId,
  );
  static const PleromaChatMessageOrderingTermData remoteIdAsc =
      PleromaChatMessageOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: PleromaChatMessageOrderType.remoteId,
  );

  static const PleromaChatMessageOrderingTermData createdAtDesc =
      PleromaChatMessageOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: PleromaChatMessageOrderType.createdAt,
  );
  static const PleromaChatMessageOrderingTermData createdAtAsc =
      PleromaChatMessageOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: PleromaChatMessageOrderType.createdAt,
  );

  @override
  String toString() {
    return 'ChatMessageOrderingTermData{'
        'orderByType: $orderType, '
        'orderingMode: $orderingMode'
        '}';
  }
}
