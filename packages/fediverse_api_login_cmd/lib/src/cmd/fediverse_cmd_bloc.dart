import 'fediverse_cmd_model.dart';

abstract class IFediverseCmdBloc {
  FediverseCmdConfig get cmdConfig;

  List<String> get arguments;

  dynamic getOptionValue(FediverseCmdOption cmdOption);

  bool getFlagValue(FediverseCmdFlag cmdFlag);
}
