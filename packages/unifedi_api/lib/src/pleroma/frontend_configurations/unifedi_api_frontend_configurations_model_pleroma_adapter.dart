import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';
import '../../api/frontend_configurations/unifedi_api_frontend_configurations_model.dart';

part 'unifedi_api_frontend_configurations_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_frontend_configurations_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiFrontendConfigurationsPleromaAdapter
    with _$UnifediApiFrontendConfigurationsPleromaAdapter
    implements IUnifediApiFrontendConfigurations {
  const UnifediApiFrontendConfigurationsPleromaAdapter._();
  const factory UnifediApiFrontendConfigurationsPleromaAdapter(
    @HiveField(0) PleromaApiFrontendConfigurations value,
  ) = _UnifediApiFrontendConfigurationsPleromaAdapter;

  @override
  String? get backgroundImage => value.pleromaFe?.background;

  @override
  String? get brandHexColor => value.soapboxFe?.brandColor;
  factory UnifediApiFrontendConfigurationsPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiFrontendConfigurationsPleromaAdapterFromJson(json);
}

extension PleromaApiFrontendConfigurationsUnifediExtension
    on IPleromaApiFrontendConfigurations {
  UnifediApiFrontendConfigurationsPleromaAdapter
      toUnifediApiFrontendConfigurationsPleromaAdapter() =>
          UnifediApiFrontendConfigurationsPleromaAdapter(
            toPleromaApiFrontendConfigurations(),
          );
}

extension PleromaApiFrontendConfigurationsUnifediListExtension
    on List<IPleromaApiFrontendConfigurations> {
  List<UnifediApiFrontendConfigurationsPleromaAdapter>
      toUnifediApiFrontendConfigurationsPleromaAdapterList() => map(
            (item) => item.toUnifediApiFrontendConfigurationsPleromaAdapter(),
          ).toList();
}
