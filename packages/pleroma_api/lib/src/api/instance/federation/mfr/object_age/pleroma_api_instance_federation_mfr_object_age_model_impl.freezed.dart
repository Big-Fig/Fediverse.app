// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_instance_federation_mfr_object_age_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiInstanceFederationMfrObjectAge
    _$PleromaApiInstanceFederationMfrObjectAgeFromJson(
        Map<String, dynamic> json) {
  return _PleromaApiInstanceFederationMfrObjectAge.fromJson(json);
}

/// @nodoc
class _$PleromaApiInstanceFederationMfrObjectAgeTearOff {
  const _$PleromaApiInstanceFederationMfrObjectAgeTearOff();

  _PleromaApiInstanceFederationMfrObjectAge call(
      {@HiveField(0) required int? threshold,
      @HiveField(1) required List<String>? actions}) {
    return _PleromaApiInstanceFederationMfrObjectAge(
      threshold: threshold,
      actions: actions,
    );
  }

  PleromaApiInstanceFederationMfrObjectAge fromJson(Map<String, Object?> json) {
    return PleromaApiInstanceFederationMfrObjectAge.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiInstanceFederationMfrObjectAge =
    _$PleromaApiInstanceFederationMfrObjectAgeTearOff();

/// @nodoc
mixin _$PleromaApiInstanceFederationMfrObjectAge {
  @HiveField(0)
  int? get threshold => throw _privateConstructorUsedError;
  @HiveField(1)
  List<String>? get actions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiInstanceFederationMfrObjectAgeCopyWith<
          PleromaApiInstanceFederationMfrObjectAge>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiInstanceFederationMfrObjectAgeCopyWith<$Res> {
  factory $PleromaApiInstanceFederationMfrObjectAgeCopyWith(
          PleromaApiInstanceFederationMfrObjectAge value,
          $Res Function(PleromaApiInstanceFederationMfrObjectAge) then) =
      _$PleromaApiInstanceFederationMfrObjectAgeCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int? threshold, @HiveField(1) List<String>? actions});
}

/// @nodoc
class _$PleromaApiInstanceFederationMfrObjectAgeCopyWithImpl<$Res>
    implements $PleromaApiInstanceFederationMfrObjectAgeCopyWith<$Res> {
  _$PleromaApiInstanceFederationMfrObjectAgeCopyWithImpl(
      this._value, this._then);

  final PleromaApiInstanceFederationMfrObjectAge _value;
  // ignore: unused_field
  final $Res Function(PleromaApiInstanceFederationMfrObjectAge) _then;

  @override
  $Res call({
    Object? threshold = freezed,
    Object? actions = freezed,
  }) {
    return _then(_value.copyWith(
      threshold: threshold == freezed
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as int?,
      actions: actions == freezed
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiInstanceFederationMfrObjectAgeCopyWith<$Res>
    implements $PleromaApiInstanceFederationMfrObjectAgeCopyWith<$Res> {
  factory _$PleromaApiInstanceFederationMfrObjectAgeCopyWith(
          _PleromaApiInstanceFederationMfrObjectAge value,
          $Res Function(_PleromaApiInstanceFederationMfrObjectAge) then) =
      __$PleromaApiInstanceFederationMfrObjectAgeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int? threshold, @HiveField(1) List<String>? actions});
}

/// @nodoc
class __$PleromaApiInstanceFederationMfrObjectAgeCopyWithImpl<$Res>
    extends _$PleromaApiInstanceFederationMfrObjectAgeCopyWithImpl<$Res>
    implements _$PleromaApiInstanceFederationMfrObjectAgeCopyWith<$Res> {
  __$PleromaApiInstanceFederationMfrObjectAgeCopyWithImpl(
      _PleromaApiInstanceFederationMfrObjectAge _value,
      $Res Function(_PleromaApiInstanceFederationMfrObjectAge) _then)
      : super(_value,
            (v) => _then(v as _PleromaApiInstanceFederationMfrObjectAge));

  @override
  _PleromaApiInstanceFederationMfrObjectAge get _value =>
      super._value as _PleromaApiInstanceFederationMfrObjectAge;

  @override
  $Res call({
    Object? threshold = freezed,
    Object? actions = freezed,
  }) {
    return _then(_PleromaApiInstanceFederationMfrObjectAge(
      threshold: threshold == freezed
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as int?,
      actions: actions == freezed
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiInstanceFederationMfrObjectAge
    implements _PleromaApiInstanceFederationMfrObjectAge {
  const _$_PleromaApiInstanceFederationMfrObjectAge(
      {@HiveField(0) required this.threshold,
      @HiveField(1) required this.actions});

  factory _$_PleromaApiInstanceFederationMfrObjectAge.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiInstanceFederationMfrObjectAgeFromJson(json);

  @override
  @HiveField(0)
  final int? threshold;
  @override
  @HiveField(1)
  final List<String>? actions;

  @override
  String toString() {
    return 'PleromaApiInstanceFederationMfrObjectAge(threshold: $threshold, actions: $actions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiInstanceFederationMfrObjectAge &&
            (identical(other.threshold, threshold) ||
                other.threshold == threshold) &&
            const DeepCollectionEquality().equals(other.actions, actions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, threshold, const DeepCollectionEquality().hash(actions));

  @JsonKey(ignore: true)
  @override
  _$PleromaApiInstanceFederationMfrObjectAgeCopyWith<
          _PleromaApiInstanceFederationMfrObjectAge>
      get copyWith => __$PleromaApiInstanceFederationMfrObjectAgeCopyWithImpl<
          _PleromaApiInstanceFederationMfrObjectAge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiInstanceFederationMfrObjectAgeToJson(this);
  }
}

abstract class _PleromaApiInstanceFederationMfrObjectAge
    implements PleromaApiInstanceFederationMfrObjectAge {
  const factory _PleromaApiInstanceFederationMfrObjectAge(
          {@HiveField(0) required int? threshold,
          @HiveField(1) required List<String>? actions}) =
      _$_PleromaApiInstanceFederationMfrObjectAge;

  factory _PleromaApiInstanceFederationMfrObjectAge.fromJson(
          Map<String, dynamic> json) =
      _$_PleromaApiInstanceFederationMfrObjectAge.fromJson;

  @override
  @HiveField(0)
  int? get threshold;
  @override
  @HiveField(1)
  List<String>? get actions;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiInstanceFederationMfrObjectAgeCopyWith<
          _PleromaApiInstanceFederationMfrObjectAge>
      get copyWith => throw _privateConstructorUsedError;
}
