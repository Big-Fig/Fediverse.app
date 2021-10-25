import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_instance_poll_limits_model.dart';

// ignore_for_file: no-magic-number

part 'pleroma_api_instance_poll_limits_model_impl.freezed.dart';
part 'pleroma_api_instance_poll_limits_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiInstancePollLimits
    with _$PleromaApiInstancePollLimits
    implements IPleromaApiInstancePollLimits {
  static final PleromaApiInstancePollLimits defaultLimits =
      PleromaApiInstancePollLimits(
    maxExpiration:
        IPleromaApiInstancePollLimits.defaultMaxPollExpiration.inMilliseconds ~/
            Duration.millisecondsPerSecond,
    minExpiration:
        IPleromaApiInstancePollLimits.defaultMinPollExpiration.inMilliseconds ~/
            Duration.millisecondsPerSecond,
    maxOptionChars: IPleromaApiInstancePollLimits.defaultMaxOptionChars,
    maxOptions: IPleromaApiInstancePollLimits.defaultMaxPollOptions,
  );

  const factory PleromaApiInstancePollLimits({
    @HiveField(0) @JsonKey(name: 'max_expiration') required int? maxExpiration,
    @HiveField(1)
    @JsonKey(name: 'max_option_chars')
        required int? maxOptionChars,
    @HiveField(2) @JsonKey(name: 'max_options') required int? maxOptions,
    @HiveField(3) @JsonKey(name: 'min_expiration') required int? minExpiration,
  }) = _PleromaApiInstancePollLimits;

  factory PleromaApiInstancePollLimits.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiInstancePollLimitsFromJson(json);
}

extension PleromaApiInstancePollLimitsInterfaceExtension
    on IPleromaApiInstancePollLimits {
  PleromaApiInstancePollLimits toPleromaApiInstancePollLimits({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiInstancePollLimits(
          maxExpiration: maxExpiration,
          maxOptionChars: maxOptionChars,
          maxOptions: maxOptions,
          minExpiration: minExpiration,
        ),
        forceNewObject: forceNewObject,
      );
}
