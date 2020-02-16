import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:fedi/mastodon/account/mastodon_account_model.dart';

abstract class IMastodonAccountEditService {

  Future<IMastodonAccount> changeAvatarImage({@required File file});
  Future<IMastodonAccount> changeHeaderImage({@required File file});
}
