import 'package:mastodon_api/mastodon_api.dart';

import '../../pleroma_api_model.dart';
import '../../visibility/pleroma_api_visibility_sealed.dart';
import 'poll/pleroma_api_post_status_poll_model.dart';

abstract class IPleromaApiBasePostStatus
    implements IMastodonApiBasePostStatus, IPleromaApiObject {
  /// Will reply to a given conversation,
  /// addressing only the people who are part of the recipient
  /// set of that conversation. Sets the visibility to direct.
  String? get inReplyToConversationId;

  @override
  IPleromaApiPostStatusPoll? get poll;

  /// A list of nicknames (like lain@soykaf.club or lain on the local server)
  /// that will be used to determine who is going to be addressed by this post.
  /// Using this will disable the implicit addressing by
  /// mentioned names in the status body, only the people in
  /// the to list will be addressed. The normal rules for for
  /// post visibility are not affected by this and will still apply.
  List<String>? get to;

  /// if set to true the post wont be actually posted, but the status
  /// entity would still be rendered back.
  /// This could be useful for previewing rich text/custom emoji, for example.
  bool? get preview;

  /// string, contain the MIME type of the status,
  /// it is transformed into HTML by the backend.
  /// You can get the list of the supported MIME types
  /// with the nodeinfo endpoint.
  String? get contentType;

  /// The number of seconds the posted activity should expire in. When a
  /// posted activity expires it will be deleted from the server,
  /// and a delete request for it will be federated.
  /// This needs to be longer than an hour.
  int? get expiresInSeconds;
}

extension IPleromaApiPostStatusBaseVisibility on IPleromaApiBasePostStatus {
  PleromaApiVisibility get visibilityAsPleromaApi =>
      visibility.toPleromaApiVisibility();
}

abstract class IPleromaApiPostStatus
    implements IPleromaApiBasePostStatus, IMastodonApiPostStatus {}
