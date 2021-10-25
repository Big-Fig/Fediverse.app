// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_urls_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstanceUrlsMastodonAdapter
    _$UnifediApiInstanceUrlsMastodonAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiInstanceUrlsMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstanceUrlsMastodonAdapterTearOff {
  const _$UnifediApiInstanceUrlsMastodonAdapterTearOff();

  _UnifediApiInstanceUrlsMastodonAdapter call(
      @HiveField(0) MastodonApiInstanceUrls value) {
    return _UnifediApiInstanceUrlsMastodonAdapter(
      value,
    );
  }

  UnifediApiInstanceUrlsMastodonAdapter fromJson(Map<String, Object> json) {
    return UnifediApiInstanceUrlsMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstanceUrlsMastodonAdapter =
    _$UnifediApiInstanceUrlsMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiInstanceUrlsMastodonAdapter {
  @HiveField(0)
  MastodonApiInstanceUrls get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiInstanceUrlsMastodonAdapterCopyWith<
          UnifediApiInstanceUrlsMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstanceUrlsMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiInstanceUrlsMastodonAdapterCopyWith(
          UnifediApiInstanceUrlsMastodonAdapter value,
          $Res Function(UnifediApiInstanceUrlsMastodonAdapter) then) =
      _$UnifediApiInstanceUrlsMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiInstanceUrls value});

  $MastodonApiInstanceUrlsCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiInstanceUrlsMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiInstanceUrlsMastodonAdapterCopyWith<$Res> {
  _$UnifediApiInstanceUrlsMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiInstanceUrlsMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstanceUrlsMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiInstanceUrls,
    ));
  }

  @override
  $MastodonApiInstanceUrlsCopyWith<$Res> get value {
    return $MastodonApiInstanceUrlsCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiInstanceUrlsMastodonAdapterCopyWith<$Res>
    implements $UnifediApiInstanceUrlsMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiInstanceUrlsMastodonAdapterCopyWith(
          _UnifediApiInstanceUrlsMastodonAdapter value,
          $Res Function(_UnifediApiInstanceUrlsMastodonAdapter) then) =
      __$UnifediApiInstanceUrlsMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiInstanceUrls value});

  @override
  $MastodonApiInstanceUrlsCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiInstanceUrlsMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiInstanceUrlsMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiInstanceUrlsMastodonAdapterCopyWith<$Res> {
  __$UnifediApiInstanceUrlsMastodonAdapterCopyWithImpl(
      _UnifediApiInstanceUrlsMastodonAdapter _value,
      $Res Function(_UnifediApiInstanceUrlsMastodonAdapter) _then)
      : super(
            _value, (v) => _then(v as _UnifediApiInstanceUrlsMastodonAdapter));

  @override
  _UnifediApiInstanceUrlsMastodonAdapter get _value =>
      super._value as _UnifediApiInstanceUrlsMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiInstanceUrlsMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiInstanceUrls,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiInstanceUrlsMastodonAdapter
    extends _UnifediApiInstanceUrlsMastodonAdapter {
  const _$_UnifediApiInstanceUrlsMastodonAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiInstanceUrlsMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiInstanceUrlsMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiInstanceUrls value;

  @override
  String toString() {
    return 'UnifediApiInstanceUrlsMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiInstanceUrlsMastodonAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstanceUrlsMastodonAdapterCopyWith<
          _UnifediApiInstanceUrlsMastodonAdapter>
      get copyWith => __$UnifediApiInstanceUrlsMastodonAdapterCopyWithImpl<
          _UnifediApiInstanceUrlsMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstanceUrlsMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiInstanceUrlsMastodonAdapter
    extends UnifediApiInstanceUrlsMastodonAdapter {
  const factory _UnifediApiInstanceUrlsMastodonAdapter(
          @HiveField(0) MastodonApiInstanceUrls value) =
      _$_UnifediApiInstanceUrlsMastodonAdapter;
  const _UnifediApiInstanceUrlsMastodonAdapter._() : super._();

  factory _UnifediApiInstanceUrlsMastodonAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiInstanceUrlsMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiInstanceUrls get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstanceUrlsMastodonAdapterCopyWith<
          _UnifediApiInstanceUrlsMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
