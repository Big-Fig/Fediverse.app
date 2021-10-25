import '../../mastodon_api_model.dart';

abstract class IMastodonApiRegisterAccount implements IMastodonApiObject {
  String get username;
  String get email;
  String get password;
  bool get agreement;
  String get locale;
  String? get reason;
}
