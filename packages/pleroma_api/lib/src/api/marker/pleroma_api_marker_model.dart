import 'package:mastodon_api/mastodon_api.dart';
import '../pleroma_api_model.dart';

abstract class IPleromaApiMarker
    implements IMastodonApiMarker, IPleromaApiResponse {
  IPleromaApiMarkerPleromaPart? get pleroma;
}

abstract class IPleromaApiMarkerPleromaPart implements IPleromaApiResponsePart {
  int? get unreadCount;
}
