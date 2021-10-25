import '../unifedi_api_model.dart';

abstract class IUnifediApiOAuthToken implements IUnifediApiResponse {
  String get accessToken;

  String get tokenType;
  String? get id;
  String? get me;
}
