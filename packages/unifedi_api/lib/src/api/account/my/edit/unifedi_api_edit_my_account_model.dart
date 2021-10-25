import '../../../field/unifedi_api_field_model.dart';
import '../../../unifedi_api_model.dart';

abstract class IUnifediApiEditMyAccount implements IUnifediApiObject {
  bool? get discoverable;

  bool? get bot;

  String? get displayName;

  String? get note;

  bool? get locked;

  String? get privacy;

  bool? get sensitive;

  String? get language;

  String? get avatarLocalFilePath;

  bool? get deleteAvatar;

  String? get headerLocalFilePath;

  bool? get deleteHeader;

  bool? get noRichText;

  bool? get hideFollowers;

  bool? get hideFollows;

  bool? get hideFollowersCount;

  bool? get hideFollowsCount;

  bool? get hideFavorites;

  bool? get showRole;

  String? get defaultScope;

  Map<String, dynamic>? get settingsStore;

  bool? get skipThreadContainment;

  bool? get allowFollowingMove;

  bool? get acceptsChatMessages;

  List<String>? get alsoKnownAs;

  String? get backgroundImageLocalFilePath;

  bool? get deleteBackgroundImage;

  List<IUnifediApiField>? get fieldsAttributes;
}
