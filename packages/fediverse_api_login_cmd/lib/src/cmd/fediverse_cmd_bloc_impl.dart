import 'dart:io';

import 'package:args/args.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';

import 'common/fediverse_common_cmd_flags.dart';
import 'fediverse_cmd_bloc.dart';
import 'fediverse_cmd_model.dart';

// ignore_for_file: avoid_print
class FediverseCmdBloc implements IFediverseCmdBloc {
  @override
  final FediverseCmdConfig cmdConfig;

  @override
  final List<String> arguments;

  // ignore: avoid-late-keyword
  late ArgResults argResults;

  FediverseCmdBloc({
    required this.cmdConfig,
    required this.arguments,
    bool addDefaultHelpFlag = true,
    bool addDefaultVerboseFlag = true,
  }) {
    final argParser = ArgParser(allowTrailingOptions: false);

    for (final option in cmdConfig.options) {
      argParser.addOption(
        option.name,
        abbr: option.abbr,
        help: option.help,
        defaultsTo: option.defaultsTo,
        callback: option.callback,
        mandatory: option.mandatory,
        hide: option.hide,
        aliases: option.aliases,
      );
    }

    var flags = cmdConfig.flags;
    if (addDefaultHelpFlag) {
      flags.add(fediverseHelpCmdFlag);
    }
    if (addDefaultVerboseFlag) {
      flags.add(fediverseVerboseCmdFlag);
    }
    for (final flag in flags) {
      argParser.addFlag(
        flag.name,
        abbr: flag.abbr,
        help: flag.help,
        defaultsTo: flag.defaultsTo,
        negatable: flag.negatable,
        callback: flag.callback,
        hide: flag.hide,
        aliases: flag.aliases,
      );
    }

    try {
      argResults = argParser.parse(arguments);
    } on ArgParserException catch (e) {
      _handleError(argParser, e.toString());
    }

    // show help
    if (addDefaultHelpFlag && argResults[fediverseHelpCmdFlag.name] as bool) {
      _showUsage(argParser);
      exit(0);
    }

    // logging
    if (addDefaultVerboseFlag &&
        argResults[fediverseVerboseCmdFlag.name] as bool) {
      // ignore: avoid-ignoring-return-values
      LoggingInitHelper.initPrintToConsole(verbose: true);
    } else {
      // ignore: avoid-ignoring-return-values
      LoggingInitHelper.initPrintToConsole(verbose: false);
    }
  }

  void _handleError(ArgParser argParser, String msg) {
    stderr.writeln(msg);
    _showUsage(argParser);
  }

  void _showUsage(ArgParser argParser) {
    print(argParser.usage);
    // ignore: no-magic-number
    exit(2);
  }

  @override
  dynamic getOptionValue(FediverseCmdOption cmdOption) =>
      argResults[cmdOption.name];

  @override
  bool getFlagValue(FediverseCmdFlag cmdFlag) =>
      argResults[cmdFlag.name] as bool;
}
