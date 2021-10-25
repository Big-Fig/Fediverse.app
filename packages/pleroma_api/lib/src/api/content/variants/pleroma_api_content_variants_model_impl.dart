import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'pleroma_api_content_variants_model.dart';

part 'pleroma_api_content_variants_model_impl.freezed.dart';
part 'pleroma_api_content_variants_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiContentVariants
    with _$PleromaApiContentVariants
    implements IPleromaApiContentVariants {
  const factory PleromaApiContentVariants({
    @HiveField(0) @JsonKey(name: 'text/plain') required String? textPlain,
  }) = _PleromaApiContentVariants;

  factory PleromaApiContentVariants.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiContentVariantsFromJson(json);
}

extension IPleromaApiContentVariantsInterfaceExtension
    on IPleromaApiContentVariants {
  PleromaApiContentVariants toPleromaApiContentVariants({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiContentVariants(
          textPlain: textPlain,
        ),
        forceNewObject: forceNewObject,
      );
}
