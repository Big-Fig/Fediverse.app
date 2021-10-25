import '../scopes/fediverse_api_access_scopes_model.dart';

abstract class IFediverseApiAccessToken {
  String get accessToken;
  IFediverseApiAccessScopes get scopes;
}
