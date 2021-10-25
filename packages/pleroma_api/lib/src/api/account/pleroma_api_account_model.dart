import 'package:mastodon_api/mastodon_api.dart';

import '../emoji/pleroma_api_emoji_model.dart';
import '../field/pleroma_api_field_model.dart';
import '../pleroma_api_model.dart';
import '../tag/pleroma_api_tag_model.dart';
import 'relationship/pleroma_api_account_relationship_model.dart';

abstract class IPleromaApiAccount
    implements IMastodonApiAccount, IPleromaApiResponse {
  @override
  List<IPleromaApiField>? get fields;

  @override
  List<IPleromaApiEmoji>? get emojis;

  IPleromaApiAccountPleromaPart? get pleroma;

  String? get fqn;
}

abstract class IPleromaApiAccountPleromaPart
    implements IPleromaApiResponsePart {
  String? get backgroundImage;

  List<IPleromaApiTag>? get tags;

  IPleromaApiAccountRelationship? get relationship;

  bool? get isAdmin;

  bool? get isModerator;

  bool? get confirmationPending;

  bool? get hideFavorites;

  bool? get hideFollowers;

  bool? get hideFollows;

  bool? get hideFollowersCount;

  bool? get hideFollowsCount;

  bool? get deactivated;

  bool? get allowFollowingMove;

  bool? get acceptsChatMessages;

  bool? get skipThreadContainment;

  bool? get isConfirmed;

  String? get favicon;

  String? get apId;

  List<String>? get alsoKnownAs;
}
