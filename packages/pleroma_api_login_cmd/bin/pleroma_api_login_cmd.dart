import 'dart:io';

import 'package:fediverse_api_login_cmd/fediverse_api_login_cmd.dart';
import 'package:pleroma_api_login_cmd/pleroma_api_login_cmd.dart';

Future main(List<String> arguments) async {
  var cmdBloc = FediverseCmdBloc(
    arguments: arguments,
    cmdConfig: FediverseCmdConfig(
      options: [
        fediverseInstanceCmdOption,
        fediverseUserCmdOption,
        fediversePasswordCmdOption,
        pleromaScopesCmdOption,
      ],
      flags: [],
    ),
  );

  var instance = cmdBloc.getOptionValue(fediverseInstanceCmdOption) as String;
  var user = cmdBloc.getOptionValue(fediverseUserCmdOption) as String;
  var password = cmdBloc.getOptionValue(fediversePasswordCmdOption) as String;
  var scopes = cmdBloc.getOptionValue(pleromaScopesCmdOption) as String;

  var token = await PleromaLoginHelper.performLoginAndExtractToken(
    credentials: PleromaLoginCredentials(
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
