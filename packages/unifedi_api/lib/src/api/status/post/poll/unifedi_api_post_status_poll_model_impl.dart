import 'package:collection/collection.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'unifedi_api_post_status_poll_model.dart';

part 'unifedi_api_post_status_poll_model_impl.freezed.dart';
part 'unifedi_api_post_status_poll_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class UnifediApiPostStatusPoll
    with _$UnifediApiPostStatusPoll
    implements IUnifediApiPostStatusPoll {
  const factory UnifediApiPostStatusPoll({
    @HiveField(0) @JsonKey(name: 'expires_in') required int expiresInSeconds,
    @HiveField(1)
    @JsonKey(name: 'hide_totals', includeIfNull: false)
        required bool hideTotals,
    @HiveField(2) required bool multiple,
    @HiveField(3) @JsonKey(name: 'options') required List<String> options,
  }) = _UnifediApiPostStatusPoll;

  factory UnifediApiPostStatusPoll.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiPostStatusPollFromJson(json);
}

extension IUnifediApiPostStatusPollInterfaceExtension
    on IUnifediApiPostStatusPoll {
  UnifediApiPostStatusPoll toUnifediApiPostStatusPoll({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiPostStatusPoll(
          expiresInSeconds: expiresInSeconds,
          hideTotals: hideTotals,
          multiple: multiple,
          options: options,
        ),
        forceNewObject: forceNewObject,
      );
}
