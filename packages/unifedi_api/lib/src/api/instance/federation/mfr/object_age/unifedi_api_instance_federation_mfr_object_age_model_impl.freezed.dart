// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_federation_mfr_object_age_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstanceFederationMfrObjectAge
    _$UnifediApiInstanceFederationMfrObjectAgeFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiInstanceFederationMfrObjectAge.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstanceFederationMfrObjectAgeTearOff {
  const _$UnifediApiInstanceFederationMfrObjectAgeTearOff();

  _UnifediApiInstanceFederationMfrObjectAge call(
      {@HiveField(0) required int? threshold,
      @HiveField(1) required List<String>? actions}) {
    return _UnifediApiInstanceFederationMfrObjectAge(
      threshold: threshold,
      actions: actions,
    );
  }

  UnifediApiInstanceFederationMfrObjectAge fromJson(Map<String, Object> json) {
    return UnifediApiInstanceFederationMfrObjectAge.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstanceFederationMfrObjectAge =
    _$UnifediApiInstanceFederationMfrObjectAgeTearOff();

/// @nodoc
mixin _$UnifediApiInstanceFederationMfrObjectAge {
  @HiveField(0)
  int? get threshold => throw _privateConstructorUsedError;
  @HiveField(1)
  List<String>? get actions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiInstanceFederationMfrObjectAgeCopyWith<
          UnifediApiInstanceFederationMfrObjectAge>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstanceFederationMfrObjectAgeCopyWith<$Res> {
  factory $UnifediApiInstanceFederationMfrObjectAgeCopyWith(
          UnifediApiInstanceFederationMfrObjectAge value,
          $Res Function(UnifediApiInstanceFederationMfrObjectAge) then) =
      _$UnifediApiInstanceFederationMfrObjectAgeCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int? threshold, @HiveField(1) List<String>? actions});
}

/// @nodoc
class _$UnifediApiInstanceFederationMfrObjectAgeCopyWithImpl<$Res>
    implements $UnifediApiInstanceFederationMfrObjectAgeCopyWith<$Res> {
  _$UnifediApiInstanceFederationMfrObjectAgeCopyWithImpl(
      this._value, this._then);

  final UnifediApiInstanceFederationMfrObjectAge _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstanceFederationMfrObjectAge) _then;

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
abstract class _$UnifediApiInstanceFederationMfrObjectAgeCopyWith<$Res>
    implements $UnifediApiInstanceFederationMfrObjectAgeCopyWith<$Res> {
  factory _$UnifediApiInstanceFederationMfrObjectAgeCopyWith(
          _UnifediApiInstanceFederationMfrObjectAge value,
          $Res Function(_UnifediApiInstanceFederationMfrObjectAge) then) =
      __$UnifediApiInstanceFederationMfrObjectAgeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int? threshold, @HiveField(1) List<String>? actions});
}

/// @nodoc
class __$UnifediApiInstanceFederationMfrObjectAgeCopyWithImpl<$Res>
    extends _$UnifediApiInstanceFederationMfrObjectAgeCopyWithImpl<$Res>
    implements _$UnifediApiInstanceFederationMfrObjectAgeCopyWith<$Res> {
  __$UnifediApiInstanceFederationMfrObjectAgeCopyWithImpl(
      _UnifediApiInstanceFederationMfrObjectAge _value,
      $Res Function(_UnifediApiInstanceFederationMfrObjectAge) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiInstanceFederationMfrObjectAge));

  @override
  _UnifediApiInstanceFederationMfrObjectAge get _value =>
      super._value as _UnifediApiInstanceFederationMfrObjectAge;

  @override
  $Res call({
    Object? threshold = freezed,
    Object? actions = freezed,
  }) {
    return _then(_UnifediApiInstanceFederationMfrObjectAge(
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
class _$_UnifediApiInstanceFederationMfrObjectAge
    implements _UnifediApiInstanceFederationMfrObjectAge {
  const _$_UnifediApiInstanceFederationMfrObjectAge(
      {@HiveField(0) required this.threshold,
      @HiveField(1) required this.actions});

  factory _$_UnifediApiInstanceFederationMfrObjectAge.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiInstanceFederationMfrObjectAgeFromJson(json);

  @override
  @HiveField(0)
  final int? threshold;
  @override
  @HiveField(1)
  final List<String>? actions;

  @override
  String toString() {
    return 'UnifediApiInstanceFederationMfrObjectAge(threshold: $threshold, actions: $actions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiInstanceFederationMfrObjectAge &&
            (identical(other.threshold, threshold) ||
                const DeepCollectionEquality()
                    .equals(other.threshold, threshold)) &&
            (identical(other.actions, actions) ||
                const DeepCollectionEquality().equals(other.actions, actions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(threshold) ^
      const DeepCollectionEquality().hash(actions);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstanceFederationMfrObjectAgeCopyWith<
          _UnifediApiInstanceFederationMfrObjectAge>
      get copyWith => __$UnifediApiInstanceFederationMfrObjectAgeCopyWithImpl<
          _UnifediApiInstanceFederationMfrObjectAge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstanceFederationMfrObjectAgeToJson(this);
  }
}

abstract class _UnifediApiInstanceFederationMfrObjectAge
    implements UnifediApiInstanceFederationMfrObjectAge {
  const factory _UnifediApiInstanceFederationMfrObjectAge(
          {@HiveField(0) required int? threshold,
          @HiveField(1) required List<String>? actions}) =
      _$_UnifediApiInstanceFederationMfrObjectAge;

  factory _UnifediApiInstanceFederationMfrObjectAge.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiInstanceFederationMfrObjectAge.fromJson;

  @override
  @HiveField(0)
  int? get threshold => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  List<String>? get actions => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstanceFederationMfrObjectAgeCopyWith<
          _UnifediApiInstanceFederationMfrObjectAge>
      get copyWith => throw _privateConstructorUsedError;
}
