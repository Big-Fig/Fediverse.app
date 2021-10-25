import '../fediverse_cmd_model.dart';

const fediverseHelpCmdFlag = FediverseCmdFlag(
  'help',
  abbr: 'h',
  help: 'Display this help information.',
  negatable: false,
);

const fediverseVerboseCmdFlag = FediverseCmdFlag(
  'verbose',
  abbr: 'v',
  help: 'Logging',
  negatable: false,
);
