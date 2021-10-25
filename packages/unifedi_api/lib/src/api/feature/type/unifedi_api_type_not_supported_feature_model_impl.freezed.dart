// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_type_not_supported_feature_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiTypeNotSupportedFeature _$UnifediApiTypeNotSupportedFeatureFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiTypeNotSupportedFeature.fromJson(json);
}

/// @nodoc
class _$UnifediApiTypeNotSupportedFeatureTearOff {
  const _$UnifediApiTypeNotSupportedFeatureTearOff();

  _UnifediApiTypeNotSupportedFeature call({required String target}) {
    return _UnifediApiTypeNotSupportedFeature(
      target: target,
    );
  }

  UnifediApiTypeNotSupportedFeature fromJson(Map<String, Object> json) {
    return UnifediApiTypeNotSupportedFeature.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiTypeNotSupportedFeature =
    _$UnifediApiTypeNotSupportedFeatureTearOff();

/// @nodoc
mixin _$UnifediApiTypeNotSupportedFeature {
  String get target => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiTypeNotSupportedFeatureCopyWith<UnifediApiTypeNotSupportedFeature>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiTypeNotSupportedFeatureCopyWith<$Res> {
  factory $UnifediApiTypeNotSupportedFeatureCopyWith(
          UnifediApiTypeNotSupportedFeature value,
          $Res Function(UnifediApiTypeNotSupportedFeature) then) =
      _$UnifediApiTypeNotSupportedFeatureCopyWithImpl<$Res>;
  $Res call({String target});
}

/// @nodoc
class _$UnifediApiTypeNotSupportedFeatureCopyWithImpl<$Res>
    implements $UnifediApiTypeNotSupportedFeatureCopyWith<$Res> {
  _$UnifediApiTypeNotSupportedFeatureCopyWithImpl(this._value, this._then);

  final UnifediApiTypeNotSupportedFeature _value;
  // ignore: unused_field
  final $Res Function(UnifediApiTypeNotSupportedFeature) _then;

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
abstract class _$UnifediApiTypeNotSupportedFeatureCopyWith<$Res>
    implements $UnifediApiTypeNotSupportedFeatureCopyWith<$Res> {
  factory _$UnifediApiTypeNotSupportedFeatureCopyWith(
          _UnifediApiTypeNotSupportedFeature value,
          $Res Function(_UnifediApiTypeNotSupportedFeature) then) =
      __$UnifediApiTypeNotSupportedFeatureCopyWithImpl<$Res>;
  @override
  $Res call({String target});
}

/// @nodoc
class __$UnifediApiTypeNotSupportedFeatureCopyWithImpl<$Res>
    extends _$UnifediApiTypeNotSupportedFeatureCopyWithImpl<$Res>
    implements _$UnifediApiTypeNotSupportedFeatureCopyWith<$Res> {
  __$UnifediApiTypeNotSupportedFeatureCopyWithImpl(
      _UnifediApiTypeNotSupportedFeature _value,
      $Res Function(_UnifediApiTypeNotSupportedFeature) _then)
      : super(_value, (v) => _then(v as _UnifediApiTypeNotSupportedFeature));

  @override
  _UnifediApiTypeNotSupportedFeature get _value =>
      super._value as _UnifediApiTypeNotSupportedFeature;

  @override
  $Res call({
    Object? target = freezed,
  }) {
    return _then(_UnifediApiTypeNotSupportedFeature(
      target: target == freezed
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiTypeNotSupportedFeature
    extends _UnifediApiTypeNotSupportedFeature {
  const _$_UnifediApiTypeNotSupportedFeature({required this.target})
      : super._();

  factory _$_UnifediApiTypeNotSupportedFeature.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiTypeNotSupportedFeatureFromJson(json);

  @override
  final String target;

  @override
  String toString() {
    return 'UnifediApiTypeNotSupportedFeature(target: $target)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiTypeNotSupportedFeature &&
            (identical(other.target, target) ||
                const DeepCollectionEquality().equals(other.target, target)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(target);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiTypeNotSupportedFeatureCopyWith<
          _UnifediApiTypeNotSupportedFeature>
      get copyWith => __$UnifediApiTypeNotSupportedFeatureCopyWithImpl<
          _UnifediApiTypeNotSupportedFeature>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiTypeNotSupportedFeatureToJson(this);
  }
}

abstract class _UnifediApiTypeNotSupportedFeature
    extends UnifediApiTypeNotSupportedFeature {
  const factory _UnifediApiTypeNotSupportedFeature({required String target}) =
      _$_UnifediApiTypeNotSupportedFeature;
  const _UnifediApiTypeNotSupportedFeature._() : super._();

  factory _UnifediApiTypeNotSupportedFeature.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiTypeNotSupportedFeature.fromJson;

  @override
  String get target => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiTypeNotSupportedFeatureCopyWith<
          _UnifediApiTypeNotSupportedFeature>
      get copyWith => throw _privateConstructorUsedError;
}
