import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

extension IPleromaTagExtension on IPleromaApiTag {
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
  PleromaApiTag toPleromaTag() {
    if (this is PleromaApiTag) {
      return this as PleromaApiTag;
    } else {
      return PleromaApiTag(
        name: name,
        url: url,
        history: history?.toPleromaApiTagHistories(),
      );
    }
  }
}
