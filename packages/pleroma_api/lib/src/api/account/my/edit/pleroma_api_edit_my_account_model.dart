import 'package:mastodon_api/mastodon_api.dart';

import '../../../field/pleroma_api_field_model.dart';
import '../../../pleroma_api_model.dart';

abstract class IPleromaApiEditMyAccount
    implements IMastodonApiEditMyAccount, IPleromaApiObject {
  bool? get noRichText;

  bool? get hideFollowers;

  bool? get hideFollows;

  bool? get hideFollowersCount;

  bool? get hideFollowsCount;

  bool? get hideFavorites;

  bool? get showRole;

  String? get defaultScope;

  Map<String, dynamic>? get pleromaSettingsStore;

  bool? get skipThreadContainment;

  bool? get allowFollowingMove;

  bool? get acceptsChatMessages;

  List<String>? get alsoKnownAs;

  String? get pleromaBackgroundImageLocalFilePath;

  bool? get deletePleromaBackgroundImage;

  @override
  List<IPleromaApiField>? get fieldsAttributes;
}
