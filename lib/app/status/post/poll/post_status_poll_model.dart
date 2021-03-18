import 'dart:convert';

import 'package:fedi/duration/duration_extension.dart';
import 'package:fedi/pleroma/poll/pleroma_poll_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
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
  final bool hideTotals;

  @override
  final bool multiple;

  @override
  final List<String> options;

  PostStatusPoll({
    required this.durationLength,
    required this.hideTotals,
    required this.multiple,
    required this.options,
  });

  @override
  String toString() {
    return 'PostStatusPoll{'
        'durationLength: $durationLength, '
        'hideTotals: $hideTotals, '
        'multiple: $multiple, '
        'options: $options'
        '}';
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

extension IPostStatusPollExtension on IPostStatusPoll {
  PleromaPostStatusPoll toPleromaPostStatusPoll() => PleromaPostStatusPoll(
        options: options,
        multiple: multiple,
        expiresInSeconds: durationLength.totalSeconds,
        hideTotals: hideTotals,
      );

  PostStatusPoll toPostStatusPoll() {
    if (this is PostStatusPoll) {
      return this as PostStatusPoll;
    } else {
      return PostStatusPoll(
        options: options,
        multiple: multiple,
        durationLength: durationLength,
        hideTotals: hideTotals,
      );
    }
  }

  PleromaPoll toPleromaPoll() {
    return PleromaPoll(
      id: null,
      expired: false,
      voted: true,
      multiple: multiple,
      options: options.toPleromaPollOptions(),
      ownVotes: [],
      votersCount: 0,
      votesCount: 0,
      expiresAt: DateTime.now().add(durationLength),
    );
  }
}

extension PleromaPostStatusPollExtension on IPleromaPostStatusPoll {
  PostStatusPoll toPostStatusPoll() {
    return PostStatusPoll(
      durationLength: expiresInSeconds.toDuration(),
      hideTotals: hideTotals,
      multiple: multiple,
      options: options,
    );
  }
}
