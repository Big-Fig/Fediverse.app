import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:fedi/mastodon/account/mastodon_account_model.dart';

abstract class IMastodonAccountEditService {

  static IMastodonAccountEditService of(BuildContext context,
      {listen: true}) =>
      Provider.of<IMastodonAccountEditService>(context, listen: listen);

  Future<MastodonAccount> changeAvatarImage({@required File file});
  Future<MastodonAccount> changeHeaderImage({@required File file});
}
