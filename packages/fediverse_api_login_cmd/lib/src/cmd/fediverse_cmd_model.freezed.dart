// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fediverse_cmd_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FediverseCmdConfigTearOff {
  const _$FediverseCmdConfigTearOff();

  _FediverseCmdConfig call(
      {required List<FediverseCmdOption> options,
      required List<FediverseCmdFlag> flags}) {
    return _FediverseCmdConfig(
      options: options,
      flags: flags,
    );
  }
}

/// @nodoc
const $FediverseCmdConfig = _$FediverseCmdConfigTearOff();

/// @nodoc
mixin _$FediverseCmdConfig {
  List<FediverseCmdOption> get options => throw _privateConstructorUsedError;
  List<FediverseCmdFlag> get flags => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FediverseCmdConfigCopyWith<FediverseCmdConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FediverseCmdConfigCopyWith<$Res> {
  factory $FediverseCmdConfigCopyWith(
          FediverseCmdConfig value, $Res Function(FediverseCmdConfig) then) =
      _$FediverseCmdConfigCopyWithImpl<$Res>;
  $Res call({List<FediverseCmdOption> options, List<FediverseCmdFlag> flags});
}

/// @nodoc
class _$FediverseCmdConfigCopyWithImpl<$Res>
    implements $FediverseCmdConfigCopyWith<$Res> {
  _$FediverseCmdConfigCopyWithImpl(this._value, this._then);

  final FediverseCmdConfig _value;
  // ignore: unused_field
  final $Res Function(FediverseCmdConfig) _then;

  @override
  $Res call({
    Object? options = freezed,
    Object? flags = freezed,
  }) {
    return _then(_value.copyWith(
      options: options == freezed
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<FediverseCmdOption>,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as List<FediverseCmdFlag>,
    ));
  }
}

/// @nodoc
abstract class _$FediverseCmdConfigCopyWith<$Res>
    implements $FediverseCmdConfigCopyWith<$Res> {
  factory _$FediverseCmdConfigCopyWith(
          _FediverseCmdConfig value, $Res Function(_FediverseCmdConfig) then) =
      __$FediverseCmdConfigCopyWithImpl<$Res>;
  @override
  $Res call({List<FediverseCmdOption> options, List<FediverseCmdFlag> flags});
}

/// @nodoc
class __$FediverseCmdConfigCopyWithImpl<$Res>
    extends _$FediverseCmdConfigCopyWithImpl<$Res>
    implements _$FediverseCmdConfigCopyWith<$Res> {
  __$FediverseCmdConfigCopyWithImpl(
      _FediverseCmdConfig _value, $Res Function(_FediverseCmdConfig) _then)
      : super(_value, (v) => _then(v as _FediverseCmdConfig));

  @override
  _FediverseCmdConfig get _value => super._value as _FediverseCmdConfig;

  @override
  $Res call({
    Object? options = freezed,
    Object? flags = freezed,
  }) {
    return _then(_FediverseCmdConfig(
      options: options == freezed
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<FediverseCmdOption>,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as List<FediverseCmdFlag>,
    ));
  }
}

/// @nodoc

class _$_FediverseCmdConfig implements _FediverseCmdConfig {
  _$_FediverseCmdConfig({required this.options, required this.flags});

  @override
  final List<FediverseCmdOption> options;
  @override
  final List<FediverseCmdFlag> flags;

  @override
  String toString() {
    return 'FediverseCmdConfig(options: $options, flags: $flags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FediverseCmdConfig &&
            const DeepCollectionEquality().equals(other.options, options) &&
            const DeepCollectionEquality().equals(other.flags, flags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(options),
      const DeepCollectionEquality().hash(flags));

  @JsonKey(ignore: true)
  @override
  _$FediverseCmdConfigCopyWith<_FediverseCmdConfig> get copyWith =>
      __$FediverseCmdConfigCopyWithImpl<_FediverseCmdConfig>(this, _$identity);
}

abstract class _FediverseCmdConfig implements FediverseCmdConfig {
  factory _FediverseCmdConfig(
      {required List<FediverseCmdOption> options,
      required List<FediverseCmdFlag> flags}) = _$_FediverseCmdConfig;

  @override
  List<FediverseCmdOption> get options;
  @override
  List<FediverseCmdFlag> get flags;
  @override
  @JsonKey(ignore: true)
  _$FediverseCmdConfigCopyWith<_FediverseCmdConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$FediverseCmdOptionTearOff {
  const _$FediverseCmdOptionTearOff();

  _FediverseCmdOption call(String name,
      {String? abbr,
      String? help,
      String? valueHelp,
      Iterable<String>? allowed,
      Map<String, String>? allowedHelp,
      String? defaultsTo,
      void Function(String?)? callback,
      bool mandatory = false,
      bool hide = false,
      List<String> aliases = const <String>[]}) {
    return _FediverseCmdOption(
      name,
      abbr: abbr,
      help: help,
      valueHelp: valueHelp,
      allowed: allowed,
      allowedHelp: allowedHelp,
      defaultsTo: defaultsTo,
      callback: callback,
      mandatory: mandatory,
      hide: hide,
      aliases: aliases,
    );
  }
}

/// @nodoc
const $FediverseCmdOption = _$FediverseCmdOptionTearOff();

/// @nodoc
mixin _$FediverseCmdOption {
  String get name => throw _privateConstructorUsedError;
  String? get abbr => throw _privateConstructorUsedError;
  String? get help => throw _privateConstructorUsedError;
  String? get valueHelp => throw _privateConstructorUsedError;
  Iterable<String>? get allowed => throw _privateConstructorUsedError;
  Map<String, String>? get allowedHelp => throw _privateConstructorUsedError;
  String? get defaultsTo => throw _privateConstructorUsedError;
  void Function(String?)? get callback => throw _privateConstructorUsedError;
  bool get mandatory => throw _privateConstructorUsedError;
  bool get hide => throw _privateConstructorUsedError;
  List<String> get aliases => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FediverseCmdOptionCopyWith<FediverseCmdOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FediverseCmdOptionCopyWith<$Res> {
  factory $FediverseCmdOptionCopyWith(
          FediverseCmdOption value, $Res Function(FediverseCmdOption) then) =
      _$FediverseCmdOptionCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String? abbr,
      String? help,
      String? valueHelp,
      Iterable<String>? allowed,
      Map<String, String>? allowedHelp,
      String? defaultsTo,
      void Function(String?)? callback,
      bool mandatory,
      bool hide,
      List<String> aliases});
}

/// @nodoc
class _$FediverseCmdOptionCopyWithImpl<$Res>
    implements $FediverseCmdOptionCopyWith<$Res> {
  _$FediverseCmdOptionCopyWithImpl(this._value, this._then);

  final FediverseCmdOption _value;
  // ignore: unused_field
  final $Res Function(FediverseCmdOption) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? abbr = freezed,
    Object? help = freezed,
    Object? valueHelp = freezed,
    Object? allowed = freezed,
    Object? allowedHelp = freezed,
    Object? defaultsTo = freezed,
    Object? callback = freezed,
    Object? mandatory = freezed,
    Object? hide = freezed,
    Object? aliases = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      abbr: abbr == freezed
          ? _value.abbr
          : abbr // ignore: cast_nullable_to_non_nullable
              as String?,
      help: help == freezed
          ? _value.help
          : help // ignore: cast_nullable_to_non_nullable
              as String?,
      valueHelp: valueHelp == freezed
          ? _value.valueHelp
          : valueHelp // ignore: cast_nullable_to_non_nullable
              as String?,
      allowed: allowed == freezed
          ? _value.allowed
          : allowed // ignore: cast_nullable_to_non_nullable
              as Iterable<String>?,
      allowedHelp: allowedHelp == freezed
          ? _value.allowedHelp
          : allowedHelp // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      defaultsTo: defaultsTo == freezed
          ? _value.defaultsTo
          : defaultsTo // ignore: cast_nullable_to_non_nullable
              as String?,
      callback: callback == freezed
          ? _value.callback
          : callback // ignore: cast_nullable_to_non_nullable
              as void Function(String?)?,
      mandatory: mandatory == freezed
          ? _value.mandatory
          : mandatory // ignore: cast_nullable_to_non_nullable
              as bool,
      hide: hide == freezed
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as bool,
      aliases: aliases == freezed
          ? _value.aliases
          : aliases // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$FediverseCmdOptionCopyWith<$Res>
    implements $FediverseCmdOptionCopyWith<$Res> {
  factory _$FediverseCmdOptionCopyWith(
          _FediverseCmdOption value, $Res Function(_FediverseCmdOption) then) =
      __$FediverseCmdOptionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String? abbr,
      String? help,
      String? valueHelp,
      Iterable<String>? allowed,
      Map<String, String>? allowedHelp,
      String? defaultsTo,
      void Function(String?)? callback,
      bool mandatory,
      bool hide,
      List<String> aliases});
}

/// @nodoc
class __$FediverseCmdOptionCopyWithImpl<$Res>
    extends _$FediverseCmdOptionCopyWithImpl<$Res>
    implements _$FediverseCmdOptionCopyWith<$Res> {
  __$FediverseCmdOptionCopyWithImpl(
      _FediverseCmdOption _value, $Res Function(_FediverseCmdOption) _then)
      : super(_value, (v) => _then(v as _FediverseCmdOption));

  @override
  _FediverseCmdOption get _value => super._value as _FediverseCmdOption;

  @override
  $Res call({
    Object? name = freezed,
    Object? abbr = freezed,
    Object? help = freezed,
    Object? valueHelp = freezed,
    Object? allowed = freezed,
    Object? allowedHelp = freezed,
    Object? defaultsTo = freezed,
    Object? callback = freezed,
    Object? mandatory = freezed,
    Object? hide = freezed,
    Object? aliases = freezed,
  }) {
    return _then(_FediverseCmdOption(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      abbr: abbr == freezed
          ? _value.abbr
          : abbr // ignore: cast_nullable_to_non_nullable
              as String?,
      help: help == freezed
          ? _value.help
          : help // ignore: cast_nullable_to_non_nullable
              as String?,
      valueHelp: valueHelp == freezed
          ? _value.valueHelp
          : valueHelp // ignore: cast_nullable_to_non_nullable
              as String?,
      allowed: allowed == freezed
          ? _value.allowed
          : allowed // ignore: cast_nullable_to_non_nullable
              as Iterable<String>?,
      allowedHelp: allowedHelp == freezed
          ? _value.allowedHelp
          : allowedHelp // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      defaultsTo: defaultsTo == freezed
          ? _value.defaultsTo
          : defaultsTo // ignore: cast_nullable_to_non_nullable
              as String?,
      callback: callback == freezed
          ? _value.callback
          : callback // ignore: cast_nullable_to_non_nullable
              as void Function(String?)?,
      mandatory: mandatory == freezed
          ? _value.mandatory
          : mandatory // ignore: cast_nullable_to_non_nullable
              as bool,
      hide: hide == freezed
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as bool,
      aliases: aliases == freezed
          ? _value.aliases
          : aliases // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_FediverseCmdOption implements _FediverseCmdOption {
  const _$_FediverseCmdOption(this.name,
      {this.abbr,
      this.help,
      this.valueHelp,
      this.allowed,
      this.allowedHelp,
      this.defaultsTo,
      this.callback,
      this.mandatory = false,
      this.hide = false,
      this.aliases = const <String>[]});

  @override
  final String name;
  @override
  final String? abbr;
  @override
  final String? help;
  @override
  final String? valueHelp;
  @override
  final Iterable<String>? allowed;
  @override
  final Map<String, String>? allowedHelp;
  @override
  final String? defaultsTo;
  @override
  final void Function(String?)? callback;
  @JsonKey(defaultValue: false)
  @override
  final bool mandatory;
  @JsonKey(defaultValue: false)
  @override
  final bool hide;
  @JsonKey(defaultValue: const <String>[])
  @override
  final List<String> aliases;

  @override
  String toString() {
    return 'FediverseCmdOption(name: $name, abbr: $abbr, help: $help, valueHelp: $valueHelp, allowed: $allowed, allowedHelp: $allowedHelp, defaultsTo: $defaultsTo, callback: $callback, mandatory: $mandatory, hide: $hide, aliases: $aliases)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FediverseCmdOption &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.abbr, abbr) || other.abbr == abbr) &&
            (identical(other.help, help) || other.help == help) &&
            (identical(other.valueHelp, valueHelp) ||
                other.valueHelp == valueHelp) &&
            const DeepCollectionEquality().equals(other.allowed, allowed) &&
            const DeepCollectionEquality()
                .equals(other.allowedHelp, allowedHelp) &&
            (identical(other.defaultsTo, defaultsTo) ||
                other.defaultsTo == defaultsTo) &&
            (identical(other.callback, callback) ||
                other.callback == callback) &&
            (identical(other.mandatory, mandatory) ||
                other.mandatory == mandatory) &&
            (identical(other.hide, hide) || other.hide == hide) &&
            const DeepCollectionEquality().equals(other.aliases, aliases));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      abbr,
      help,
      valueHelp,
      const DeepCollectionEquality().hash(allowed),
      const DeepCollectionEquality().hash(allowedHelp),
      defaultsTo,
      callback,
      mandatory,
      hide,
      const DeepCollectionEquality().hash(aliases));

  @JsonKey(ignore: true)
  @override
  _$FediverseCmdOptionCopyWith<_FediverseCmdOption> get copyWith =>
      __$FediverseCmdOptionCopyWithImpl<_FediverseCmdOption>(this, _$identity);
}

abstract class _FediverseCmdOption implements FediverseCmdOption {
  const factory _FediverseCmdOption(String name,
      {String? abbr,
      String? help,
      String? valueHelp,
      Iterable<String>? allowed,
      Map<String, String>? allowedHelp,
      String? defaultsTo,
      void Function(String?)? callback,
      bool mandatory,
      bool hide,
      List<String> aliases}) = _$_FediverseCmdOption;

  @override
  String get name;
  @override
  String? get abbr;
  @override
  String? get help;
  @override
  String? get valueHelp;
  @override
  Iterable<String>? get allowed;
  @override
  Map<String, String>? get allowedHelp;
  @override
  String? get defaultsTo;
  @override
  void Function(String?)? get callback;
  @override
  bool get mandatory;
  @override
  bool get hide;
  @override
  List<String> get aliases;
  @override
  @JsonKey(ignore: true)
  _$FediverseCmdOptionCopyWith<_FediverseCmdOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$FediverseCmdFlagTearOff {
  const _$FediverseCmdFlagTearOff();

  _FediverseCmdFlag call(String name,
      {String? abbr,
      String? help,
      bool defaultsTo = false,
      bool negatable = true,
      void Function(bool)? callback,
      bool hide = false,
      List<String> aliases = const <String>[]}) {
    return _FediverseCmdFlag(
      name,
      abbr: abbr,
      help: help,
      defaultsTo: defaultsTo,
      negatable: negatable,
      callback: callback,
      hide: hide,
      aliases: aliases,
    );
  }
}

/// @nodoc
const $FediverseCmdFlag = _$FediverseCmdFlagTearOff();

/// @nodoc
mixin _$FediverseCmdFlag {
  String get name => throw _privateConstructorUsedError;
  String? get abbr => throw _privateConstructorUsedError;
  String? get help => throw _privateConstructorUsedError;
  bool get defaultsTo => throw _privateConstructorUsedError;
  bool get negatable => throw _privateConstructorUsedError;
  void Function(bool)? get callback => throw _privateConstructorUsedError;
  bool get hide => throw _privateConstructorUsedError;
  List<String> get aliases => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FediverseCmdFlagCopyWith<FediverseCmdFlag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FediverseCmdFlagCopyWith<$Res> {
  factory $FediverseCmdFlagCopyWith(
          FediverseCmdFlag value, $Res Function(FediverseCmdFlag) then) =
      _$FediverseCmdFlagCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String? abbr,
      String? help,
      bool defaultsTo,
      bool negatable,
      void Function(bool)? callback,
      bool hide,
      List<String> aliases});
}

/// @nodoc
class _$FediverseCmdFlagCopyWithImpl<$Res>
    implements $FediverseCmdFlagCopyWith<$Res> {
  _$FediverseCmdFlagCopyWithImpl(this._value, this._then);

  final FediverseCmdFlag _value;
  // ignore: unused_field
  final $Res Function(FediverseCmdFlag) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? abbr = freezed,
    Object? help = freezed,
    Object? defaultsTo = freezed,
    Object? negatable = freezed,
    Object? callback = freezed,
    Object? hide = freezed,
    Object? aliases = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      abbr: abbr == freezed
          ? _value.abbr
          : abbr // ignore: cast_nullable_to_non_nullable
              as String?,
      help: help == freezed
          ? _value.help
          : help // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultsTo: defaultsTo == freezed
          ? _value.defaultsTo
          : defaultsTo // ignore: cast_nullable_to_non_nullable
              as bool,
      negatable: negatable == freezed
          ? _value.negatable
          : negatable // ignore: cast_nullable_to_non_nullable
              as bool,
      callback: callback == freezed
          ? _value.callback
          : callback // ignore: cast_nullable_to_non_nullable
              as void Function(bool)?,
      hide: hide == freezed
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as bool,
      aliases: aliases == freezed
          ? _value.aliases
          : aliases // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$FediverseCmdFlagCopyWith<$Res>
    implements $FediverseCmdFlagCopyWith<$Res> {
  factory _$FediverseCmdFlagCopyWith(
          _FediverseCmdFlag value, $Res Function(_FediverseCmdFlag) then) =
      __$FediverseCmdFlagCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String? abbr,
      String? help,
      bool defaultsTo,
      bool negatable,
      void Function(bool)? callback,
      bool hide,
      List<String> aliases});
}

/// @nodoc
class __$FediverseCmdFlagCopyWithImpl<$Res>
    extends _$FediverseCmdFlagCopyWithImpl<$Res>
    implements _$FediverseCmdFlagCopyWith<$Res> {
  __$FediverseCmdFlagCopyWithImpl(
      _FediverseCmdFlag _value, $Res Function(_FediverseCmdFlag) _then)
      : super(_value, (v) => _then(v as _FediverseCmdFlag));

  @override
  _FediverseCmdFlag get _value => super._value as _FediverseCmdFlag;

  @override
  $Res call({
    Object? name = freezed,
    Object? abbr = freezed,
    Object? help = freezed,
    Object? defaultsTo = freezed,
    Object? negatable = freezed,
    Object? callback = freezed,
    Object? hide = freezed,
    Object? aliases = freezed,
  }) {
    return _then(_FediverseCmdFlag(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      abbr: abbr == freezed
          ? _value.abbr
          : abbr // ignore: cast_nullable_to_non_nullable
              as String?,
      help: help == freezed
          ? _value.help
          : help // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultsTo: defaultsTo == freezed
          ? _value.defaultsTo
          : defaultsTo // ignore: cast_nullable_to_non_nullable
              as bool,
      negatable: negatable == freezed
          ? _value.negatable
          : negatable // ignore: cast_nullable_to_non_nullable
              as bool,
      callback: callback == freezed
          ? _value.callback
          : callback // ignore: cast_nullable_to_non_nullable
              as void Function(bool)?,
      hide: hide == freezed
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as bool,
      aliases: aliases == freezed
          ? _value.aliases
          : aliases // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_FediverseCmdFlag implements _FediverseCmdFlag {
  const _$_FediverseCmdFlag(this.name,
      {this.abbr,
      this.help,
      this.defaultsTo = false,
      this.negatable = true,
      this.callback,
      this.hide = false,
      this.aliases = const <String>[]});

  @override
  final String name;
  @override
  final String? abbr;
  @override
  final String? help;
  @JsonKey(defaultValue: false)
  @override
  final bool defaultsTo;
  @JsonKey(defaultValue: true)
  @override
  final bool negatable;
  @override
  final void Function(bool)? callback;
  @JsonKey(defaultValue: false)
  @override
  final bool hide;
  @JsonKey(defaultValue: const <String>[])
  @override
  final List<String> aliases;

  @override
  String toString() {
    return 'FediverseCmdFlag(name: $name, abbr: $abbr, help: $help, defaultsTo: $defaultsTo, negatable: $negatable, callback: $callback, hide: $hide, aliases: $aliases)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FediverseCmdFlag &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.abbr, abbr) || other.abbr == abbr) &&
            (identical(other.help, help) || other.help == help) &&
            (identical(other.defaultsTo, defaultsTo) ||
                other.defaultsTo == defaultsTo) &&
            (identical(other.negatable, negatable) ||
                other.negatable == negatable) &&
            (identical(other.callback, callback) ||
                other.callback == callback) &&
            (identical(other.hide, hide) || other.hide == hide) &&
            const DeepCollectionEquality().equals(other.aliases, aliases));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, abbr, help, defaultsTo,
      negatable, callback, hide, const DeepCollectionEquality().hash(aliases));

  @JsonKey(ignore: true)
  @override
  _$FediverseCmdFlagCopyWith<_FediverseCmdFlag> get copyWith =>
      __$FediverseCmdFlagCopyWithImpl<_FediverseCmdFlag>(this, _$identity);
}

abstract class _FediverseCmdFlag implements FediverseCmdFlag {
  const factory _FediverseCmdFlag(String name,
      {String? abbr,
      String? help,
      bool defaultsTo,
      bool negatable,
      void Function(bool)? callback,
      bool hide,
      List<String> aliases}) = _$_FediverseCmdFlag;

  @override
  String get name;
  @override
  String? get abbr;
  @override
  String? get help;
  @override
  bool get defaultsTo;
  @override
  bool get negatable;
  @override
  void Function(bool)? get callback;
  @override
  bool get hide;
  @override
  List<String> get aliases;
  @override
  @JsonKey(ignore: true)
  _$FediverseCmdFlagCopyWith<_FediverseCmdFlag> get copyWith =>
      throw _privateConstructorUsedError;
}
