// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fediverse_api_requirement_exception_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FediverseApiRequirementExceptionTearOff {
  const _$FediverseApiRequirementExceptionTearOff();

  _FediverseApiRequirementException call(
      {required FediverseApiFeatureRequirementState state}) {
    return _FediverseApiRequirementException(
      state: state,
    );
  }
}

/// @nodoc
const $FediverseApiRequirementException =
    _$FediverseApiRequirementExceptionTearOff();

/// @nodoc
mixin _$FediverseApiRequirementException {
  FediverseApiFeatureRequirementState get state =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FediverseApiRequirementExceptionCopyWith<FediverseApiRequirementException>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FediverseApiRequirementExceptionCopyWith<$Res> {
  factory $FediverseApiRequirementExceptionCopyWith(
          FediverseApiRequirementException value,
          $Res Function(FediverseApiRequirementException) then) =
      _$FediverseApiRequirementExceptionCopyWithImpl<$Res>;
  $Res call({FediverseApiFeatureRequirementState state});

  $FediverseApiFeatureRequirementStateCopyWith<$Res> get state;
}

/// @nodoc
class _$FediverseApiRequirementExceptionCopyWithImpl<$Res>
    implements $FediverseApiRequirementExceptionCopyWith<$Res> {
  _$FediverseApiRequirementExceptionCopyWithImpl(this._value, this._then);

  final FediverseApiRequirementException _value;
  // ignore: unused_field
  final $Res Function(FediverseApiRequirementException) _then;

  @override
  $Res call({
    Object? state = freezed,
  }) {
    return _then(_value.copyWith(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as FediverseApiFeatureRequirementState,
    ));
  }

  @override
  $FediverseApiFeatureRequirementStateCopyWith<$Res> get state {
    return $FediverseApiFeatureRequirementStateCopyWith<$Res>(_value.state,
        (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc
abstract class _$FediverseApiRequirementExceptionCopyWith<$Res>
    implements $FediverseApiRequirementExceptionCopyWith<$Res> {
  factory _$FediverseApiRequirementExceptionCopyWith(
          _FediverseApiRequirementException value,
          $Res Function(_FediverseApiRequirementException) then) =
      __$FediverseApiRequirementExceptionCopyWithImpl<$Res>;
  @override
  $Res call({FediverseApiFeatureRequirementState state});

  @override
  $FediverseApiFeatureRequirementStateCopyWith<$Res> get state;
}

/// @nodoc
class __$FediverseApiRequirementExceptionCopyWithImpl<$Res>
    extends _$FediverseApiRequirementExceptionCopyWithImpl<$Res>
    implements _$FediverseApiRequirementExceptionCopyWith<$Res> {
  __$FediverseApiRequirementExceptionCopyWithImpl(
      _FediverseApiRequirementException _value,
      $Res Function(_FediverseApiRequirementException) _then)
      : super(_value, (v) => _then(v as _FediverseApiRequirementException));

  @override
  _FediverseApiRequirementException get _value =>
      super._value as _FediverseApiRequirementException;

  @override
  $Res call({
    Object? state = freezed,
  }) {
    return _then(_FediverseApiRequirementException(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as FediverseApiFeatureRequirementState,
    ));
  }
}

/// @nodoc

class _$_FediverseApiRequirementException
    implements _FediverseApiRequirementException {
  const _$_FediverseApiRequirementException({required this.state});

  @override
  final FediverseApiFeatureRequirementState state;

  @override
  String toString() {
    return 'FediverseApiRequirementException(state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FediverseApiRequirementException &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(state);

  @JsonKey(ignore: true)
  @override
  _$FediverseApiRequirementExceptionCopyWith<_FediverseApiRequirementException>
      get copyWith => __$FediverseApiRequirementExceptionCopyWithImpl<
          _FediverseApiRequirementException>(this, _$identity);
}

abstract class _FediverseApiRequirementException
    implements FediverseApiRequirementException {
  const factory _FediverseApiRequirementException(
          {required FediverseApiFeatureRequirementState state}) =
      _$_FediverseApiRequirementException;

  @override
  FediverseApiFeatureRequirementState get state =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FediverseApiRequirementExceptionCopyWith<_FediverseApiRequirementException>
      get copyWith => throw _privateConstructorUsedError;
}
