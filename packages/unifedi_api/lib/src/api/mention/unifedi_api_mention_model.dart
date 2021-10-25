import '../unifedi_api_model.dart';

abstract class IUnifediApiMention implements IUnifediApiResponse {
  String get acct;

  String get id;

  String get url;

  String? get username;
}
