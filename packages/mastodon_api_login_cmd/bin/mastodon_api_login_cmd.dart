import 'dart:io';

import 'package:fediverse_api_login_cmd/fediverse_api_login_cmd.dart';
import 'package:mastodon_api_login_cmd/mastodon_api_login_cmd.dart';

Future main(List<String> arguments) async {
  var cmdBloc = FediverseCmdBloc(
    arguments: arguments,
    cmdConfig: FediverseCmdConfig(
      options: [
        fediverseInstanceCmdOption,
        fediverseUserCmdOption,
        fediversePasswordCmdOption,
        mastodonScopesCmdOption,
      ],
      flags: [],
    ),
  );

  var instance = cmdBloc.getOptionValue(fediverseInstanceCmdOption) as String;
  var user = cmdBloc.getOptionValue(fediverseUserCmdOption) as String;
  var password = cmdBloc.getOptionValue(fediversePasswordCmdOption) as String;
  var scopes = cmdBloc.getOptionValue(mastodonScopesCmdOption) as String;

  var token = await MastodonLoginHelper.performLoginAndExtractToken(
    credentials: MastodonLoginCredentials(
      instance: instance,
      user: user,
      password: password,
      scopes: scopes,
    ),
  );

  // ignore: avoid_print
  print('Token $token');

  exit(0);
}
