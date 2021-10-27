// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'status_emoji_reaction_model_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StatusEmojiReactionAdapterTearOff {
  const _$StatusEmojiReactionAdapterTearOff();

  _StatusEmojiReactionAdapter call(
      {required IUnifediApiEmojiReaction unifediApiEmojiReaction}) {
    return _StatusEmojiReactionAdapter(
      unifediApiEmojiReaction: unifediApiEmojiReaction,
    );
  }
}

/// @nodoc
const $StatusEmojiReactionAdapter = _$StatusEmojiReactionAdapterTearOff();

/// @nodoc
mixin _$StatusEmojiReactionAdapter {
  IUnifediApiEmojiReaction get unifediApiEmojiReaction =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatusEmojiReactionAdapterCopyWith<StatusEmojiReactionAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusEmojiReactionAdapterCopyWith<$Res> {
  factory $StatusEmojiReactionAdapterCopyWith(StatusEmojiReactionAdapter value,
          $Res Function(StatusEmojiReactionAdapter) then) =
      _$StatusEmojiReactionAdapterCopyWithImpl<$Res>;
  $Res call({IUnifediApiEmojiReaction unifediApiEmojiReaction});
}

/// @nodoc
class _$StatusEmojiReactionAdapterCopyWithImpl<$Res>
    implements $StatusEmojiReactionAdapterCopyWith<$Res> {
  _$StatusEmojiReactionAdapterCopyWithImpl(this._value, this._then);

  final StatusEmojiReactionAdapter _value;
  // ignore: unused_field
  final $Res Function(StatusEmojiReactionAdapter) _then;

  @override
  $Res call({
    Object? unifediApiEmojiReaction = freezed,
  }) {
    return _then(_value.copyWith(
      unifediApiEmojiReaction: unifediApiEmojiReaction == freezed
          ? _value.unifediApiEmojiReaction
          : unifediApiEmojiReaction // ignore: cast_nullable_to_non_nullable
              as IUnifediApiEmojiReaction,
    ));
  }
}

/// @nodoc
abstract class _$StatusEmojiReactionAdapterCopyWith<$Res>
    implements $StatusEmojiReactionAdapterCopyWith<$Res> {
  factory _$StatusEmojiReactionAdapterCopyWith(
          _StatusEmojiReactionAdapter value,
          $Res Function(_StatusEmojiReactionAdapter) then) =
      __$StatusEmojiReactionAdapterCopyWithImpl<$Res>;
  @override
  $Res call({IUnifediApiEmojiReaction unifediApiEmojiReaction});
}

/// @nodoc
class __$StatusEmojiReactionAdapterCopyWithImpl<$Res>
    extends _$StatusEmojiReactionAdapterCopyWithImpl<$Res>
    implements _$StatusEmojiReactionAdapterCopyWith<$Res> {
  __$StatusEmojiReactionAdapterCopyWithImpl(_StatusEmojiReactionAdapter _value,
      $Res Function(_StatusEmojiReactionAdapter) _then)
      : super(_value, (v) => _then(v as _StatusEmojiReactionAdapter));

  @override
  _StatusEmojiReactionAdapter get _value =>
      super._value as _StatusEmojiReactionAdapter;

  @override
  $Res call({
    Object? unifediApiEmojiReaction = freezed,
  }) {
    return _then(_StatusEmojiReactionAdapter(
      unifediApiEmojiReaction: unifediApiEmojiReaction == freezed
          ? _value.unifediApiEmojiReaction
          : unifediApiEmojiReaction // ignore: cast_nullable_to_non_nullable
              as IUnifediApiEmojiReaction,
    ));
  }
}

/// @nodoc

class _$_StatusEmojiReactionAdapter extends _StatusEmojiReactionAdapter {
  const _$_StatusEmojiReactionAdapter({required this.unifediApiEmojiReaction})
      : super._();

  @override
  final IUnifediApiEmojiReaction unifediApiEmojiReaction;

  @override
  String toString() {
    return 'StatusEmojiReactionAdapter(unifediApiEmojiReaction: $unifediApiEmojiReaction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StatusEmojiReactionAdapter &&
            (identical(
                    other.unifediApiEmojiReaction, unifediApiEmojiReaction) ||
                other.unifediApiEmojiReaction == unifediApiEmojiReaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, unifediApiEmojiReaction);

  @JsonKey(ignore: true)
  @override
  _$StatusEmojiReactionAdapterCopyWith<_StatusEmojiReactionAdapter>
      get copyWith => __$StatusEmojiReactionAdapterCopyWithImpl<
          _StatusEmojiReactionAdapter>(this, _$identity);
}

abstract class _StatusEmojiReactionAdapter extends StatusEmojiReactionAdapter {
  const factory _StatusEmojiReactionAdapter(
          {required IUnifediApiEmojiReaction unifediApiEmojiReaction}) =
      _$_StatusEmojiReactionAdapter;
  const _StatusEmojiReactionAdapter._() : super._();

  @override
  IUnifediApiEmojiReaction get unifediApiEmojiReaction;
  @override
  @JsonKey(ignore: true)
  _$StatusEmojiReactionAdapterCopyWith<_StatusEmojiReactionAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
