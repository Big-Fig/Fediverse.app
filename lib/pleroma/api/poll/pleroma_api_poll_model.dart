import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_model.dart';
import 'package:fedi/duration/duration_extension.dart';
import 'package:fedi/mastodon/api/poll/mastodon_api_poll_model.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_poll_model.g.dart';

Function eq = const ListEquality().equals;

abstract class IPleromaPoll implements IMastodonApiPoll {
  @override
  List<IPleromaPollOption> get options;
}

extension IPleromaPollExtension on IPleromaPoll {
  PleromaPoll toPleromaPoll() {
    if (this is PleromaPoll) {
      return this as PleromaPoll;
    } else {
      return PleromaPoll(
        expired: expired,
        expiresAt: expiresAt,
        id: id,
        multiple: multiple,
        options: options.toPleromaPollOptions(),
        ownVotes: ownVotes,
        voted: voted,
        votesCount: votesCount,
        votersCount: votersCount,
      );
    }
  }

  PostStatusPoll toPostStatusPoll({
    required PleromaInstancePollLimits limits,
  }) {
    return PostStatusPoll(
      durationLength: expiresAt.calculatePostDurationLength(
        limits: limits,
      ),
      // todo: implement  hideTotals
      hideTotals: false,
      multiple: multiple,
      options: options.toPleromaPollOptionTitles(),
    );
  }

  bool isOwnVote(IPleromaPollOption option) {
    var index = options.indexOf(option);

    return ownVotes.contains(index);
  }

  double votesPercent(IPleromaPollOption option) {
    // votes count can be hidden until poll ends
    var votesCount = option.votesCount;
    double votesPercent;
    if (votesCount == 0) {
      votesPercent = 0.0;
    } else {
      votesPercent = votesCount / this.votesCount;
    }
    return votesPercent;
  }
}

extension DateTimePollExtension on DateTime {
  Duration calculatePostDurationLength({
    required PleromaInstancePollLimits limits,
  }) {
    DateTime expiresAt = this;

    var now = DateTime.now();

    var minExpirationDuration = limits.minExpirationDurationOrDefault;
    var maxExpirationDuration = limits.maxExpirationDurationOrDefault;

    if (now.isAfter(expiresAt)) {
      var difference = now.difference(expiresAt);

      if (difference > minExpirationDuration &&
          difference < maxExpirationDuration) {
        return difference;
      } else if (difference < minExpirationDuration) {
        return minExpirationDuration;
      } else {
        return maxExpirationDuration;
      }
    } else {
      return minExpirationDuration;
    }
  }
}

abstract class IPleromaPollOption implements IMastodonPollOption {}

extension IPleromaPollOptionExtension on IPleromaPollOption {
  PleromaPollOption toPleromaPollOption() {
    if (this is PleromaPollOption) {
      return this as PleromaPollOption;
    } else {
      return PleromaPollOption(
        title: title,
        votesCount: votesCount,
      );
    }
  }
}

extension IPleromaPollOptionListExtension on List<IPleromaPollOption> {
  List<PleromaPollOption> toPleromaPollOptions() {
    if (this is List<PleromaPollOption>) {
      return this as List<PleromaPollOption>;
    } else {
      return map(
        (pollOption) => pollOption.toPleromaPollOption(),
      ).toList();
    }
  }

  List<String> toPleromaPollOptionTitles() {
    return map(
      (pollOption) => pollOption.title,
    ).toList();
  }
}

extension StringPleromaPollOptionExtension on String {
  PleromaPollOption toPleromaPollOption() => PleromaPollOption(
        title: this,
        votesCount: 0,
      );
}

extension StringListPleromaPollOptionExtension on List<String> {
  List<PleromaPollOption> toPleromaPollOptions() => map(
        (value) => value.toPleromaPollOption(),
      ).toList();
}

@JsonSerializable()
class PleromaPollOption implements IPleromaPollOption {
  @override
  final String title;

  @override
  @JsonKey(name: "votes_count")
  final int votesCount;

  PleromaPollOption({
    required this.title,
    required this.votesCount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaPollOption &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          votesCount == other.votesCount;

  @override
  int get hashCode => title.hashCode ^ votesCount.hashCode;

  factory PleromaPollOption.fromJson(Map<String, dynamic> json) =>
      _$PleromaPollOptionFromJson(json);

  factory PleromaPollOption.fromJsonString(String jsonString) =>
      _$PleromaPollOptionFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaPollOptionToJson(this);

  String toJsonString() => jsonEncode(_$PleromaPollOptionToJson(this));

  @override
  String toString() {
    return 'PleromaPollOption{'
        'title: $title, '
        'votesCount: $votesCount'
        '}';
  }
}

@JsonSerializable()
class PleromaPoll implements IPleromaPoll {
  @override
  final bool expired;

  @override
  @JsonKey(name: "expires_at")
  final DateTime expiresAt;

  @override
  final String? id;

  @override
  final bool multiple;

  @override
  final List<PleromaPollOption> options;

  @override
  @JsonKey(name: "own_votes")
  final List<int> ownVotes;

  @override
  final bool voted;

  @override
  @JsonKey(name: "voters_count")
  final int votersCount;

  @override
  @JsonKey(name: "votes_count")
  final int votesCount;

  PleromaPoll({
    required this.expired,
    required this.expiresAt,
    required this.id,
    required this.multiple,
    required this.options,
    required this.ownVotes,
    required this.voted,
    required this.votersCount,
    required this.votesCount,
  });

  factory PleromaPoll.fromJson(Map<String, dynamic> json) =>
      _$PleromaPollFromJson(json);

  factory PleromaPoll.fromJsonString(String jsonString) =>
      _$PleromaPollFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaPollToJson(this);

  String toJsonString() => jsonEncode(_$PleromaPollToJson(this));

  @override
  String toString() {
    return 'PleromaPoll{'
        'expired: $expired, '
        'expiresAt: $expiresAt, '
        'id: $id, '
        'multiple: $multiple, '
        'options: $options,'
        'ownVotes: $ownVotes, '
        'voted: $voted, '
        'votersCount: $votersCount, '
        'votesCount: $votesCount'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaPoll &&
          runtimeType == other.runtimeType &&
          expired == other.expired &&
          expiresAt == other.expiresAt &&
          id == other.id &&
          multiple == other.multiple &&
          eq(options, other.options) &&
          eq(ownVotes, other.ownVotes) &&
          voted == other.voted &&
          votersCount == other.votersCount &&
          votesCount == other.votesCount;

  @override
  int get hashCode =>
      expired.hashCode ^
      expiresAt.hashCode ^
      id.hashCode ^
      multiple.hashCode ^
      options.hashCode ^
      ownVotes.hashCode ^
      voted.hashCode ^
      votersCount.hashCode ^
      votesCount.hashCode;
}

extension PleromaPostStatusPollExtension on PleromaPostStatusPoll {
  PleromaPoll toPleromaPoll() {
    return PleromaPoll(
      id: null,
      expired: false,
      voted: true,
      multiple: multiple,
      options: options
          .map(
            (option) => PleromaPollOption(
              title: option,
              votesCount: 0,
            ),
          )
          .toList(),
      ownVotes: [],
      votersCount: 0,
      votesCount: 0,
      expiresAt: DateTime.now().add(
        expiresInSeconds.toDuration(),
      ),
    );
  }
}
