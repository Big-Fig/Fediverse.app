import 'package:fedi/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:fedi/pleroma/api/featured_tags/pleroma_api_featured_tags_model.dart';

extension IPleromaFeaturedTagExtension on IPleromaApiFeaturedTag {
  AccountFeaturedHashtag toAccountFeaturedHashtag() {
    if (this is AccountFeaturedHashtag) {
      return this as AccountFeaturedHashtag;
    } else {
      return AccountFeaturedHashtag(
        name: name,
        remoteId: id,
        statusesCount: statusesCount,
        lastStatusAt: lastStatusAt,
      );
    }
  }
}

extension IAccountFeaturedHashtagExtension on IAccountFeaturedHashtag {
  PleromaApiFeaturedTag toPleromaFeaturedTag() {
    if (this is PleromaApiFeaturedTag) {
      return this as PleromaApiFeaturedTag;
    } else {
      return PleromaApiFeaturedTag(
        name: name,
        id: remoteId,
        statusesCount: statusesCount,
        lastStatusAt: lastStatusAt,
      );
    }
  }
}
