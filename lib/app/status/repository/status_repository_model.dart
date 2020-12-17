import 'package:moor/moor.dart';

enum StatusRepositoryOrderType {
  remoteId,
}

class StatusRepositoryOrderingTermData {
  final StatusRepositoryOrderType orderType;
  final OrderingMode orderingMode;

  StatusRepositoryOrderingTermData({
    @required this.orderType,
    @required this.orderingMode,
  });

  @override
  String toString() {
    return 'StatusRepositoryOrderingTermData{orderType: $orderType,'
        ' orderingMode: $orderingMode}';
  }
}

class StatusRepositoryOnlyLocalCondition {
  final String localUrlHost;

  StatusRepositoryOnlyLocalCondition(this.localUrlHost);

  @override
  String toString() {
    return 'StatusRepositoryOnlyLocalCondition{localUrlHost: $localUrlHost}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusRepositoryOnlyLocalCondition &&
          runtimeType == other.runtimeType &&
          localUrlHost == other.localUrlHost;

  @override
  int get hashCode => localUrlHost.hashCode;
}
