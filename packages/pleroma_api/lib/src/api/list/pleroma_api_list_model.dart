import 'package:mastodon_api/mastodon_api.dart';

import '../pleroma_api_model.dart';
import 'replies_policy_type/pleroma_api_card_replies_policy_type_sealed.dart';

abstract class IPleromaApiList
    implements IMastodonApiList, IPleromaApiResponse {}

extension IPleromaApiListTypExtension on IPleromaApiList {
  PleromaApiListRepliesPolicyType? get repliesPolicyAsPleromaApi =>
      repliesPolicy?.toPleromaApiListRepliesPolicyType();
}
