import 'package:flutter/widgets.dart';

class DurationPickerResult {
  final Duration duration;
  final bool canceled;
  final bool deleted;

  DurationPickerResult({
    @required this.duration,
    @required this.canceled,
    @required this.deleted,
  });

  @override
  String toString() {
    return 'DurationPickerResult{duration: $duration,'
        ' canceled: $canceled, deleted: $deleted}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DurationPickerResult &&
          runtimeType == other.runtimeType &&
          duration == other.duration &&
          canceled == other.canceled &&
          deleted == other.deleted;

  @override
  int get hashCode => duration.hashCode ^ canceled.hashCode ^ deleted.hashCode;
}
