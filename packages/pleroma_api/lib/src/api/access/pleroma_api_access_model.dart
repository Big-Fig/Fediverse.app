import 'package:mastodon_api/mastodon_api.dart';

import '../instance/pleroma_api_instance_model.dart';
import 'level/pleroma_api_access_level_model.dart';
import 'token/application/pleroma_api_access_application_token_model.dart';
import 'token/user/pleroma_api_access_user_token_model.dart';

abstract class IPleromaApiAccess implements IMastodonApiAccess {
  @override
  IPleromaApiInstance? get instance;

  @override
  IPleromaApiAccessLevel get level;

  @override
  IPleromaApiAccessApplicationToken? get applicationAccessToken;

  @override
  IPleromaApiAccessUserToken? get userAccessToken;
}
