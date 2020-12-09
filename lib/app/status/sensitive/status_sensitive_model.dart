import 'package:flutter/widgets.dart';

class StatusSensitiveWarningState {
  bool nsfwSensitive;
  bool containsSpoiler;
  bool displayEnabled;

  bool get containsSpoilerAndDisplayEnabled =>
      containsSpoiler != true || displayEnabled;

  bool get nsfwSensitiveAndDisplayEnabled =>
      nsfwSensitive != true || displayEnabled;

  StatusSensitiveWarningState({
    @required this.nsfwSensitive,
    @required this.containsSpoiler,
    @required this.displayEnabled,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusSensitiveWarningState &&
          runtimeType == other.runtimeType &&
          nsfwSensitive == other.nsfwSensitive &&
          containsSpoiler == other.containsSpoiler &&
          displayEnabled == other.displayEnabled;

  @override
  int get hashCode =>
      nsfwSensitive.hashCode ^
      containsSpoiler.hashCode ^
      displayEnabled.hashCode;

  @override
  String toString() {
    return 'StatusSensitiveWarningState{'
        'nsfwSensitive: $nsfwSensitive,'
        ' containsSpoiler: $containsSpoiler,'
        ' displayEnabled: $displayEnabled}';
  }
}
