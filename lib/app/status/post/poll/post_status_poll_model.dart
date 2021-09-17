import 'package:fedi/collection/collection_hash_utils.dart';
import 'package:fedi/duration/duration_extension.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_status_poll_model.g.dart';

abstract class IPostStatusPoll {
  Duration? get durationLength;

  bool get hideTotals;

  bool get multiple;

  List<String> get options;
}

@JsonSerializable()
class PostStatusPoll implements IPostStatusPoll {
  @override
  @JsonKey(name: 'duration_length')
  final Duration? durationLength;

  @override
  @JsonKey(name: 'hide_totals')
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
          listEquals(options, other.options);

  @override
  int get hashCode =>
      durationLength.hashCode ^
      hideTotals.hashCode ^
      multiple.hashCode ^
      listHash(options);

  static PostStatusPoll fromJson(Map<String, dynamic> json) =>
      _$PostStatusPollFromJson(json);

  Map<String, dynamic> toJson() => _$PostStatusPollToJson(this);
}

extension IPostStatusPollExtension on IPostStatusPoll {
  UnifediApiPostStatusPoll toPleromaPostStatusPoll() =>
      UnifediApiPostStatusPoll(
        options: options,
        multiple: multiple,
        expiresInSeconds: durationLength!.totalSeconds,
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

  UnifediApiPoll toUnifediApiPoll() {
    return UnifediApiPoll(
      id: null,
      expired: false,
      voted: true,
      multiple: multiple,
      options: options.toUnifediApiPollOptions(),
      ownVotes: [],
      votersCount: 0,
      votesCount: 0,
      expiresAt:
          durationLength != null ? DateTime.now().add(durationLength!) : null,
    );
  }
}

extension PleromaPostStatusPollExtension on IUnifediApiPostStatusPoll {
  PostStatusPoll toPostStatusPoll() {
    return PostStatusPoll(
      durationLength: expiresInSeconds.toDuration(),
      hideTotals: hideTotals,
      multiple: multiple,
      options: options,
    );
  }

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
        options:
            options.toUnifediApiPollOptions(forceNewObject: forceNewObject),
        ownVotes: ownVotes,
        voted: voted,
        votesCount: votesCount,
        votersCount: votersCount,
      );
    }
  }

  PostStatusPoll toPostStatusPoll({
    required UnifediApiInstancePollLimits limits,
  }) {
    return PostStatusPoll(
      durationLength: expiresAt?.calculatePostDurationLength(
        limits: limits,
      ),
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
