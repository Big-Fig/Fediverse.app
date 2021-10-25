import 'package:freezed_annotation/freezed_annotation.dart';

import '../../requirement/access/level/unifedi_api_access_level_requirement_model.dart';
import '../../requirement/access/scopes/unifedi_api_access_scopes_requirement_model.dart';
import '../../requirement/instance/metadata/version/unifedi_api_instance_metadata_version_requirement_model.dart';
import '../../requirement/type/unifedi_api_type_not_supported_requirement_model.dart';
import '../../requirement/type/unifedi_api_type_not_supported_requirement_model_impl.dart';
import '../unifedi_api_feature_model.dart';

part 'unifedi_api_type_not_supported_feature_model_impl.freezed.dart';

part 'unifedi_api_type_not_supported_feature_model_impl.g.dart';

@freezed
class UnifediApiTypeNotSupportedFeature
    with _$UnifediApiTypeNotSupportedFeature
    implements IUnifediApiFeature {
  const UnifediApiTypeNotSupportedFeature._();

  const factory UnifediApiTypeNotSupportedFeature({
    required String target,
  }) = _UnifediApiTypeNotSupportedFeature;

  factory UnifediApiTypeNotSupportedFeature.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiTypeNotSupportedFeatureFromJson(json);

  @override
  String get target;

  @override
  IUnifediApiAccessLevelRequirement? get accessLevelRequirement => null;

  @override
  IUnifediApiAccessScopesRequirement? get accessScopesRequirement => null;

  @override
  IUnifediApiTypeNotSupportedRequirement get apiTypeNotSupportedRequirement =>
      UnifediApiTypeNotSupportedRequirement(target: target);

  @override
  IUnifediApiInstanceMetadataVersionRequirement?
      get instanceVersionRequirement => null;

  static void assertArgNotSupported({
    required dynamic argValue,
    required UnifediApiTypeNotSupportedFeature feature,
  }) {
    if (argValue != null) {
      throw ArgumentError.value(
        argValue,
        'Value should be null, because this arg not supported '
        'on current instance type. '
        '${feature.apiTypeNotSupportedRequirement.check(null)}',
      );
    }
  }

  static Error createMethodNotSupportedException({
    required UnifediApiTypeNotSupportedFeature feature,
  }) {
    throw ArgumentError.value(
      'Method not supported '
      'on current instance type. '
      '${feature.apiTypeNotSupportedRequirement.check(null)}',
    );
  }
}
