import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_frontend_configurations_model.dart';

part 'unifedi_api_frontend_configurations_model_impl.freezed.dart';

// ignore_for_file: no-magic-number
part 'unifedi_api_frontend_configurations_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiFrontendConfigurations
    with _$UnifediApiFrontendConfigurations
    implements IUnifediApiFrontendConfigurations {
  const factory UnifediApiFrontendConfigurations({
    @JsonKey(name: 'brand_hex_color')
    @HiveField(0)
        required String? brandHexColor,
    @JsonKey(name: 'background_image')
    @HiveField(1)
        required String? backgroundImage,
  }) = _UnifediApiFrontendConfigurations;

  factory UnifediApiFrontendConfigurations.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiFrontendConfigurationsFromJson(json);
}
