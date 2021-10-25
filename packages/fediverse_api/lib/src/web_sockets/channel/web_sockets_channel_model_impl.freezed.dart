// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'web_sockets_channel_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WebSocketsChannelConfig _$WebSocketsChannelConfigFromJson(
    Map<String, dynamic> json) {
  return _WebSocketsChannelConfig.fromJson(json);
}

/// @nodoc
class _$WebSocketsChannelConfigTearOff {
  const _$WebSocketsChannelConfigTearOff();

  _WebSocketsChannelConfig call({@HiveField(0) required String url}) {
    return _WebSocketsChannelConfig(
      url: url,
    );
  }

  WebSocketsChannelConfig fromJson(Map<String, Object> json) {
    return WebSocketsChannelConfig.fromJson(json);
  }
}

/// @nodoc
const $WebSocketsChannelConfig = _$WebSocketsChannelConfigTearOff();

/// @nodoc
mixin _$WebSocketsChannelConfig {
  @HiveField(0)
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WebSocketsChannelConfigCopyWith<WebSocketsChannelConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebSocketsChannelConfigCopyWith<$Res> {
  factory $WebSocketsChannelConfigCopyWith(WebSocketsChannelConfig value,
          $Res Function(WebSocketsChannelConfig) then) =
      _$WebSocketsChannelConfigCopyWithImpl<$Res>;
  $Res call({@HiveField(0) String url});
}

/// @nodoc
class _$WebSocketsChannelConfigCopyWithImpl<$Res>
    implements $WebSocketsChannelConfigCopyWith<$Res> {
  _$WebSocketsChannelConfigCopyWithImpl(this._value, this._then);

  final WebSocketsChannelConfig _value;
  // ignore: unused_field
  final $Res Function(WebSocketsChannelConfig) _then;

  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$WebSocketsChannelConfigCopyWith<$Res>
    implements $WebSocketsChannelConfigCopyWith<$Res> {
  factory _$WebSocketsChannelConfigCopyWith(_WebSocketsChannelConfig value,
          $Res Function(_WebSocketsChannelConfig) then) =
      __$WebSocketsChannelConfigCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String url});
}

/// @nodoc
class __$WebSocketsChannelConfigCopyWithImpl<$Res>
    extends _$WebSocketsChannelConfigCopyWithImpl<$Res>
    implements _$WebSocketsChannelConfigCopyWith<$Res> {
  __$WebSocketsChannelConfigCopyWithImpl(_WebSocketsChannelConfig _value,
      $Res Function(_WebSocketsChannelConfig) _then)
      : super(_value, (v) => _then(v as _WebSocketsChannelConfig));

  @override
  _WebSocketsChannelConfig get _value =>
      super._value as _WebSocketsChannelConfig;

  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_WebSocketsChannelConfig(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WebSocketsChannelConfig implements _WebSocketsChannelConfig {
  const _$_WebSocketsChannelConfig({@HiveField(0) required this.url});

  factory _$_WebSocketsChannelConfig.fromJson(Map<String, dynamic> json) =>
      _$$_WebSocketsChannelConfigFromJson(json);

  @override
  @HiveField(0)
  final String url;

  @override
  String toString() {
    return 'WebSocketsChannelConfig(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WebSocketsChannelConfig &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(url);

  @JsonKey(ignore: true)
  @override
  _$WebSocketsChannelConfigCopyWith<_WebSocketsChannelConfig> get copyWith =>
      __$WebSocketsChannelConfigCopyWithImpl<_WebSocketsChannelConfig>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WebSocketsChannelConfigToJson(this);
  }
}

abstract class _WebSocketsChannelConfig implements WebSocketsChannelConfig {
  const factory _WebSocketsChannelConfig({@HiveField(0) required String url}) =
      _$_WebSocketsChannelConfig;

  factory _WebSocketsChannelConfig.fromJson(Map<String, dynamic> json) =
      _$_WebSocketsChannelConfig.fromJson;

  @override
  @HiveField(0)
  String get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WebSocketsChannelConfigCopyWith<_WebSocketsChannelConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
