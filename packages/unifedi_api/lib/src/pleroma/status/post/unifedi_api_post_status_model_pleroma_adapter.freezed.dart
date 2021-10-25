// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_post_status_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPostStatusPleromaAdapter _$UnifediApiPostStatusPleromaAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiPostStatusPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiPostStatusPleromaAdapterTearOff {
  const _$UnifediApiPostStatusPleromaAdapterTearOff();

  _UnifediApiPostStatusPleromaAdapter call(
      @HiveField(0) PleromaApiPostStatus value) {
    return _UnifediApiPostStatusPleromaAdapter(
      value,
    );
  }

  UnifediApiPostStatusPleromaAdapter fromJson(Map<String, Object> json) {
    return UnifediApiPostStatusPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPostStatusPleromaAdapter =
    _$UnifediApiPostStatusPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiPostStatusPleromaAdapter {
  @HiveField(0)
  PleromaApiPostStatus get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPostStatusPleromaAdapterCopyWith<
          UnifediApiPostStatusPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPostStatusPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiPostStatusPleromaAdapterCopyWith(
          UnifediApiPostStatusPleromaAdapter value,
          $Res Function(UnifediApiPostStatusPleromaAdapter) then) =
      _$UnifediApiPostStatusPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiPostStatus value});

  $PleromaApiPostStatusCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiPostStatusPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiPostStatusPleromaAdapterCopyWith<$Res> {
  _$UnifediApiPostStatusPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiPostStatusPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPostStatusPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiPostStatus,
    ));
  }

  @override
  $PleromaApiPostStatusCopyWith<$Res> get value {
    return $PleromaApiPostStatusCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiPostStatusPleromaAdapterCopyWith<$Res>
    implements $UnifediApiPostStatusPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiPostStatusPleromaAdapterCopyWith(
          _UnifediApiPostStatusPleromaAdapter value,
          $Res Function(_UnifediApiPostStatusPleromaAdapter) then) =
      __$UnifediApiPostStatusPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiPostStatus value});

  @override
  $PleromaApiPostStatusCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiPostStatusPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiPostStatusPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiPostStatusPleromaAdapterCopyWith<$Res> {
  __$UnifediApiPostStatusPleromaAdapterCopyWithImpl(
      _UnifediApiPostStatusPleromaAdapter _value,
      $Res Function(_UnifediApiPostStatusPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiPostStatusPleromaAdapter));

  @override
  _UnifediApiPostStatusPleromaAdapter get _value =>
      super._value as _UnifediApiPostStatusPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiPostStatusPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiPostStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPostStatusPleromaAdapter
    extends _UnifediApiPostStatusPleromaAdapter {
  const _$_UnifediApiPostStatusPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiPostStatusPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiPostStatusPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiPostStatus value;

  @override
  String toString() {
    return 'UnifediApiPostStatusPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiPostStatusPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPostStatusPleromaAdapterCopyWith<
          _UnifediApiPostStatusPleromaAdapter>
      get copyWith => __$UnifediApiPostStatusPleromaAdapterCopyWithImpl<
          _UnifediApiPostStatusPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPostStatusPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiPostStatusPleromaAdapter
    extends UnifediApiPostStatusPleromaAdapter {
  const factory _UnifediApiPostStatusPleromaAdapter(
          @HiveField(0) PleromaApiPostStatus value) =
      _$_UnifediApiPostStatusPleromaAdapter;
  const _UnifediApiPostStatusPleromaAdapter._() : super._();

  factory _UnifediApiPostStatusPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiPostStatusPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiPostStatus get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPostStatusPleromaAdapterCopyWith<
          _UnifediApiPostStatusPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
