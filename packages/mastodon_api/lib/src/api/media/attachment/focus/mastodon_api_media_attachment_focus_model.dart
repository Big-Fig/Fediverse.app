import '../../../mastodon_api_model.dart';

abstract class IMastodonApiMediaAttachmentFocus
    implements IMastodonApiResponsePart {
  double get x;

  double get y;
}
