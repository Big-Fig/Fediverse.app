// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'status_sensitive_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StatusSensitiveWarningStateTearOff {
  const _$StatusSensitiveWarningStateTearOff();

  _StatusSensitiveWarningState call(
      {required bool nsfwSensitive,
      required bool containsSpoiler,
      required bool displayEnabled}) {
    return _StatusSensitiveWarningState(
      nsfwSensitive: nsfwSensitive,
      containsSpoiler: containsSpoiler,
      displayEnabled: displayEnabled,
    );
  }
}

/// @nodoc
const $StatusSensitiveWarningState = _$StatusSensitiveWarningStateTearOff();

/// @nodoc
mixin _$StatusSensitiveWarningState {
  bool get nsfwSensitive => throw _privateConstructorUsedError;
  bool get containsSpoiler => throw _privateConstructorUsedError;
  bool get displayEnabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatusSensitiveWarningStateCopyWith<StatusSensitiveWarningState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusSensitiveWarningStateCopyWith<$Res> {
  factory $StatusSensitiveWarningStateCopyWith(
          StatusSensitiveWarningState value,
          $Res Function(StatusSensitiveWarningState) then) =
      _$StatusSensitiveWarningStateCopyWithImpl<$Res>;
  $Res call({bool nsfwSensitive, bool containsSpoiler, bool displayEnabled});
}

/// @nodoc
class _$StatusSensitiveWarningStateCopyWithImpl<$Res>
    implements $StatusSensitiveWarningStateCopyWith<$Res> {
  _$StatusSensitiveWarningStateCopyWithImpl(this._value, this._then);

  final StatusSensitiveWarningState _value;
  // ignore: unused_field
  final $Res Function(StatusSensitiveWarningState) _then;

  @override
  $Res call({
    Object? nsfwSensitive = freezed,
    Object? containsSpoiler = freezed,
    Object? displayEnabled = freezed,
  }) {
    return _then(_value.copyWith(
      nsfwSensitive: nsfwSensitive == freezed
          ? _value.nsfwSensitive
          : nsfwSensitive // ignore: cast_nullable_to_non_nullable
              as bool,
      containsSpoiler: containsSpoiler == freezed
          ? _value.containsSpoiler
          : containsSpoiler // ignore: cast_nullable_to_non_nullable
              as bool,
      displayEnabled: displayEnabled == freezed
          ? _value.displayEnabled
          : displayEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$StatusSensitiveWarningStateCopyWith<$Res>
    implements $StatusSensitiveWarningStateCopyWith<$Res> {
  factory _$StatusSensitiveWarningStateCopyWith(
          _StatusSensitiveWarningState value,
          $Res Function(_StatusSensitiveWarningState) then) =
      __$StatusSensitiveWarningStateCopyWithImpl<$Res>;
  @override
  $Res call({bool nsfwSensitive, bool containsSpoiler, bool displayEnabled});
}

/// @nodoc
class __$StatusSensitiveWarningStateCopyWithImpl<$Res>
    extends _$StatusSensitiveWarningStateCopyWithImpl<$Res>
    implements _$StatusSensitiveWarningStateCopyWith<$Res> {
  __$StatusSensitiveWarningStateCopyWithImpl(
      _StatusSensitiveWarningState _value,
      $Res Function(_StatusSensitiveWarningState) _then)
      : super(_value, (v) => _then(v as _StatusSensitiveWarningState));

  @override
  _StatusSensitiveWarningState get _value =>
      super._value as _StatusSensitiveWarningState;

  @override
  $Res call({
    Object? nsfwSensitive = freezed,
    Object? containsSpoiler = freezed,
    Object? displayEnabled = freezed,
  }) {
    return _then(_StatusSensitiveWarningState(
      nsfwSensitive: nsfwSensitive == freezed
          ? _value.nsfwSensitive
          : nsfwSensitive // ignore: cast_nullable_to_non_nullable
              as bool,
      containsSpoiler: containsSpoiler == freezed
          ? _value.containsSpoiler
          : containsSpoiler // ignore: cast_nullable_to_non_nullable
              as bool,
      displayEnabled: displayEnabled == freezed
          ? _value.displayEnabled
          : displayEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_StatusSensitiveWarningState extends _StatusSensitiveWarningState {
  const _$_StatusSensitiveWarningState(
      {required this.nsfwSensitive,
      required this.containsSpoiler,
      required this.displayEnabled})
      : super._();

  @override
  final bool nsfwSensitive;
  @override
  final bool containsSpoiler;
  @override
  final bool displayEnabled;

  @override
  String toString() {
    return 'StatusSensitiveWarningState(nsfwSensitive: $nsfwSensitive, containsSpoiler: $containsSpoiler, displayEnabled: $displayEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StatusSensitiveWarningState &&
            (identical(other.nsfwSensitive, nsfwSensitive) ||
                other.nsfwSensitive == nsfwSensitive) &&
            (identical(other.containsSpoiler, containsSpoiler) ||
                other.containsSpoiler == containsSpoiler) &&
            (identical(other.displayEnabled, displayEnabled) ||
                other.displayEnabled == displayEnabled));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, nsfwSensitive, containsSpoiler, displayEnabled);

  @JsonKey(ignore: true)
  @override
  _$StatusSensitiveWarningStateCopyWith<_StatusSensitiveWarningState>
      get copyWith => __$StatusSensitiveWarningStateCopyWithImpl<
          _StatusSensitiveWarningState>(this, _$identity);
}

abstract class _StatusSensitiveWarningState
    extends StatusSensitiveWarningState {
  const factory _StatusSensitiveWarningState(
      {required bool nsfwSensitive,
      required bool containsSpoiler,
      required bool displayEnabled}) = _$_StatusSensitiveWarningState;
  const _StatusSensitiveWarningState._() : super._();

  @override
  bool get nsfwSensitive;
  @override
  bool get containsSpoiler;
  @override
  bool get displayEnabled;
  @override
  @JsonKey(ignore: true)
  _$StatusSensitiveWarningStateCopyWith<_StatusSensitiveWarningState>
      get copyWith => throw _privateConstructorUsedError;
}
