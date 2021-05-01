import 'package:fedi/app/status/post/poll/post_status_poll_model.dart';
import 'package:fedi/collection/collection_hash_utils.dart';
import 'package:fedi/duration/duration_extension.dart';
import 'package:fedi/json/json_model.dart';
import 'package:fedi/mastodon/api/poll/mastodon_api_poll_model.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_poll_model.g.dart';

abstract class IPleromaApiPoll implements IMastodonApiPoll {
  @override
  List<IPleromaApiPollOption> get options;
}

extension IPleromaApiPollExtension on IPleromaApiPoll {
  PleromaApiPoll toPleromaApiPoll({bool forceNewObject = false}) {
    if (this is PleromaApiPoll && !forceNewObject) {
      return this as PleromaApiPoll;
    } else {
      return PleromaApiPoll(
        expired: expired,
        expiresAt: expiresAt,
        id: id,
        multiple: multiple,
        options:
            options.toPleromaApiPollOptions(forceNewObject: forceNewObject),
        ownVotes: ownVotes,
        voted: voted,
        votesCount: votesCount,
        votersCount: votersCount,
      );
    }
  }

  PostStatusPoll toPostStatusPoll({
    required PleromaApiInstancePollLimits limits,
  }) {
    return PostStatusPoll(
      durationLength: expiresAt.calculatePostDurationLength(
        limits: limits,
      ),
      // todo: implement  hideTotals
      hideTotals: false,
      multiple: multiple,
      options: options.toPleromaApiPollOptionTitles(),
    );
  }

  bool isOwnVote(IPleromaApiPollOption option) {
    var index = options.indexOf(option);

    return ownVotes.contains(index);
  }

  double votesPercent(IPleromaApiPollOption option) {
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
    required PleromaApiInstancePollLimits limits,
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

abstract class IPleromaApiPollOption implements IMastodonPollOption {}

extension IPleromaApiPollOptionExtension on IPleromaApiPollOption {
  PleromaApiPollOption toPleromaApiPollOption({bool forceNewObject = false}) {
    if (this is PleromaApiPollOption && !forceNewObject) {
      return this as PleromaApiPollOption;
    } else {
      return PleromaApiPollOption(
        title: title,
        votesCount: votesCount,
      );
    }
  }
}

extension IPleromaApiPollOptionListExtension on List<IPleromaApiPollOption> {
  List<PleromaApiPollOption> toPleromaApiPollOptions(
      {bool forceNewObject = false}) {
    if (this is List<PleromaApiPollOption> && !forceNewObject) {
      return this as List<PleromaApiPollOption>;
    } else {
      return map(
        (pollOption) => pollOption.toPleromaApiPollOption(
          forceNewObject: forceNewObject,
        ),
      ).toList();
    }
  }

  List<String> toPleromaApiPollOptionTitles() {
    return map(
      (pollOption) => pollOption.title,
    ).toList();
  }
}

extension StringPleromaApiPollOptionExtension on String {
  PleromaApiPollOption toPleromaApiPollOption() => PleromaApiPollOption(
        title: this,
        votesCount: 0,
      );
}

extension StringListPleromaApiPollOptionExtension on List<String> {
  List<PleromaApiPollOption> toPleromaApiPollOptions() => map(
        (value) => value.toPleromaApiPollOption(),
      ).toList();
}

@JsonSerializable()
class PleromaApiPollOption implements IPleromaApiPollOption {
  @override
  final String title;

  @override
  @JsonKey(name: "votes_count")
  final int votesCount;

  PleromaApiPollOption({
    required this.title,
    required this.votesCount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiPollOption &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          votesCount == other.votesCount;

  @override
  int get hashCode => title.hashCode ^ votesCount.hashCode;

  static PleromaApiPollOption fromJson(Map<String, dynamic> json) =>
      _$PleromaApiPollOptionFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaApiPollOptionToJson(this);

  @override
  String toString() {
    return 'PleromaApiPollOption{'
        'title: $title, '
        'votesCount: $votesCount'
        '}';
  }
}

@JsonSerializable(explicitToJson: true)
class PleromaApiPoll implements IPleromaApiPoll, IJsonObject {
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
  final List<PleromaApiPollOption> options;

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

  PleromaApiPoll({
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

  static PleromaApiPoll fromJson(Map<String, dynamic> json) =>
      _$PleromaApiPollFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiPollToJson(this);

  @override
  String toString() {
    return 'PleromaApiPoll{'
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
      other is PleromaApiPoll &&
          runtimeType == other.runtimeType &&
          expired == other.expired &&
          expiresAt == other.expiresAt &&
          id == other.id &&
          multiple == other.multiple &&
          listEquals(options, other.options) &&
          listEquals(ownVotes, other.ownVotes) &&
          voted == other.voted &&
          votersCount == other.votersCount &&
          votesCount == other.votesCount;

  @override
  int get hashCode =>
      expired.hashCode ^
      expiresAt.hashCode ^
      id.hashCode ^
      multiple.hashCode ^
      listHash(options) ^
      listHash(ownVotes) ^
      voted.hashCode ^
      votersCount.hashCode ^
      votesCount.hashCode;
}

extension PleromaPostStatusPollExtension on PleromaApiPostStatusPoll {
  PleromaApiPoll toPleromaApiPoll() {
    return PleromaApiPoll(
      id: null,
      expired: false,
      voted: true,
      multiple: multiple,
      options: options
          .map(
            (option) => PleromaApiPollOption(
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
