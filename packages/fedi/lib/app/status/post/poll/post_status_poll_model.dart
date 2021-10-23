import 'package:fedi/duration/duration_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'post_status_poll_model.g.dart';

part 'post_status_poll_model.freezed.dart';

abstract class IPostStatusPoll {
  Duration? get durationLength;

  bool get hideTotals;

  bool get multiple;

  List<String> get options;
}

@freezed
class PostStatusPoll with _$PostStatusPoll implements IPostStatusPoll {
  const factory PostStatusPoll({
    @JsonKey(name: 'duration_length') required Duration? durationLength,
    @JsonKey(name: 'hide_totals') required bool hideTotals,
    required bool multiple,
    required List<String> options,
  }) = _PostStatusPoll;

  factory PostStatusPoll.fromJson(Map<String, dynamic> json) =>
      _$PostStatusPollFromJson(json);
}

extension IPostStatusPollExtension on IPostStatusPoll {
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

  UnifediApiPoll toUnifediApiPoll() => UnifediApiPoll(
        id: null,
        expired: false,
        voted: true,
        multiple: multiple,
        options: options
            .map(
              (option) => UnifediApiPollOption(
                title: option,
                votesCount: null,
              ),
            )
            .toList(),
        ownVotes: [],
        votersCount: 0,
        votesCount: 0,
        expiresAt:
            durationLength != null ? DateTime.now().add(durationLength!) : null,
      );
}

extension PostStatusPollExtension on IUnifediApiPostStatusPoll {
  PostStatusPoll toPostStatusPoll() => PostStatusPoll(
        durationLength: expiresInSeconds.toDuration(),
        hideTotals: hideTotals,
        multiple: multiple,
        options: options,
      );
}

extension IUnifediApiPollExtension on IUnifediApiPoll {
  UnifediApiPoll toUnifediApiPoll({bool forceNewObject = false}) {
    if (this is UnifediApiPoll && !forceNewObject) {
      return this as UnifediApiPoll;
    } else {
      return UnifediApiPoll(
        expired: expired,
        expiresAt: expiresAt,
        id: id,
        multiple: multiple,
        options: options.toUnifediApiPollOptionList(),
        ownVotes: ownVotes,
        voted: voted,
        votesCount: votesCount,
        votersCount: votersCount,
      );
    }
  }

  PostStatusPoll toPostStatusPoll({
    required IUnifediApiInstancePollLimits? limits,
  }) {
    Duration? durationLength;
    var expiresAt = this.expiresAt;
    if (expiresAt != null) {
      durationLength = DateTime.now().difference(expiresAt).abs();
      var minExpirationDuration = limits?.minExpirationDuration;
      if (minExpirationDuration != null) {
        if (minExpirationDuration > durationLength) {
          durationLength = minExpirationDuration;
        }
      }
    }

    return PostStatusPoll(
      durationLength: durationLength,
      // todo: implement  hideTotals
      hideTotals: false,
      multiple: multiple,
      options: options.toUnifediApiPollOptionTitles(),
    );
  }
}

extension IPostStatusPollUnifediApiPostStatusPollExtension on IPostStatusPoll {
  UnifediApiPostStatusPoll toUnifediApiPostStatusPoll() =>
      UnifediApiPostStatusPoll(
        options: options,
        multiple: multiple,
        expiresInSeconds: durationLength!.totalSeconds,
        hideTotals: hideTotals,
      );
}
