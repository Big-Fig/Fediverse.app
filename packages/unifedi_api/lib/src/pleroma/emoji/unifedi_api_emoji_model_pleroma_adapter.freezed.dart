// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_emoji_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiEmojiPleromaAdapter _$UnifediApiEmojiPleromaAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiEmojiPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiEmojiPleromaAdapterTearOff {
  const _$UnifediApiEmojiPleromaAdapterTearOff();

  _UnifediApiEmojiPleromaAdapter call(@HiveField(0) PleromaApiEmoji value) {
    return _UnifediApiEmojiPleromaAdapter(
      value,
    );
  }

  UnifediApiEmojiPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiEmojiPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiEmojiPleromaAdapter = _$UnifediApiEmojiPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiEmojiPleromaAdapter {
  @HiveField(0)
  PleromaApiEmoji get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiEmojiPleromaAdapterCopyWith<UnifediApiEmojiPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiEmojiPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiEmojiPleromaAdapterCopyWith(
          UnifediApiEmojiPleromaAdapter value,
          $Res Function(UnifediApiEmojiPleromaAdapter) then) =
      _$UnifediApiEmojiPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiEmoji value});

  $PleromaApiEmojiCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiEmojiPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiEmojiPleromaAdapterCopyWith<$Res> {
  _$UnifediApiEmojiPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiEmojiPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiEmojiPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiEmoji,
    ));
  }

  @override
  $PleromaApiEmojiCopyWith<$Res> get value {
    return $PleromaApiEmojiCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiEmojiPleromaAdapterCopyWith<$Res>
    implements $UnifediApiEmojiPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiEmojiPleromaAdapterCopyWith(
          _UnifediApiEmojiPleromaAdapter value,
          $Res Function(_UnifediApiEmojiPleromaAdapter) then) =
      __$UnifediApiEmojiPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiEmoji value});

  @override
  $PleromaApiEmojiCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiEmojiPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiEmojiPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiEmojiPleromaAdapterCopyWith<$Res> {
  __$UnifediApiEmojiPleromaAdapterCopyWithImpl(
      _UnifediApiEmojiPleromaAdapter _value,
      $Res Function(_UnifediApiEmojiPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiEmojiPleromaAdapter));

  @override
  _UnifediApiEmojiPleromaAdapter get _value =>
      super._value as _UnifediApiEmojiPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiEmojiPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiEmoji,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiEmojiPleromaAdapter extends _UnifediApiEmojiPleromaAdapter {
  const _$_UnifediApiEmojiPleromaAdapter(@HiveField(0) this.value) : super._();

  factory _$_UnifediApiEmojiPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiEmojiPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiEmoji value;

  @override
  String toString() {
    return 'UnifediApiEmojiPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiEmojiPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiEmojiPleromaAdapterCopyWith<_UnifediApiEmojiPleromaAdapter>
      get copyWith => __$UnifediApiEmojiPleromaAdapterCopyWithImpl<
          _UnifediApiEmojiPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiEmojiPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiEmojiPleromaAdapter
    extends UnifediApiEmojiPleromaAdapter {
  const factory _UnifediApiEmojiPleromaAdapter(
      @HiveField(0) PleromaApiEmoji value) = _$_UnifediApiEmojiPleromaAdapter;
  const _UnifediApiEmojiPleromaAdapter._() : super._();

  factory _UnifediApiEmojiPleromaAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiEmojiPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiEmoji get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiEmojiPleromaAdapterCopyWith<_UnifediApiEmojiPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
