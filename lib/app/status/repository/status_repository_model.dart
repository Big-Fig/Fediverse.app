import 'package:fedi/app/filter/filter_model.dart';
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

class StatusOnlyLocalCondition {
  final String localUrlHost;

  StatusOnlyLocalCondition(this.localUrlHost);

  @override
  String toString() {
    return 'StatusRepositoryOnlyLocalCondition{localUrlHost: $localUrlHost}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusOnlyLocalCondition &&
          runtimeType == other.runtimeType &&
          localUrlHost == other.localUrlHost;

  @override
  int get hashCode => localUrlHost.hashCode;
}

class StatusTextCondition {
  final String phrase;
  final bool wholeWord;

  StatusTextCondition({
    @required this.phrase,
    @required this.wholeWord,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusTextCondition &&
          runtimeType == other.runtimeType &&
          phrase == other.phrase &&
          wholeWord == other.wholeWord;

  @override
  int get hashCode => phrase.hashCode ^ wholeWord.hashCode;

  @override
  String toString() {
    return 'StatusRepositoryTextCondition{phrase: $phrase,'
        ' wholeWord: $wholeWord}';
  }
}

extension FilterStatusTextConditionAdapterExtension on IFilter {
  StatusTextCondition toStatusTextCondition() =>
      StatusTextCondition(
        phrase: phrase,
        wholeWord: wholeWord,
      );
}
