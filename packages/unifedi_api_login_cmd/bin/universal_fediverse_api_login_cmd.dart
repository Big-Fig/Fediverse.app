import 'dart:io';

import 'package:fediverse_api_login_cmd/fediverse_api_login_cmd.dart';
import 'package:logging/logging.dart';
import 'package:mastodon_api_login_cmd/mastodon_api_login_cmd.dart';
import 'package:pleroma_api_login_cmd/pleroma_api_login_cmd.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:unifedi_api_login_cmd/src/cmd/fediverse_login_cmd_options.dart';

final _logger = Logger('universal_fediverse_api_login_cmd.dart');

// ignore: long-method
Future main(List<String> arguments) async {
  var cmdBloc = FediverseCmdBloc(
    arguments: arguments,
    cmdConfig: FediverseCmdConfig(
      options: [
        fediverseInstanceCmdOption,
        fediverseUserCmdOption,
        fediversePasswordCmdOption,
        universalFediverseScopesCmdOption,
      ],
      flags: [],
    ),
  );

  var instance = cmdBloc.getOptionValue(fediverseInstanceCmdOption) as String;
  var user = cmdBloc.getOptionValue(fediverseUserCmdOption) as String;
  var password = cmdBloc.getOptionValue(fediversePasswordCmdOption) as String;
  var scopes = cmdBloc.getOptionValue(mastodonScopesCmdOption) as String;

  var unifediApiInstanceTypeDetectorBloc = UnifediApiInstanceTypeDetectorBloc();

  UnifediApiInstanceType instanceType;
  try {
    instanceType = await unifediApiInstanceTypeDetectorBloc.detectInstanceType(
      url: instance,
    );
  } on Exception catch (e, stackTrace) {
    _logger.severe(
      () => 'failed to detect instance type',
      e,
      stackTrace,
    );
    exit(1);
  } finally {
    await unifediApiInstanceTypeDetectorBloc.dispose();
  }

  var token = await instanceType.when<Future<String?>>(
    unknown: (stringValue) =>
        throw ArgumentError('Not supported instance $stringValue'),
    pleroma: (_) => PleromaLoginHelper.performLoginAndExtractToken(
      credentials: PleromaLoginCredentials(
        instance: instance,
        user: user,
        password: password,
        scopes: scopes,
      ),
    ),
    mastodon: (_) => MastodonLoginHelper.performLoginAndExtractToken(
      credentials: MastodonLoginCredentials(
        instance: instance,
        user: user,
        password: password,
        scopes: scopes,
      ),
    ),
  );

  // ignore: avoid_print
  print('Token $token');

  exit(0);
}
