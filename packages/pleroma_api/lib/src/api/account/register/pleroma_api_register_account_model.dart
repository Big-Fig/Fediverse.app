import 'package:mastodon_api/mastodon_api.dart';

import '../../pleroma_api_model.dart';

abstract class IPleromaApiRegisterAccount
    implements IMastodonApiRegisterAccount, IPleromaApiObject {
  String? get captchaToken;

  String? get captchaAnswerData;

  String? get captchaSolution;

  String? get fullName;

  String? get bio;

  String? get inviteToken;
}
