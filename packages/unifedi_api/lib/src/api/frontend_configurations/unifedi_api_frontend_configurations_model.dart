import '../unifedi_api_model.dart';

abstract class IUnifediApiFrontendConfigurations
    implements IUnifediApiResponse {
  String? get brandHexColor;
  String? get backgroundImage;
}
