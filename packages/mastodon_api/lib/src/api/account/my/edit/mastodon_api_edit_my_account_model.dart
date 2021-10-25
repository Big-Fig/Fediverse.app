import '../../../field/mastodon_api_field_model.dart';
import '../../../mastodon_api_model.dart';

abstract class IMastodonApiEditMyAccount implements IMastodonApiObject {
  List<IMastodonApiField>? get fieldsAttributes;

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
}
