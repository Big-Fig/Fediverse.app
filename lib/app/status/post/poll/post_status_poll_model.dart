import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_status_poll_model.g.dart';

abstract class IPostStatusPoll {
  DateTime get expiresAt;

  bool get hideTotals;

  bool get multiple;

  List<String> get options;
}

@JsonSerializable()
class PostStatusPoll implements IPostStatusPoll {
  @override
  @JsonKey(name: "expires_at")
  final DateTime expiresAt;

  @override
  @JsonKey(name: "hide_totals")
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


  factory PostStatusPoll.fromJson(Map<String, dynamic> json) =>
      _$PostStatusPollFromJson(json);

  factory PostStatusPoll.fromJsonString(String jsonString) =>
      _$PostStatusPollFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PostStatusPollToJson(this);

  String toJsonString() => jsonEncode(_$PostStatusPollToJson(this));
}
