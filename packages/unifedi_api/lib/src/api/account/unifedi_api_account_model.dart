import '../emoji/unifedi_api_emoji_model.dart';
import '../field/unifedi_api_field_model.dart';
import '../tag/unifedi_api_tag_model.dart';
import '../unifedi_api_model.dart';
import 'relationship/unifedi_api_account_relationship_model.dart';

abstract class IUnifediApiAccount implements IUnifediApiResponse {
  String get username;

  String get url;

  int? get statusesCount;

  String? get note;

  bool? get bot;

  bool? get locked;

  String get id;

  String? get headerStatic;

  String? get header;

  int? get followingCount;

  int? get followersCount;

  String? get displayName;

  DateTime get createdAt;

  String get avatarStatic;

  String get avatar;

  String get acct;

  DateTime? get lastStatusAt;

  List<IUnifediApiField>? get fields;

  List<IUnifediApiEmoji>? get emojis;

  String? get fqn;

  String? get backgroundImage;

  List<IUnifediApiTag>? get tags;

  IUnifediApiAccountRelationship? get relationship;

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

  bool? get suspended;

  DateTime? get muteExpiresAt;
}
