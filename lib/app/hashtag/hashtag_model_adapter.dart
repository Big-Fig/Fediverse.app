import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/pleroma/tag/pleroma_tag_model.dart';

IHashtag mapRemoteHashtagToLocalHashtag(IPleromaTag pleromaTag) => Hashtag(
      name: pleromaTag.name,
      url: pleromaTag.url,
      history: pleromaTag.history,
    );

PleromaTag mapLocalHashtagToRemoteHashtag(IHashtag hashtag) => PleromaTag(
      name: hashtag.name,
      url: hashtag.url,
      history: hashtag.history,
    );
