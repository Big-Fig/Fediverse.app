import 'package:fedi/app/status/status_model.dart';

class StatusThreadStatusAtIndex {
  final IStatus status;
  final int index;

  StatusThreadStatusAtIndex({
    required this.status,
    required this.index,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusThreadStatusAtIndex &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          index == other.index;

  @override
  int get hashCode => status.hashCode ^ index.hashCode;

  @override
  String toString() {
    return 'StatusThreadStatusAtIndex{status: $status, index: $index}';
  }
}
