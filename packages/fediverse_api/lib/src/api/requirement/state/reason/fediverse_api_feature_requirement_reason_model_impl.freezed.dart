// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fediverse_api_feature_requirement_reason_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FediverseApiFeatureRequirementReasonTearOff {
  const _$FediverseApiFeatureRequirementReasonTearOff();

  _FediverseApiRequirementReason call(
      {required String name, required String description}) {
    return _FediverseApiRequirementReason(
      name: name,
      description: description,
    );
  }
}

/// @nodoc
const $FediverseApiFeatureRequirementReason =
    _$FediverseApiFeatureRequirementReasonTearOff();

/// @nodoc
mixin _$FediverseApiFeatureRequirementReason {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FediverseApiFeatureRequirementReasonCopyWith<
          FediverseApiFeatureRequirementReason>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FediverseApiFeatureRequirementReasonCopyWith<$Res> {
  factory $FediverseApiFeatureRequirementReasonCopyWith(
          FediverseApiFeatureRequirementReason value,
          $Res Function(FediverseApiFeatureRequirementReason) then) =
      _$FediverseApiFeatureRequirementReasonCopyWithImpl<$Res>;
  $Res call({String name, String description});
}

/// @nodoc
class _$FediverseApiFeatureRequirementReasonCopyWithImpl<$Res>
    implements $FediverseApiFeatureRequirementReasonCopyWith<$Res> {
  _$FediverseApiFeatureRequirementReasonCopyWithImpl(this._value, this._then);

  final FediverseApiFeatureRequirementReason _value;
  // ignore: unused_field
  final $Res Function(FediverseApiFeatureRequirementReason) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FediverseApiRequirementReasonCopyWith<$Res>
    implements $FediverseApiFeatureRequirementReasonCopyWith<$Res> {
  factory _$FediverseApiRequirementReasonCopyWith(
          _FediverseApiRequirementReason value,
          $Res Function(_FediverseApiRequirementReason) then) =
      __$FediverseApiRequirementReasonCopyWithImpl<$Res>;
  @override
  $Res call({String name, String description});
}

/// @nodoc
class __$FediverseApiRequirementReasonCopyWithImpl<$Res>
    extends _$FediverseApiFeatureRequirementReasonCopyWithImpl<$Res>
    implements _$FediverseApiRequirementReasonCopyWith<$Res> {
  __$FediverseApiRequirementReasonCopyWithImpl(
      _FediverseApiRequirementReason _value,
      $Res Function(_FediverseApiRequirementReason) _then)
      : super(_value, (v) => _then(v as _FediverseApiRequirementReason));

  @override
  _FediverseApiRequirementReason get _value =>
      super._value as _FediverseApiRequirementReason;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_FediverseApiRequirementReason(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FediverseApiRequirementReason
    implements _FediverseApiRequirementReason {
  const _$_FediverseApiRequirementReason(
      {required this.name, required this.description});

  @override
  final String name;
  @override
  final String description;

  @override
  String toString() {
    return 'FediverseApiFeatureRequirementReason(name: $name, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FediverseApiRequirementReason &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description);

  @JsonKey(ignore: true)
  @override
  _$FediverseApiRequirementReasonCopyWith<_FediverseApiRequirementReason>
      get copyWith => __$FediverseApiRequirementReasonCopyWithImpl<
          _FediverseApiRequirementReason>(this, _$identity);
}

abstract class _FediverseApiRequirementReason
    implements FediverseApiFeatureRequirementReason {
  const factory _FediverseApiRequirementReason(
      {required String name,
      required String description}) = _$_FediverseApiRequirementReason;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FediverseApiRequirementReasonCopyWith<_FediverseApiRequirementReason>
      get copyWith => throw _privateConstructorUsedError;
}
