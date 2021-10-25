import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import './option/unifedi_api_poll_option_model_impl.dart';
import 'unifedi_api_poll_model.dart';

part 'unifedi_api_poll_model_impl.freezed.dart';

part 'unifedi_api_poll_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class UnifediApiPoll with _$UnifediApiPoll implements IUnifediApiPoll {
  const factory UnifediApiPoll({
    @HiveField(0) required bool expired,
    @HiveField(1) @JsonKey(name: 'expires_at') required DateTime? expiresAt,
    @HiveField(2) required String? id,
    @HiveField(3) required bool multiple,
    @HiveField(4) required List<UnifediApiPollOption> options,
    @HiveField(5) @JsonKey(name: 'own_votes') required List<int>? ownVotes,
    @HiveField(6) required bool? voted,
    @HiveField(7) @JsonKey(name: 'voters_count') required int? votersCount,
    @HiveField(8) @JsonKey(name: 'votes_count') required int? votesCount,
  }) = _UnifediApiPoll;

  factory UnifediApiPoll.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiPollFromJson(json);
}

extension IUnifediApiPollInterfaceExtension on IUnifediApiPoll {
  UnifediApiPoll toUnifediApiPoll({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiPoll(
          expired: expired,
          expiresAt: expiresAt,
          id: id,
          multiple: multiple,
          options: options.toUnifediApiPollOptionList(
            forceNewObject: forceNewObject,
          ),
          ownVotes: ownVotes,
          voted: voted,
          votesCount: votesCount,
          votersCount: votersCount,
        ),
        forceNewObject: forceNewObject,
      );
}
