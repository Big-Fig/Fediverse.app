import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../pleroma_api_frontend_configurations_model.dart';

part 'pleroma_api_frontend_configurations_soapbox_fe_model_impl.freezed.dart';

part 'pleroma_api_frontend_configurations_soapbox_fe_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiFrontendConfigurationsSoapboxFe
    with _$PleromaApiFrontendConfigurationsSoapboxFe
    implements IPleromaApiFrontendConfigurationsSoapboxFe {
  const factory PleromaApiFrontendConfigurationsSoapboxFe({
    // @JsonKey(name: 'brand_color')
    @HiveField(0) required String? brandColor,
  }) = _PleromaApiFrontendConfigurationsSoapboxFe;

  factory PleromaApiFrontendConfigurationsSoapboxFe.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiFrontendConfigurationsSoapboxFeFromJson(json);
}

extension PleromaApiFrontendConfigurationsSoapboxFeInterfaceExtension
    on IPleromaApiFrontendConfigurationsSoapboxFe {
  PleromaApiFrontendConfigurationsSoapboxFe
      toPleromaApiFrontendConfigurationsSoapboxFe({
    bool forceNewObject = false,
  }) =>
          InterfaceToImplHelper.interfaceToImpl(
            this,
            (_) => PleromaApiFrontendConfigurationsSoapboxFe(
              brandColor: brandColor,
            ),
            forceNewObject: forceNewObject,
          );
}
