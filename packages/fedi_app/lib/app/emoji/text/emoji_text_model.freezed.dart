// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'emoji_text_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EmojiTextTearOff {
  const _$EmojiTextTearOff();

  _EmojiText call(
      {required String text, required List<IUnifediApiEmoji>? emojis}) {
    return _EmojiText(
      text: text,
      emojis: emojis,
    );
  }
}

/// @nodoc
const $EmojiText = _$EmojiTextTearOff();

/// @nodoc
mixin _$EmojiText {
  String get text => throw _privateConstructorUsedError;
  List<IUnifediApiEmoji>? get emojis => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmojiTextCopyWith<EmojiText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmojiTextCopyWith<$Res> {
  factory $EmojiTextCopyWith(EmojiText value, $Res Function(EmojiText) then) =
      _$EmojiTextCopyWithImpl<$Res>;
  $Res call({String text, List<IUnifediApiEmoji>? emojis});
}

/// @nodoc
class _$EmojiTextCopyWithImpl<$Res> implements $EmojiTextCopyWith<$Res> {
  _$EmojiTextCopyWithImpl(this._value, this._then);

  final EmojiText _value;
  // ignore: unused_field
  final $Res Function(EmojiText) _then;

  @override
  $Res call({
    Object? text = freezed,
    Object? emojis = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      emojis: emojis == freezed
          ? _value.emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as List<IUnifediApiEmoji>?,
    ));
  }
}

/// @nodoc
abstract class _$EmojiTextCopyWith<$Res> implements $EmojiTextCopyWith<$Res> {
  factory _$EmojiTextCopyWith(
          _EmojiText value, $Res Function(_EmojiText) then) =
      __$EmojiTextCopyWithImpl<$Res>;
  @override
  $Res call({String text, List<IUnifediApiEmoji>? emojis});
}

/// @nodoc
class __$EmojiTextCopyWithImpl<$Res> extends _$EmojiTextCopyWithImpl<$Res>
    implements _$EmojiTextCopyWith<$Res> {
  __$EmojiTextCopyWithImpl(_EmojiText _value, $Res Function(_EmojiText) _then)
      : super(_value, (v) => _then(v as _EmojiText));

  @override
  _EmojiText get _value => super._value as _EmojiText;

  @override
  $Res call({
    Object? text = freezed,
    Object? emojis = freezed,
  }) {
    return _then(_EmojiText(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      emojis: emojis == freezed
          ? _value.emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as List<IUnifediApiEmoji>?,
    ));
  }
}

/// @nodoc

class _$_EmojiText implements _EmojiText {
  const _$_EmojiText({required this.text, required this.emojis});

  @override
  final String text;
  @override
  final List<IUnifediApiEmoji>? emojis;

  @override
  String toString() {
    return 'EmojiText(text: $text, emojis: $emojis)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmojiText &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other.emojis, emojis));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, text, const DeepCollectionEquality().hash(emojis));

  @JsonKey(ignore: true)
  @override
  _$EmojiTextCopyWith<_EmojiText> get copyWith =>
      __$EmojiTextCopyWithImpl<_EmojiText>(this, _$identity);
}

abstract class _EmojiText implements EmojiText {
  const factory _EmojiText(
      {required String text,
      required List<IUnifediApiEmoji>? emojis}) = _$_EmojiText;

  @override
  String get text;
  @override
  List<IUnifediApiEmoji>? get emojis;
  @override
  @JsonKey(ignore: true)
  _$EmojiTextCopyWith<_EmojiText> get copyWith =>
      throw _privateConstructorUsedError;
}
