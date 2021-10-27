// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_urls_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstanceUrls _$UnifediApiInstanceUrlsFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiInstanceUrls.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstanceUrlsTearOff {
  const _$UnifediApiInstanceUrlsTearOff();

  _UnifediApiInstanceUrls call(
      {@JsonKey(name: 'streaming_api')
      @HiveField(0)
          required String? streamingApi}) {
    return _UnifediApiInstanceUrls(
      streamingApi: streamingApi,
    );
  }

  UnifediApiInstanceUrls fromJson(Map<String, Object?> json) {
    return UnifediApiInstanceUrls.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstanceUrls = _$UnifediApiInstanceUrlsTearOff();

/// @nodoc
mixin _$UnifediApiInstanceUrls {
  @JsonKey(name: 'streaming_api')
  @HiveField(0)
  String? get streamingApi => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiInstanceUrlsCopyWith<UnifediApiInstanceUrls> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstanceUrlsCopyWith<$Res> {
  factory $UnifediApiInstanceUrlsCopyWith(UnifediApiInstanceUrls value,
          $Res Function(UnifediApiInstanceUrls) then) =
      _$UnifediApiInstanceUrlsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'streaming_api') @HiveField(0) String? streamingApi});
}

/// @nodoc
class _$UnifediApiInstanceUrlsCopyWithImpl<$Res>
    implements $UnifediApiInstanceUrlsCopyWith<$Res> {
  _$UnifediApiInstanceUrlsCopyWithImpl(this._value, this._then);

  final UnifediApiInstanceUrls _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstanceUrls) _then;

  @override
  $Res call({
    Object? streamingApi = freezed,
  }) {
    return _then(_value.copyWith(
      streamingApi: streamingApi == freezed
          ? _value.streamingApi
          : streamingApi // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiInstanceUrlsCopyWith<$Res>
    implements $UnifediApiInstanceUrlsCopyWith<$Res> {
  factory _$UnifediApiInstanceUrlsCopyWith(_UnifediApiInstanceUrls value,
          $Res Function(_UnifediApiInstanceUrls) then) =
      __$UnifediApiInstanceUrlsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'streaming_api') @HiveField(0) String? streamingApi});
}

/// @nodoc
class __$UnifediApiInstanceUrlsCopyWithImpl<$Res>
    extends _$UnifediApiInstanceUrlsCopyWithImpl<$Res>
    implements _$UnifediApiInstanceUrlsCopyWith<$Res> {
  __$UnifediApiInstanceUrlsCopyWithImpl(_UnifediApiInstanceUrls _value,
      $Res Function(_UnifediApiInstanceUrls) _then)
      : super(_value, (v) => _then(v as _UnifediApiInstanceUrls));

  @override
  _UnifediApiInstanceUrls get _value => super._value as _UnifediApiInstanceUrls;

  @override
  $Res call({
    Object? streamingApi = freezed,
  }) {
    return _then(_UnifediApiInstanceUrls(
      streamingApi: streamingApi == freezed
          ? _value.streamingApi
          : streamingApi // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiInstanceUrls implements _UnifediApiInstanceUrls {
  const _$_UnifediApiInstanceUrls(
      {@JsonKey(name: 'streaming_api')
      @HiveField(0)
          required this.streamingApi});

  factory _$_UnifediApiInstanceUrls.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiInstanceUrlsFromJson(json);

  @override
  @JsonKey(name: 'streaming_api')
  @HiveField(0)
  final String? streamingApi;

  @override
  String toString() {
    return 'UnifediApiInstanceUrls(streamingApi: $streamingApi)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiInstanceUrls &&
            (identical(other.streamingApi, streamingApi) ||
                other.streamingApi == streamingApi));
  }

  @override
  int get hashCode => Object.hash(runtimeType, streamingApi);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstanceUrlsCopyWith<_UnifediApiInstanceUrls> get copyWith =>
      __$UnifediApiInstanceUrlsCopyWithImpl<_UnifediApiInstanceUrls>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstanceUrlsToJson(this);
  }
}

abstract class _UnifediApiInstanceUrls implements UnifediApiInstanceUrls {
  const factory _UnifediApiInstanceUrls(
      {@JsonKey(name: 'streaming_api')
      @HiveField(0)
          required String? streamingApi}) = _$_UnifediApiInstanceUrls;

  factory _UnifediApiInstanceUrls.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiInstanceUrls.fromJson;

  @override
  @JsonKey(name: 'streaming_api')
  @HiveField(0)
  String? get streamingApi;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstanceUrlsCopyWith<_UnifediApiInstanceUrls> get copyWith =>
      throw _privateConstructorUsedError;
}
