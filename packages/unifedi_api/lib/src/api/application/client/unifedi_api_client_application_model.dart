import '../../unifedi_api_model.dart';
import '../unifedi_api_application_model.dart';

abstract class IUnifediApiClientApplication
    implements IUnifediApiApplication, IUnifediApiResponse {
  String? get clientId;

  String? get clientSecret;
}
