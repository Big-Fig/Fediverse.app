import 'package:mastodon_api/mastodon_api.dart';
import '../../../account/my/pleroma_api_my_account_model.dart';

import '../../scopes/pleroma_api_access_scopes_model.dart';
import '../pleroma_api_access_token_model.dart';

abstract class IPleromaApiAccessUserToken
    implements IMastodonApiAccessUserToken, IPleromaApiAccessToken {
  @override
  IPleromaApiAccessScopes get scopes;

  @override
  IPleromaApiMyAccount? get myAccount;
}
