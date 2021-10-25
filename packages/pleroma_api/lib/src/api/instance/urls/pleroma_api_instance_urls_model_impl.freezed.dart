// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_instance_urls_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiInstanceUrls _$PleromaApiInstanceUrlsFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiInstanceUrls.fromJson(json);
}

/// @nodoc
class _$PleromaApiInstanceUrlsTearOff {
  const _$PleromaApiInstanceUrlsTearOff();

  _PleromaApiInstanceUrls call(
      {@JsonKey(name: 'streaming_api')
      @HiveField(0)
          required String? streamingApi}) {
    return _PleromaApiInstanceUrls(
      streamingApi: streamingApi,
    );
  }

  PleromaApiInstanceUrls fromJson(Map<String, Object> json) {
    return PleromaApiInstanceUrls.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiInstanceUrls = _$PleromaApiInstanceUrlsTearOff();

/// @nodoc
mixin _$PleromaApiInstanceUrls {
  @JsonKey(name: 'streaming_api')
  @HiveField(0)
  String? get streamingApi => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiInstanceUrlsCopyWith<PleromaApiInstanceUrls> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiInstanceUrlsCopyWith<$Res> {
  factory $PleromaApiInstanceUrlsCopyWith(PleromaApiInstanceUrls value,
          $Res Function(PleromaApiInstanceUrls) then) =
      _$PleromaApiInstanceUrlsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'streaming_api') @HiveField(0) String? streamingApi});
}

/// @nodoc
class _$PleromaApiInstanceUrlsCopyWithImpl<$Res>
    implements $PleromaApiInstanceUrlsCopyWith<$Res> {
  _$PleromaApiInstanceUrlsCopyWithImpl(this._value, this._then);

  final PleromaApiInstanceUrls _value;
  // ignore: unused_field
  final $Res Function(PleromaApiInstanceUrls) _then;

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
abstract class _$PleromaApiInstanceUrlsCopyWith<$Res>
    implements $PleromaApiInstanceUrlsCopyWith<$Res> {
  factory _$PleromaApiInstanceUrlsCopyWith(_PleromaApiInstanceUrls value,
          $Res Function(_PleromaApiInstanceUrls) then) =
      __$PleromaApiInstanceUrlsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'streaming_api') @HiveField(0) String? streamingApi});
}

/// @nodoc
class __$PleromaApiInstanceUrlsCopyWithImpl<$Res>
    extends _$PleromaApiInstanceUrlsCopyWithImpl<$Res>
    implements _$PleromaApiInstanceUrlsCopyWith<$Res> {
  __$PleromaApiInstanceUrlsCopyWithImpl(_PleromaApiInstanceUrls _value,
      $Res Function(_PleromaApiInstanceUrls) _then)
      : super(_value, (v) => _then(v as _PleromaApiInstanceUrls));

  @override
  _PleromaApiInstanceUrls get _value => super._value as _PleromaApiInstanceUrls;

  @override
  $Res call({
    Object? streamingApi = freezed,
  }) {
    return _then(_PleromaApiInstanceUrls(
      streamingApi: streamingApi == freezed
          ? _value.streamingApi
          : streamingApi // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiInstanceUrls implements _PleromaApiInstanceUrls {
  const _$_PleromaApiInstanceUrls(
      {@JsonKey(name: 'streaming_api')
      @HiveField(0)
          required this.streamingApi});

  factory _$_PleromaApiInstanceUrls.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiInstanceUrlsFromJson(json);

  @override
  @JsonKey(name: 'streaming_api')
  @HiveField(0)
  final String? streamingApi;

  @override
  String toString() {
    return 'PleromaApiInstanceUrls(streamingApi: $streamingApi)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiInstanceUrls &&
            (identical(other.streamingApi, streamingApi) ||
                const DeepCollectionEquality()
                    .equals(other.streamingApi, streamingApi)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(streamingApi);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiInstanceUrlsCopyWith<_PleromaApiInstanceUrls> get copyWith =>
      __$PleromaApiInstanceUrlsCopyWithImpl<_PleromaApiInstanceUrls>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiInstanceUrlsToJson(this);
  }
}

abstract class _PleromaApiInstanceUrls implements PleromaApiInstanceUrls {
  const factory _PleromaApiInstanceUrls(
      {@JsonKey(name: 'streaming_api')
      @HiveField(0)
          required String? streamingApi}) = _$_PleromaApiInstanceUrls;

  factory _PleromaApiInstanceUrls.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiInstanceUrls.fromJson;

  @override
  @JsonKey(name: 'streaming_api')
  @HiveField(0)
  String? get streamingApi => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiInstanceUrlsCopyWith<_PleromaApiInstanceUrls> get copyWith =>
      throw _privateConstructorUsedError;
}
