// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_instance_urls_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiInstanceUrls _$MastodonApiInstanceUrlsFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiInstanceUrls.fromJson(json);
}

/// @nodoc
class _$MastodonApiInstanceUrlsTearOff {
  const _$MastodonApiInstanceUrlsTearOff();

  _MastodonApiInstanceUrls call(
      {@JsonKey(name: 'streaming_api')
      @HiveField(0)
          required String? streamingApi}) {
    return _MastodonApiInstanceUrls(
      streamingApi: streamingApi,
    );
  }

  MastodonApiInstanceUrls fromJson(Map<String, Object?> json) {
    return MastodonApiInstanceUrls.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiInstanceUrls = _$MastodonApiInstanceUrlsTearOff();

/// @nodoc
mixin _$MastodonApiInstanceUrls {
  @JsonKey(name: 'streaming_api')
  @HiveField(0)
  String? get streamingApi => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiInstanceUrlsCopyWith<MastodonApiInstanceUrls> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiInstanceUrlsCopyWith<$Res> {
  factory $MastodonApiInstanceUrlsCopyWith(MastodonApiInstanceUrls value,
          $Res Function(MastodonApiInstanceUrls) then) =
      _$MastodonApiInstanceUrlsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'streaming_api') @HiveField(0) String? streamingApi});
}

/// @nodoc
class _$MastodonApiInstanceUrlsCopyWithImpl<$Res>
    implements $MastodonApiInstanceUrlsCopyWith<$Res> {
  _$MastodonApiInstanceUrlsCopyWithImpl(this._value, this._then);

  final MastodonApiInstanceUrls _value;
  // ignore: unused_field
  final $Res Function(MastodonApiInstanceUrls) _then;

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
abstract class _$MastodonApiInstanceUrlsCopyWith<$Res>
    implements $MastodonApiInstanceUrlsCopyWith<$Res> {
  factory _$MastodonApiInstanceUrlsCopyWith(_MastodonApiInstanceUrls value,
          $Res Function(_MastodonApiInstanceUrls) then) =
      __$MastodonApiInstanceUrlsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'streaming_api') @HiveField(0) String? streamingApi});
}

/// @nodoc
class __$MastodonApiInstanceUrlsCopyWithImpl<$Res>
    extends _$MastodonApiInstanceUrlsCopyWithImpl<$Res>
    implements _$MastodonApiInstanceUrlsCopyWith<$Res> {
  __$MastodonApiInstanceUrlsCopyWithImpl(_MastodonApiInstanceUrls _value,
      $Res Function(_MastodonApiInstanceUrls) _then)
      : super(_value, (v) => _then(v as _MastodonApiInstanceUrls));

  @override
  _MastodonApiInstanceUrls get _value =>
      super._value as _MastodonApiInstanceUrls;

  @override
  $Res call({
    Object? streamingApi = freezed,
  }) {
    return _then(_MastodonApiInstanceUrls(
      streamingApi: streamingApi == freezed
          ? _value.streamingApi
          : streamingApi // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiInstanceUrls implements _MastodonApiInstanceUrls {
  const _$_MastodonApiInstanceUrls(
      {@JsonKey(name: 'streaming_api')
      @HiveField(0)
          required this.streamingApi});

  factory _$_MastodonApiInstanceUrls.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiInstanceUrlsFromJson(json);

  @override
  @JsonKey(name: 'streaming_api')
  @HiveField(0)
  final String? streamingApi;

  @override
  String toString() {
    return 'MastodonApiInstanceUrls(streamingApi: $streamingApi)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiInstanceUrls &&
            (identical(other.streamingApi, streamingApi) ||
                other.streamingApi == streamingApi));
  }

  @override
  int get hashCode => Object.hash(runtimeType, streamingApi);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiInstanceUrlsCopyWith<_MastodonApiInstanceUrls> get copyWith =>
      __$MastodonApiInstanceUrlsCopyWithImpl<_MastodonApiInstanceUrls>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiInstanceUrlsToJson(this);
  }
}

abstract class _MastodonApiInstanceUrls implements MastodonApiInstanceUrls {
  const factory _MastodonApiInstanceUrls(
      {@JsonKey(name: 'streaming_api')
      @HiveField(0)
          required String? streamingApi}) = _$_MastodonApiInstanceUrls;

  factory _MastodonApiInstanceUrls.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiInstanceUrls.fromJson;

  @override
  @JsonKey(name: 'streaming_api')
  @HiveField(0)
  String? get streamingApi;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiInstanceUrlsCopyWith<_MastodonApiInstanceUrls> get copyWith =>
      throw _privateConstructorUsedError;
}
