import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

extension IUnifediTagExtension on IUnifediApiTag {
  Hashtag toHashtag() {
    if (this is Hashtag) {
      return this as Hashtag;
    } else {
      return Hashtag(
        name: name,
        url: url,
        history: history,
      );
    }
  }
}

extension IHashtagExtension on IHashtag {
  UnifediApiTag toUnifediTag() {
    if (this is UnifediApiTag) {
      return this as UnifediApiTag;
    } else {
      return UnifediApiTag(
        name: name,
        url: url,
        history: history?.toUnifediApiTagHistory(),
        statusesCount: statusesCount,
        id: null,
        lastStatusAt: null,
      );
    }
  }
}
