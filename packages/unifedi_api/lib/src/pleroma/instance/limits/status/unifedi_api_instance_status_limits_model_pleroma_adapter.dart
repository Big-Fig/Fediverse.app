import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../../../api/instance/limits/status/unifedi_api_instance_status_limits_model.dart';

part 'unifedi_api_instance_status_limits_model_pleroma_adapter.freezed.dart';
part 'unifedi_api_instance_status_limits_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiInstanceStatusLimitsPleromaAdapter
    with _$UnifediApiInstanceStatusLimitsPleromaAdapter
    implements IUnifediApiInstanceStatusLimits {
  const UnifediApiInstanceStatusLimitsPleromaAdapter._();
  const factory UnifediApiInstanceStatusLimitsPleromaAdapter(
    @HiveField(0) PleromaApiInstance value,
  ) = _UnifediApiInstanceStatusLimitsPleromaAdapter;
  @override
  int? get maxTootChars => value.maxTootChars;

  @override
  int? get maxMediaAttachmentsCount => IPleromaApiInstance.maxAttachedMedia;
  factory UnifediApiInstanceStatusLimitsPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceStatusLimitsPleromaAdapterFromJson(json);
}

extension PleromaApiInstanceUnifediExtension on IPleromaApiInstance {
  UnifediApiInstanceStatusLimitsPleromaAdapter
      toUnifediApiInstanceStatusLimitsPleromaAdapter() =>
          UnifediApiInstanceStatusLimitsPleromaAdapter(
            toPleromaApiInstance(),
          );
}

extension PleromaApiInstanceUnifediListExtension on List<IPleromaApiInstance> {
  List<UnifediApiInstanceStatusLimitsPleromaAdapter>
      toUnifediApiInstanceStatusLimitsPleromaAdapterList() => map(
            (item) => item.toUnifediApiInstanceStatusLimitsPleromaAdapter(),
          ).toList();
}
