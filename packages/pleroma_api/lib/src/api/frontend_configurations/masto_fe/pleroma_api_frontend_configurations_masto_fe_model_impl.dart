import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_frontend_configurations_masto_fe_model.dart';

part 'pleroma_api_frontend_configurations_masto_fe_model_impl.freezed.dart';

part 'pleroma_api_frontend_configurations_masto_fe_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiFrontendConfigurationsMastoFe
    with _$PleromaApiFrontendConfigurationsMastoFe
    implements IPleromaApiFrontendConfigurationsMastoFe {
  const factory PleromaApiFrontendConfigurationsMastoFe({
    @JsonKey(name: 'show_instance_specific_panel')
    @HiveField(0)
        required bool? showInstanceSpecificPanel,
  }) = _PleromaApiFrontendConfigurationsMastoFe;

  factory PleromaApiFrontendConfigurationsMastoFe.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiFrontendConfigurationsMastoFeFromJson(json);
}

extension PleromaApiFrontendConfigurationsMastoFeInterfaceExtension
    on IPleromaApiFrontendConfigurationsMastoFe {
  PleromaApiFrontendConfigurationsMastoFe
      toPleromaApiFrontendConfigurationsMastoFe({
    bool forceNewObject = false,
  }) =>
          InterfaceToImplHelper.interfaceToImpl(
            this,
            (_) => PleromaApiFrontendConfigurationsMastoFe(
              showInstanceSpecificPanel: showInstanceSpecificPanel,
            ),
            forceNewObject: forceNewObject,
          );
}
