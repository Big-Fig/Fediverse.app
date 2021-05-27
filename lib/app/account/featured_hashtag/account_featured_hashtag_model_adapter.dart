import 'package:fedi/app/account/featured_hashtag/account_featured_hashtag_model.dart';
import 'package:fedi/pleroma/api/featured_tags/pleroma_api_featured_tags_model.dart';

extension IPleromaFeaturedTagExtension on IPleromaFeaturedTag {
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
  PleromaFeaturedTag toPleromaFeaturedTag() {
    if (this is PleromaFeaturedTag) {
      return this as PleromaFeaturedTag;
    } else {
      return PleromaFeaturedTag(
        name: name,
        id: remoteId,
        statusesCount: statusesCount,
        lastStatusAt: lastStatusAt,
      );
    }
  }
}
