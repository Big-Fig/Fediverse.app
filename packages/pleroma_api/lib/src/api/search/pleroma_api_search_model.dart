import 'package:mastodon_api/mastodon_api.dart';
import '../account/pleroma_api_account_model.dart';
import '../pleroma_api_model.dart';
import '../status/pleroma_api_status_model.dart';
import '../tag/pleroma_api_tag_model.dart';

abstract class IPleromaApiSearchResult
    implements IMastodonApiSearchResult, IPleromaApiResponse {
  @override
  List<IPleromaApiAccount> get accounts;

  @override
  List<IPleromaApiStatus> get statuses;

  @override
  List<IPleromaApiTag> get hashtags;
}
