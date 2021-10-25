import '../fediverse_cmd_model.dart';

const fediverseInstanceCmdOption = FediverseCmdOption(
  'instance',
  abbr: 'i',
  help: 'Instance url with scheme',
  mandatory: true,
  valueHelp: 'https:/fedi.app',
);

const fediverseUserCmdOption = FediverseCmdOption(
  'user',
  abbr: 'u',
  help: 'User nickname or email',
  valueHelp: 'fediuser',
  mandatory: true,
);

const fediversePasswordCmdOption = FediverseCmdOption(
  'password',
  abbr: 'p',
  help: 'Password',
  valueHelp: 'password123',
  mandatory: true,
);
