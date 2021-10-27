// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_status_emoji_reaction_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiStatusEmojiReactionPleromaAdapter
    _$UnifediApiStatusEmojiReactionPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiStatusEmojiReactionPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiStatusEmojiReactionPleromaAdapterTearOff {
  const _$UnifediApiStatusEmojiReactionPleromaAdapterTearOff();

  _UnifediApiStatusEmojiReactionPleromaAdapter call(
      @HiveField(0) PleromaApiStatusEmojiReaction value) {
    return _UnifediApiStatusEmojiReactionPleromaAdapter(
      value,
    );
  }

  UnifediApiStatusEmojiReactionPleromaAdapter fromJson(
      Map<String, Object?> json) {
    return UnifediApiStatusEmojiReactionPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiStatusEmojiReactionPleromaAdapter =
    _$UnifediApiStatusEmojiReactionPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiStatusEmojiReactionPleromaAdapter {
  @HiveField(0)
  PleromaApiStatusEmojiReaction get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiStatusEmojiReactionPleromaAdapterCopyWith<
          UnifediApiStatusEmojiReactionPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiStatusEmojiReactionPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiStatusEmojiReactionPleromaAdapterCopyWith(
          UnifediApiStatusEmojiReactionPleromaAdapter value,
          $Res Function(UnifediApiStatusEmojiReactionPleromaAdapter) then) =
      _$UnifediApiStatusEmojiReactionPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiStatusEmojiReaction value});

  $PleromaApiStatusEmojiReactionCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiStatusEmojiReactionPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiStatusEmojiReactionPleromaAdapterCopyWith<$Res> {
  _$UnifediApiStatusEmojiReactionPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiStatusEmojiReactionPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiStatusEmojiReactionPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiStatusEmojiReaction,
    ));
  }

  @override
  $PleromaApiStatusEmojiReactionCopyWith<$Res> get value {
    return $PleromaApiStatusEmojiReactionCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiStatusEmojiReactionPleromaAdapterCopyWith<$Res>
    implements $UnifediApiStatusEmojiReactionPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiStatusEmojiReactionPleromaAdapterCopyWith(
          _UnifediApiStatusEmojiReactionPleromaAdapter value,
          $Res Function(_UnifediApiStatusEmojiReactionPleromaAdapter) then) =
      __$UnifediApiStatusEmojiReactionPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiStatusEmojiReaction value});

  @override
  $PleromaApiStatusEmojiReactionCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiStatusEmojiReactionPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiStatusEmojiReactionPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiStatusEmojiReactionPleromaAdapterCopyWith<$Res> {
  __$UnifediApiStatusEmojiReactionPleromaAdapterCopyWithImpl(
      _UnifediApiStatusEmojiReactionPleromaAdapter _value,
      $Res Function(_UnifediApiStatusEmojiReactionPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiStatusEmojiReactionPleromaAdapter));

  @override
  _UnifediApiStatusEmojiReactionPleromaAdapter get _value =>
      super._value as _UnifediApiStatusEmojiReactionPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiStatusEmojiReactionPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiStatusEmojiReaction,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiStatusEmojiReactionPleromaAdapter
    extends _UnifediApiStatusEmojiReactionPleromaAdapter {
  const _$_UnifediApiStatusEmojiReactionPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiStatusEmojiReactionPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiStatusEmojiReactionPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiStatusEmojiReaction value;

  @override
  String toString() {
    return 'UnifediApiStatusEmojiReactionPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiStatusEmojiReactionPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiStatusEmojiReactionPleromaAdapterCopyWith<
          _UnifediApiStatusEmojiReactionPleromaAdapter>
      get copyWith =>
          __$UnifediApiStatusEmojiReactionPleromaAdapterCopyWithImpl<
              _UnifediApiStatusEmojiReactionPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiStatusEmojiReactionPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiStatusEmojiReactionPleromaAdapter
    extends UnifediApiStatusEmojiReactionPleromaAdapter {
  const factory _UnifediApiStatusEmojiReactionPleromaAdapter(
          @HiveField(0) PleromaApiStatusEmojiReaction value) =
      _$_UnifediApiStatusEmojiReactionPleromaAdapter;
  const _UnifediApiStatusEmojiReactionPleromaAdapter._() : super._();

  factory _UnifediApiStatusEmojiReactionPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiStatusEmojiReactionPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiStatusEmojiReaction get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiStatusEmojiReactionPleromaAdapterCopyWith<
          _UnifediApiStatusEmojiReactionPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
