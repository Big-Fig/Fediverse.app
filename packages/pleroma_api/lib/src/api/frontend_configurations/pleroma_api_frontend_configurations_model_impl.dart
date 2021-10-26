import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'masto_fe/pleroma_api_frontend_configurations_masto_fe_model_impl.dart';
import 'pleroma_api_frontend_configurations_model.dart';
import 'pleroma_fe/pleroma_api_frontend_configurations_pleroma_fe_model_impl.dart';
import 'soapbox_fe/pleroma_api_frontend_configurations_soapbox_fe_model_impl.dart';

part 'pleroma_api_frontend_configurations_model_impl.freezed.dart';
// ignore_for_file: no-magic-number
part 'pleroma_api_frontend_configurations_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiFrontendConfigurations
    with _$PleromaApiFrontendConfigurations
    implements IPleromaApiFrontendConfigurations {
  const factory PleromaApiFrontendConfigurations({
    @JsonKey(name: 'masto_fe')
    @HiveField(0)
        required PleromaApiFrontendConfigurationsMastoFe? mastoFe,
    @JsonKey(name: 'pleroma_fe')
    @HiveField(1)
        required PleromaApiFrontendConfigurationsPleromaFe? pleromaFe,
    @JsonKey(name: 'soapbox_fe')
    @HiveField(2)
        required PleromaApiFrontendConfigurationsSoapboxFe? soapboxFe,
  }) = _PleromaApiFrontendConfigurations;

  factory PleromaApiFrontendConfigurations.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiFrontendConfigurationsFromJson(json);
}

extension PleromaApiFrontendConfigurationsInterfaceExtension
    on IPleromaApiFrontendConfigurations {
  PleromaApiFrontendConfigurations toPleromaApiFrontendConfigurations({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiFrontendConfigurations(
          mastoFe: mastoFe?.toPleromaApiFrontendConfigurationsMastoFe(),
          pleromaFe: pleromaFe?.toPleromaApiFrontendConfigurationsPleromaFe(),
          soapboxFe: soapboxFe?.toPleromaApiFrontendConfigurationsSoapboxFe(),
        ),
        forceNewObject: forceNewObject,
      );
}
