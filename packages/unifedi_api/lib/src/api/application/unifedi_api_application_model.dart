import '../unifedi_api_model.dart';

abstract class IUnifediApiApplication implements IUnifediApiResponse {
  String? get name;

  String? get website;

  String? get vapidKey;
}
