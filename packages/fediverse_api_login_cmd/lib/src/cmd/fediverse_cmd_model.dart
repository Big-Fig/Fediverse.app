import 'package:freezed_annotation/freezed_annotation.dart';

part 'fediverse_cmd_model.freezed.dart';

@freezed
class FediverseCmdConfig with _$FediverseCmdConfig {
  factory FediverseCmdConfig({
    required List<FediverseCmdOption> options,
    required List<FediverseCmdFlag> flags,
  }) = _FediverseCmdConfig;
}

@freezed
class FediverseCmdOption with _$FediverseCmdOption {
  const factory FediverseCmdOption(
    String name, {
    String? abbr,
    String? help,
    String? valueHelp,
    Iterable<String>? allowed,
    Map<String, String>? allowedHelp,
    String? defaultsTo,
    void Function(String?)? callback,
    @Default(false) bool mandatory,
    @Default(false) bool hide,
    @Default(<String>[]) List<String> aliases,
  }) = _FediverseCmdOption;
}

@freezed
class FediverseCmdFlag with _$FediverseCmdFlag {
  const factory FediverseCmdFlag(
    String name, {
    String? abbr,
    String? help,
    @Default(false) bool defaultsTo,
    @Default(true) bool negatable,
    void Function(bool)? callback,
    @Default(false) bool hide,
    @Default(<String>[]) List<String> aliases,
  }) = _FediverseCmdFlag;
}
