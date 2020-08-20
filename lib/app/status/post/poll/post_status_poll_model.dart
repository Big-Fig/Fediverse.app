import 'package:flutter/widgets.dart';

abstract class IPostStatusPoll {
  DateTime get expiresAt;

  bool get hideTotals;

  bool get multiple;

  List<String> get options;
}

class PostStatusPoll implements IPostStatusPoll {
  @override
  final DateTime expiresAt;

  @override
  bool hideTotals;

  @override
  bool multiple;

  @override
  List<String> options;
  PostStatusPoll({
    @required this.expiresAt,
    @required this.hideTotals,
    @required this.multiple,
    @required this.options,
  });


  @override
  String toString() {
    return 'PostStatusPoll{expiresAt: $expiresAt,'
        ' hideTotals: $hideTotals, multiple: $multiple,'
        ' options: $options}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostStatusPoll &&
          runtimeType == other.runtimeType &&
          expiresAt == other.expiresAt &&
          hideTotals == other.hideTotals &&
          multiple == other.multiple &&
          options == other.options;
  @override
  int get hashCode =>
      expiresAt.hashCode ^
      hideTotals.hashCode ^
      multiple.hashCode ^
      options.hashCode;
}
