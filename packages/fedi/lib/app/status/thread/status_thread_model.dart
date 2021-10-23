import 'package:fedi/app/status/status_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_thread_model.freezed.dart';

@freezed
class StatusThreadStatusAtIndex with _$StatusThreadStatusAtIndex {
  const factory StatusThreadStatusAtIndex({
    required IStatus status,
    required int index,
  }) = _StatusThreadStatusAtIndex;
}
