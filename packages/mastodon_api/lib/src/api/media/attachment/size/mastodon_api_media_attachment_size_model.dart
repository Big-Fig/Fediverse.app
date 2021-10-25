import '../../../mastodon_api_model.dart';

abstract class IMastodonApiMediaAttachmentSize
    implements IMastodonApiResponsePart {
  int get width;

  int get height;

  String? get size;

  double? get aspect;
}
