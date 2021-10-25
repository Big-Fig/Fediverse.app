import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_instance_poll_limits_model.dart';

// ignore_for_file: no-magic-number

part 'unifedi_api_instance_poll_limits_model_impl.freezed.dart';

part 'unifedi_api_instance_poll_limits_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiInstancePollLimits
    with _$UnifediApiInstancePollLimits
    implements IUnifediApiInstancePollLimits {
  const factory UnifediApiInstancePollLimits({
    @HiveField(0) @JsonKey(name: 'max_expiration') required int? maxExpiration,
    @HiveField(1)
    @JsonKey(name: 'max_option_chars')
        required int? maxOptionChars,
    @HiveField(2) @JsonKey(name: 'max_options') required int? maxOptions,
    @HiveField(3) @JsonKey(name: 'min_expiration') required int? minExpiration,
  }) = _UnifediApiInstancePollLimits;

  factory UnifediApiInstancePollLimits.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstancePollLimitsFromJson(json);
}

extension UnifediApiInstancePollLimitsInterfaceExtension
    on IUnifediApiInstancePollLimits {
  Duration? get maxExpirationDuration {
    var maxExpiration = this.maxExpiration;

    return maxExpiration != null ? Duration(seconds: maxExpiration) : null;
  }

  Duration? get minExpirationDuration {
    var minExpiration = this.minExpiration;

    return minExpiration != null ? Duration(seconds: minExpiration) : null;
  }

  UnifediApiInstancePollLimits toUnifediApiInstancePollLimits({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiInstancePollLimits(
          maxExpiration: maxExpiration,
          maxOptionChars: maxOptionChars,
          maxOptions: maxOptions,
          minExpiration: minExpiration,
        ),
        forceNewObject: forceNewObject,
      );
}
