import 'package:fedi_app/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

extension IUnifediApiTagExtension on IUnifediApiTag {
  MyAccountFeaturedHashtag toMyAccountFeaturedHashtag() {
    if (this is MyAccountFeaturedHashtag) {
      return this as MyAccountFeaturedHashtag;
    } else {
      return MyAccountFeaturedHashtag(
        name: name,
        remoteId: id,
        statusesCount: statusesCount,
        lastStatusAt: lastStatusAt,
      );
    }
  }
}

extension IAccountFeaturedHashtagExtension on IMyAccountFeaturedHashtag {
  UnifediApiTag toUnifediApiTag() {
    if (this is UnifediApiTag) {
      return this as UnifediApiTag;
    } else {
      return UnifediApiTag(
        name: name,
        id: remoteId,
        statusesCount: statusesCount,
        lastStatusAt: lastStatusAt,
        url: null,
        history: null,
      );
    }
  }
}
