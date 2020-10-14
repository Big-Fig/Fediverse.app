import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/pleroma/tag/pleroma_tag_model.dart';

IHashtag mapRemoteHashtagToLocalHashtag(IPleromaTag pleromaTag) => Hashtag(
      name: pleromaTag.name,
      url: pleromaTag.url,
      history: pleromaTag.history,
    );
