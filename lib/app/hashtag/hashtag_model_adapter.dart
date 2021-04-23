import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/pleroma/api/tag/history/pleroma_tag_history_model.dart';
import 'package:fedi/pleroma/api/tag/pleroma_tag_model.dart';

extension IPleromaTagExtension on IPleromaTag {
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
  PleromaTag toPleromaTag() {
    if (this is PleromaTag) {
      return this as PleromaTag;
    } else {
      return PleromaTag(
        name: name,
        url: url,
        history: history?.toPleromaTagHistories(),
      );
    }
  }
}
