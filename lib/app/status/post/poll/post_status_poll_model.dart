import 'dart:convert';

import 'package:fedi/pleroma/poll/pleroma_poll_model.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_status_poll_model.g.dart';

abstract class IPostStatusPoll {
  Duration get durationLength;

  bool get hideTotals;

  bool get multiple;

  List<String> get options;
}

@JsonSerializable()
class PostStatusPoll implements IPostStatusPoll {
  @override
  @JsonKey(name: "duration_length")
  final Duration durationLength;

  @override
  @JsonKey(name: "hide_totals")
  bool hideTotals;

  @override
  bool multiple;

  @override
  List<String> options;

  PostStatusPoll({
    @required this.durationLength,
    @required this.hideTotals,
    @required this.multiple,
    @required this.options,
  });

  @override
  String toString() {
    return 'PostStatusPoll{durationLength: $durationLength,'
        ' hideTotals: $hideTotals, multiple: $multiple,'
        ' options: $options}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostStatusPoll &&
          runtimeType == other.runtimeType &&
          durationLength == other.durationLength &&
          hideTotals == other.hideTotals &&
          multiple == other.multiple &&
          options == other.options;

  @override
  int get hashCode =>
      durationLength.hashCode ^
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


extension PostStatusPollExtension on PostStatusPoll {
  PleromaPoll toPleromaPoll() {
    return PleromaPoll(
      id: null,
      expired: false,
      voted: true,
      multiple: multiple,
      options: options
          ?.map((option) => PleromaPollOption(
        title: option,
        votesCount: 0,
      ))
          ?.toList(),
      ownVotes: [],
      votersCount: 0,
      votesCount: 0,
      expiresAt: null,
    );
  }
}