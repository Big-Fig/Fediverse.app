import 'package:freezed_annotation/freezed_annotation.dart';

import 'unifedi_api_type_not_supported_requirement_model.dart';

part 'unifedi_api_type_not_supported_requirement_model_impl.freezed.dart';

part 'unifedi_api_type_not_supported_requirement_model_impl.g.dart';

@freezed
class UnifediApiTypeNotSupportedRequirement
    with _$UnifediApiTypeNotSupportedRequirement
    implements IUnifediApiTypeNotSupportedRequirement {
  const factory UnifediApiTypeNotSupportedRequirement({
    required String target,
  }) = _UnifediApiTypeNotSupportedRequirement;

  factory UnifediApiTypeNotSupportedRequirement.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiTypeNotSupportedRequirementFromJson(json);
}
