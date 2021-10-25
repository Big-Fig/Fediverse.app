import 'package:mastodon_api/mastodon_api.dart';

import '../account/pleroma_api_account_model.dart';
import '../pleroma_api_model.dart';
import '../status/pleroma_api_status_model.dart';

abstract class IPleromaApiConversation
    implements IMastodonApiConversation, IPleromaApiResponse {
  @override
  IPleromaApiStatus? get lastStatus;

  @override
  List<IPleromaApiAccount> get accounts;

  IPleromaApiConversationPleromaPart? get pleroma;
}

abstract class IPleromaApiConversationPleromaPart {
  List<IPleromaApiAccount>? get recipients;
}
