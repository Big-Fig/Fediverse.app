// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_custom_emoji_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiCustomEmojiPleromaAdapter
    _$UnifediApiCustomEmojiPleromaAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiCustomEmojiPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiCustomEmojiPleromaAdapterTearOff {
  const _$UnifediApiCustomEmojiPleromaAdapterTearOff();

  _UnifediApiCustomEmojiPleromaAdapter call(
      @HiveField(0) PleromaApiCustomEmoji value) {
    return _UnifediApiCustomEmojiPleromaAdapter(
      value,
    );
  }

  UnifediApiCustomEmojiPleromaAdapter fromJson(Map<String, Object> json) {
    return UnifediApiCustomEmojiPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiCustomEmojiPleromaAdapter =
    _$UnifediApiCustomEmojiPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiCustomEmojiPleromaAdapter {
  @HiveField(0)
  PleromaApiCustomEmoji get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiCustomEmojiPleromaAdapterCopyWith<
          UnifediApiCustomEmojiPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiCustomEmojiPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiCustomEmojiPleromaAdapterCopyWith(
          UnifediApiCustomEmojiPleromaAdapter value,
          $Res Function(UnifediApiCustomEmojiPleromaAdapter) then) =
      _$UnifediApiCustomEmojiPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiCustomEmoji value});

  $PleromaApiCustomEmojiCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiCustomEmojiPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiCustomEmojiPleromaAdapterCopyWith<$Res> {
  _$UnifediApiCustomEmojiPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiCustomEmojiPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiCustomEmojiPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiCustomEmoji,
    ));
  }

  @override
  $PleromaApiCustomEmojiCopyWith<$Res> get value {
    return $PleromaApiCustomEmojiCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiCustomEmojiPleromaAdapterCopyWith<$Res>
    implements $UnifediApiCustomEmojiPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiCustomEmojiPleromaAdapterCopyWith(
          _UnifediApiCustomEmojiPleromaAdapter value,
          $Res Function(_UnifediApiCustomEmojiPleromaAdapter) then) =
      __$UnifediApiCustomEmojiPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiCustomEmoji value});

  @override
  $PleromaApiCustomEmojiCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiCustomEmojiPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiCustomEmojiPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiCustomEmojiPleromaAdapterCopyWith<$Res> {
  __$UnifediApiCustomEmojiPleromaAdapterCopyWithImpl(
      _UnifediApiCustomEmojiPleromaAdapter _value,
      $Res Function(_UnifediApiCustomEmojiPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiCustomEmojiPleromaAdapter));

  @override
  _UnifediApiCustomEmojiPleromaAdapter get _value =>
      super._value as _UnifediApiCustomEmojiPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiCustomEmojiPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiCustomEmoji,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiCustomEmojiPleromaAdapter
    extends _UnifediApiCustomEmojiPleromaAdapter {
  const _$_UnifediApiCustomEmojiPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiCustomEmojiPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiCustomEmojiPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiCustomEmoji value;

  @override
  String toString() {
    return 'UnifediApiCustomEmojiPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiCustomEmojiPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiCustomEmojiPleromaAdapterCopyWith<
          _UnifediApiCustomEmojiPleromaAdapter>
      get copyWith => __$UnifediApiCustomEmojiPleromaAdapterCopyWithImpl<
          _UnifediApiCustomEmojiPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiCustomEmojiPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiCustomEmojiPleromaAdapter
    extends UnifediApiCustomEmojiPleromaAdapter {
  const factory _UnifediApiCustomEmojiPleromaAdapter(
          @HiveField(0) PleromaApiCustomEmoji value) =
      _$_UnifediApiCustomEmojiPleromaAdapter;
  const _UnifediApiCustomEmojiPleromaAdapter._() : super._();

  factory _UnifediApiCustomEmojiPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiCustomEmojiPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiCustomEmoji get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiCustomEmojiPleromaAdapterCopyWith<
          _UnifediApiCustomEmojiPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
