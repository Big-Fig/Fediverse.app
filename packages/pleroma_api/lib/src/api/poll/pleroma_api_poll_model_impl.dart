import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import './option/pleroma_api_poll_option_model_impl.dart';
import 'pleroma_api_poll_model.dart';

part 'pleroma_api_poll_model_impl.freezed.dart';

part 'pleroma_api_poll_model_impl.g.dart';

// ignore_for_file: no-magic-number

@HiveType(typeId: 0)
@freezed
class PleromaApiPoll with _$PleromaApiPoll implements IPleromaApiPoll {
  const factory PleromaApiPoll({
    @HiveField(0) required bool expired,
    @HiveField(1) @JsonKey(name: 'expires_at') required DateTime? expiresAt,
    @HiveField(2) required String? id,
    @HiveField(3) required bool multiple,
    @HiveField(4) required List<PleromaApiPollOption> options,
    @HiveField(5) @JsonKey(name: 'own_votes') required List<int>? ownVotes,
    @HiveField(6) required bool? voted,
    @HiveField(7) @JsonKey(name: 'voters_count') required int? votersCount,
    @HiveField(8) @JsonKey(name: 'votes_count') required int? votesCount,
  }) = _PleromaApiPoll;

  factory PleromaApiPoll.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiPollFromJson(json);
}

extension IPleromaApiPollInterfaceExtension on IPleromaApiPoll {
  PleromaApiPoll toPleromaApiPoll({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiPoll(
          expired: expired,
          expiresAt: expiresAt,
          id: id,
          multiple: multiple,
          options: options.toPleromaApiPollOptionList(
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
