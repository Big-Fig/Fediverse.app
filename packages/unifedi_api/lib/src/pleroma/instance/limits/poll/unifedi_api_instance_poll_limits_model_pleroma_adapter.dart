import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/instance/limits/poll/unifedi_api_instance_poll_limits_model.dart';

part 'unifedi_api_instance_poll_limits_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_instance_poll_limits_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiInstancePollLimitsPleromaAdapter
    with _$UnifediApiInstancePollLimitsPleromaAdapter
    implements IUnifediApiInstancePollLimits {
  const UnifediApiInstancePollLimitsPleromaAdapter._();

  const factory UnifediApiInstancePollLimitsPleromaAdapter(
    @HiveField(0) PleromaApiInstancePollLimits value,
  ) = _UnifediApiInstancePollLimitsPleromaAdapter;

  @override
  int? get maxExpiration => value.maxExpiration;

  @override
  int? get maxOptionChars => value.maxOptionChars;

  @override
  int? get maxOptions => value.maxOptions;

  @override
  int? get minExpiration => value.minExpiration;

  factory UnifediApiInstancePollLimitsPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstancePollLimitsPleromaAdapterFromJson(json);
}

extension PleromaApiInstancePollLimitsUnifediExtension
    on IPleromaApiInstancePollLimits {
  UnifediApiInstancePollLimitsPleromaAdapter
      toUnifediApiInstancePollLimitsPleromaAdapter() =>
          UnifediApiInstancePollLimitsPleromaAdapter(
            toPleromaApiInstancePollLimits(),
          );
}

extension PleromaApiInstancePollLimitsUnifediListExtension
    on List<IPleromaApiInstancePollLimits> {
  List<UnifediApiInstancePollLimitsPleromaAdapter>
      toUnifediApiInstancePollLimitsPleromaAdapterList() => map(
            (item) => item.toUnifediApiInstancePollLimitsPleromaAdapter(),
          ).toList();
}

extension UnifediApiInstancePollLimitsPleromaExtension
    on IUnifediApiInstancePollLimits {
  PleromaApiInstancePollLimits toPleromaApiInstancePollLimits() =>
      PleromaApiInstancePollLimits(
        maxExpiration: maxExpiration,
        maxOptionChars: maxOptionChars,
        maxOptions: maxOptions,
        minExpiration: minExpiration,
      );
}
