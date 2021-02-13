import 'package:fedi/enum/enum_values.dart';
import 'package:json_annotation/json_annotation.dart';

enum PendingState {
  notSentYet, published, pending, fail,
}


extension PendingStateJsonValueExtension on PendingState {
  String toJsonValue() => _pendingStateValues.enumToValueMap[this];
}

extension PendingStateStringExtension on String {
  PendingState toPendingState() {
    var pendingState = _pendingStateValues.valueToEnumMap[this];
    return pendingState;
  }
}

final _pendingStateValues = EnumValues({
  "notSentYet": PendingState.notSentYet,
  "published": PendingState.published,
  "pending": PendingState.pending,
  "fail": PendingState.fail,
});

class PendingStateTypeConverter
    implements JsonConverter<PendingState, String> {
  const PendingStateTypeConverter();

  @override
  PendingState fromJson(String value) => value.toPendingState();

  @override
  String toJson(PendingState value) => value.toJsonValue();
}
