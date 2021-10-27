// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_type_not_supported_requirement_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiTypeNotSupportedRequirement
    _$UnifediApiTypeNotSupportedRequirementFromJson(Map<String, dynamic> json) {
  return _UnifediApiTypeNotSupportedRequirement.fromJson(json);
}

/// @nodoc
class _$UnifediApiTypeNotSupportedRequirementTearOff {
  const _$UnifediApiTypeNotSupportedRequirementTearOff();

  _UnifediApiTypeNotSupportedRequirement call({required String target}) {
    return _UnifediApiTypeNotSupportedRequirement(
      target: target,
    );
  }

  UnifediApiTypeNotSupportedRequirement fromJson(Map<String, Object?> json) {
    return UnifediApiTypeNotSupportedRequirement.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiTypeNotSupportedRequirement =
    _$UnifediApiTypeNotSupportedRequirementTearOff();

/// @nodoc
mixin _$UnifediApiTypeNotSupportedRequirement {
  String get target => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiTypeNotSupportedRequirementCopyWith<
          UnifediApiTypeNotSupportedRequirement>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiTypeNotSupportedRequirementCopyWith<$Res> {
  factory $UnifediApiTypeNotSupportedRequirementCopyWith(
          UnifediApiTypeNotSupportedRequirement value,
          $Res Function(UnifediApiTypeNotSupportedRequirement) then) =
      _$UnifediApiTypeNotSupportedRequirementCopyWithImpl<$Res>;
  $Res call({String target});
}

/// @nodoc
class _$UnifediApiTypeNotSupportedRequirementCopyWithImpl<$Res>
    implements $UnifediApiTypeNotSupportedRequirementCopyWith<$Res> {
  _$UnifediApiTypeNotSupportedRequirementCopyWithImpl(this._value, this._then);

  final UnifediApiTypeNotSupportedRequirement _value;
  // ignore: unused_field
  final $Res Function(UnifediApiTypeNotSupportedRequirement) _then;

  @override
  $Res call({
    Object? target = freezed,
  }) {
    return _then(_value.copyWith(
      target: target == freezed
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiTypeNotSupportedRequirementCopyWith<$Res>
    implements $UnifediApiTypeNotSupportedRequirementCopyWith<$Res> {
  factory _$UnifediApiTypeNotSupportedRequirementCopyWith(
          _UnifediApiTypeNotSupportedRequirement value,
          $Res Function(_UnifediApiTypeNotSupportedRequirement) then) =
      __$UnifediApiTypeNotSupportedRequirementCopyWithImpl<$Res>;
  @override
  $Res call({String target});
}

/// @nodoc
class __$UnifediApiTypeNotSupportedRequirementCopyWithImpl<$Res>
    extends _$UnifediApiTypeNotSupportedRequirementCopyWithImpl<$Res>
    implements _$UnifediApiTypeNotSupportedRequirementCopyWith<$Res> {
  __$UnifediApiTypeNotSupportedRequirementCopyWithImpl(
      _UnifediApiTypeNotSupportedRequirement _value,
      $Res Function(_UnifediApiTypeNotSupportedRequirement) _then)
      : super(
            _value, (v) => _then(v as _UnifediApiTypeNotSupportedRequirement));

  @override
  _UnifediApiTypeNotSupportedRequirement get _value =>
      super._value as _UnifediApiTypeNotSupportedRequirement;

  @override
  $Res call({
    Object? target = freezed,
  }) {
    return _then(_UnifediApiTypeNotSupportedRequirement(
      target: target == freezed
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiTypeNotSupportedRequirement
    implements _UnifediApiTypeNotSupportedRequirement {
  const _$_UnifediApiTypeNotSupportedRequirement({required this.target});

  factory _$_UnifediApiTypeNotSupportedRequirement.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiTypeNotSupportedRequirementFromJson(json);

  @override
  final String target;

  @override
  String toString() {
    return 'UnifediApiTypeNotSupportedRequirement(target: $target)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiTypeNotSupportedRequirement &&
            (identical(other.target, target) || other.target == target));
  }

  @override
  int get hashCode => Object.hash(runtimeType, target);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiTypeNotSupportedRequirementCopyWith<
          _UnifediApiTypeNotSupportedRequirement>
      get copyWith => __$UnifediApiTypeNotSupportedRequirementCopyWithImpl<
          _UnifediApiTypeNotSupportedRequirement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiTypeNotSupportedRequirementToJson(this);
  }
}

abstract class _UnifediApiTypeNotSupportedRequirement
    implements UnifediApiTypeNotSupportedRequirement {
  const factory _UnifediApiTypeNotSupportedRequirement(
      {required String target}) = _$_UnifediApiTypeNotSupportedRequirement;

  factory _UnifediApiTypeNotSupportedRequirement.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiTypeNotSupportedRequirement.fromJson;

  @override
  String get target;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiTypeNotSupportedRequirementCopyWith<
          _UnifediApiTypeNotSupportedRequirement>
      get copyWith => throw _privateConstructorUsedError;
}
