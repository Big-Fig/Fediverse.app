// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_featured_tags_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiFeaturedTagPleromaAdapter
    _$UnifediApiFeaturedTagPleromaAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiFeaturedTagPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiFeaturedTagPleromaAdapterTearOff {
  const _$UnifediApiFeaturedTagPleromaAdapterTearOff();

  _UnifediApiFeaturedTagPleromaAdapter call(
      @HiveField(0) PleromaApiFeaturedTag value) {
    return _UnifediApiFeaturedTagPleromaAdapter(
      value,
    );
  }

  UnifediApiFeaturedTagPleromaAdapter fromJson(Map<String, Object> json) {
    return UnifediApiFeaturedTagPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiFeaturedTagPleromaAdapter =
    _$UnifediApiFeaturedTagPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiFeaturedTagPleromaAdapter {
  @HiveField(0)
  PleromaApiFeaturedTag get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiFeaturedTagPleromaAdapterCopyWith<
          UnifediApiFeaturedTagPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiFeaturedTagPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiFeaturedTagPleromaAdapterCopyWith(
          UnifediApiFeaturedTagPleromaAdapter value,
          $Res Function(UnifediApiFeaturedTagPleromaAdapter) then) =
      _$UnifediApiFeaturedTagPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiFeaturedTag value});

  $PleromaApiFeaturedTagCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiFeaturedTagPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiFeaturedTagPleromaAdapterCopyWith<$Res> {
  _$UnifediApiFeaturedTagPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiFeaturedTagPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiFeaturedTagPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiFeaturedTag,
    ));
  }

  @override
  $PleromaApiFeaturedTagCopyWith<$Res> get value {
    return $PleromaApiFeaturedTagCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiFeaturedTagPleromaAdapterCopyWith<$Res>
    implements $UnifediApiFeaturedTagPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiFeaturedTagPleromaAdapterCopyWith(
          _UnifediApiFeaturedTagPleromaAdapter value,
          $Res Function(_UnifediApiFeaturedTagPleromaAdapter) then) =
      __$UnifediApiFeaturedTagPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiFeaturedTag value});

  @override
  $PleromaApiFeaturedTagCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiFeaturedTagPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiFeaturedTagPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiFeaturedTagPleromaAdapterCopyWith<$Res> {
  __$UnifediApiFeaturedTagPleromaAdapterCopyWithImpl(
      _UnifediApiFeaturedTagPleromaAdapter _value,
      $Res Function(_UnifediApiFeaturedTagPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiFeaturedTagPleromaAdapter));

  @override
  _UnifediApiFeaturedTagPleromaAdapter get _value =>
      super._value as _UnifediApiFeaturedTagPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiFeaturedTagPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiFeaturedTag,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiFeaturedTagPleromaAdapter
    extends _UnifediApiFeaturedTagPleromaAdapter {
  const _$_UnifediApiFeaturedTagPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiFeaturedTagPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiFeaturedTagPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiFeaturedTag value;

  @override
  String toString() {
    return 'UnifediApiFeaturedTagPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiFeaturedTagPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiFeaturedTagPleromaAdapterCopyWith<
          _UnifediApiFeaturedTagPleromaAdapter>
      get copyWith => __$UnifediApiFeaturedTagPleromaAdapterCopyWithImpl<
          _UnifediApiFeaturedTagPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiFeaturedTagPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiFeaturedTagPleromaAdapter
    extends UnifediApiFeaturedTagPleromaAdapter {
  const factory _UnifediApiFeaturedTagPleromaAdapter(
          @HiveField(0) PleromaApiFeaturedTag value) =
      _$_UnifediApiFeaturedTagPleromaAdapter;
  const _UnifediApiFeaturedTagPleromaAdapter._() : super._();

  factory _UnifediApiFeaturedTagPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiFeaturedTagPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiFeaturedTag get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiFeaturedTagPleromaAdapterCopyWith<
          _UnifediApiFeaturedTagPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
