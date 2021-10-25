import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../../../api/instance/limits/media/unifedi_api_instance_media_limits_model.dart';

part 'unifedi_api_instance_media_limits_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_instance_media_limits_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiInstanceMediaLimitsPleromaAdapter
    with _$UnifediApiInstanceMediaLimitsPleromaAdapter
    implements IUnifediApiInstanceMediaLimits {
  const UnifediApiInstanceMediaLimitsPleromaAdapter._();
  const factory UnifediApiInstanceMediaLimitsPleromaAdapter(
    @HiveField(0) PleromaApiInstance value,
  ) = _UnifediApiInstanceMediaLimitsPleromaAdapter;

  @override
  int? get avatarUploadLimit => value.avatarUploadLimit;

  @override
  int? get backgroundUploadLimit => value.backgroundUploadLimit;

  @override
  int? get bannerUploadLimit => value.bannerUploadLimit;

  @override
  int? get descriptionLimit => value.descriptionLimit;

  @override
  int? get uploadLimit => value.uploadLimit;
  factory UnifediApiInstanceMediaLimitsPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceMediaLimitsPleromaAdapterFromJson(json);
}

extension PleromaApiInstanceUnifediExtension on IPleromaApiInstance {
  UnifediApiInstanceMediaLimitsPleromaAdapter
      toUnifediApiInstanceMediaLimitsPleromaAdapter() =>
          UnifediApiInstanceMediaLimitsPleromaAdapter(
            toPleromaApiInstance(),
          );
}

extension PleromaApiInstanceUnifediListExtension on List<IPleromaApiInstance> {
  List<UnifediApiInstanceMediaLimitsPleromaAdapter>
      toUnifediApiInstanceMediaLimitsPleromaAdapterList() => map(
            (item) => item.toUnifediApiInstanceMediaLimitsPleromaAdapter(),
          ).toList();
}
