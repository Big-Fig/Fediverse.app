import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_sensitive_model.freezed.dart';

@freezed
class StatusSensitiveWarningState with _$StatusSensitiveWarningState {
  const StatusSensitiveWarningState._();

  const factory StatusSensitiveWarningState({
    required bool nsfwSensitive,
    required bool containsSpoiler,
    required bool displayEnabled,
  }) = _StatusSensitiveWarningState;

  bool get containsSpoilerAndDisplayEnabled =>
      !containsSpoiler || displayEnabled;

  bool get nsfwSensitiveAndDisplayEnabled => !nsfwSensitive || displayEnabled;
}
