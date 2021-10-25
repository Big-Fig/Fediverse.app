import 'package:fediverse_api_login_cmd/fediverse_api_login_cmd.dart';

import '../mastodon_login_helper.dart';

const mastodonScopesCmdOption = FediverseCmdOption(
  'scopes',
  abbr: 's',
  help: 'Permissions divided with space',
  mandatory: false,
  valueHelp: MastodonLoginHelper.allScopes,
  // ignore: no-equal-arguments
  defaultsTo: MastodonLoginHelper.allScopes,
);
