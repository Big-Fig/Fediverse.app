import '../fediverse_api_access_token_model.dart';

abstract class IFediverseApiAccessUserToken extends IFediverseApiAccessToken {
  String get user;
}
