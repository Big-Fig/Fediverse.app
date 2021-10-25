import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'unifedi_api_content_variants_model.dart';

part 'unifedi_api_content_variants_model_impl.freezed.dart';
part 'unifedi_api_content_variants_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiContentVariants
    with _$UnifediApiContentVariants
    implements IUnifediApiContentVariants {
  const factory UnifediApiContentVariants({
    @HiveField(0) @JsonKey(name: 'text/plain') required String? textPlain,
  }) = _UnifediApiContentVariants;

  factory UnifediApiContentVariants.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiContentVariantsFromJson(json);
}

extension IUnifediApiContentVariantsInterfaceExtension
    on IUnifediApiContentVariants {
  UnifediApiContentVariants toUnifediApiContentVariants({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiContentVariants(
          textPlain: textPlain,
        ),
        forceNewObject: forceNewObject,
      );
}
