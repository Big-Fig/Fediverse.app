// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_emoji_model_mastodon_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiEmojiMastodonAdapter _$UnifediApiEmojiMastodonAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiEmojiMastodonAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiEmojiMastodonAdapterTearOff {
  const _$UnifediApiEmojiMastodonAdapterTearOff();

  _UnifediApiEmojiMastodonAdapter call(@HiveField(0) MastodonApiEmoji value) {
    return _UnifediApiEmojiMastodonAdapter(
      value,
    );
  }

  UnifediApiEmojiMastodonAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiEmojiMastodonAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiEmojiMastodonAdapter =
    _$UnifediApiEmojiMastodonAdapterTearOff();

/// @nodoc
mixin _$UnifediApiEmojiMastodonAdapter {
  @HiveField(0)
  MastodonApiEmoji get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiEmojiMastodonAdapterCopyWith<UnifediApiEmojiMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiEmojiMastodonAdapterCopyWith<$Res> {
  factory $UnifediApiEmojiMastodonAdapterCopyWith(
          UnifediApiEmojiMastodonAdapter value,
          $Res Function(UnifediApiEmojiMastodonAdapter) then) =
      _$UnifediApiEmojiMastodonAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) MastodonApiEmoji value});

  $MastodonApiEmojiCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiEmojiMastodonAdapterCopyWithImpl<$Res>
    implements $UnifediApiEmojiMastodonAdapterCopyWith<$Res> {
  _$UnifediApiEmojiMastodonAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiEmojiMastodonAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiEmojiMastodonAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiEmoji,
    ));
  }

  @override
  $MastodonApiEmojiCopyWith<$Res> get value {
    return $MastodonApiEmojiCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiEmojiMastodonAdapterCopyWith<$Res>
    implements $UnifediApiEmojiMastodonAdapterCopyWith<$Res> {
  factory _$UnifediApiEmojiMastodonAdapterCopyWith(
          _UnifediApiEmojiMastodonAdapter value,
          $Res Function(_UnifediApiEmojiMastodonAdapter) then) =
      __$UnifediApiEmojiMastodonAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) MastodonApiEmoji value});

  @override
  $MastodonApiEmojiCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiEmojiMastodonAdapterCopyWithImpl<$Res>
    extends _$UnifediApiEmojiMastodonAdapterCopyWithImpl<$Res>
    implements _$UnifediApiEmojiMastodonAdapterCopyWith<$Res> {
  __$UnifediApiEmojiMastodonAdapterCopyWithImpl(
      _UnifediApiEmojiMastodonAdapter _value,
      $Res Function(_UnifediApiEmojiMastodonAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiEmojiMastodonAdapter));

  @override
  _UnifediApiEmojiMastodonAdapter get _value =>
      super._value as _UnifediApiEmojiMastodonAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiEmojiMastodonAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as MastodonApiEmoji,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiEmojiMastodonAdapter
    extends _UnifediApiEmojiMastodonAdapter {
  const _$_UnifediApiEmojiMastodonAdapter(@HiveField(0) this.value) : super._();

  factory _$_UnifediApiEmojiMastodonAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiEmojiMastodonAdapterFromJson(json);

  @override
  @HiveField(0)
  final MastodonApiEmoji value;

  @override
  String toString() {
    return 'UnifediApiEmojiMastodonAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiEmojiMastodonAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiEmojiMastodonAdapterCopyWith<_UnifediApiEmojiMastodonAdapter>
      get copyWith => __$UnifediApiEmojiMastodonAdapterCopyWithImpl<
          _UnifediApiEmojiMastodonAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiEmojiMastodonAdapterToJson(this);
  }
}

abstract class _UnifediApiEmojiMastodonAdapter
    extends UnifediApiEmojiMastodonAdapter {
  const factory _UnifediApiEmojiMastodonAdapter(
      @HiveField(0) MastodonApiEmoji value) = _$_UnifediApiEmojiMastodonAdapter;
  const _UnifediApiEmojiMastodonAdapter._() : super._();

  factory _UnifediApiEmojiMastodonAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiEmojiMastodonAdapter.fromJson;

  @override
  @HiveField(0)
  MastodonApiEmoji get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiEmojiMastodonAdapterCopyWith<_UnifediApiEmojiMastodonAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
