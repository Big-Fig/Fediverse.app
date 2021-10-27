// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_urls_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstanceUrlsPleromaAdapter
    _$UnifediApiInstanceUrlsPleromaAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiInstanceUrlsPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstanceUrlsPleromaAdapterTearOff {
  const _$UnifediApiInstanceUrlsPleromaAdapterTearOff();

  _UnifediApiInstanceUrlsPleromaAdapter call(
      @HiveField(0) PleromaApiInstanceUrls value) {
    return _UnifediApiInstanceUrlsPleromaAdapter(
      value,
    );
  }

  UnifediApiInstanceUrlsPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiInstanceUrlsPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstanceUrlsPleromaAdapter =
    _$UnifediApiInstanceUrlsPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiInstanceUrlsPleromaAdapter {
  @HiveField(0)
  PleromaApiInstanceUrls get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiInstanceUrlsPleromaAdapterCopyWith<
          UnifediApiInstanceUrlsPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstanceUrlsPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiInstanceUrlsPleromaAdapterCopyWith(
          UnifediApiInstanceUrlsPleromaAdapter value,
          $Res Function(UnifediApiInstanceUrlsPleromaAdapter) then) =
      _$UnifediApiInstanceUrlsPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiInstanceUrls value});

  $PleromaApiInstanceUrlsCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiInstanceUrlsPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiInstanceUrlsPleromaAdapterCopyWith<$Res> {
  _$UnifediApiInstanceUrlsPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiInstanceUrlsPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstanceUrlsPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstanceUrls,
    ));
  }

  @override
  $PleromaApiInstanceUrlsCopyWith<$Res> get value {
    return $PleromaApiInstanceUrlsCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiInstanceUrlsPleromaAdapterCopyWith<$Res>
    implements $UnifediApiInstanceUrlsPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiInstanceUrlsPleromaAdapterCopyWith(
          _UnifediApiInstanceUrlsPleromaAdapter value,
          $Res Function(_UnifediApiInstanceUrlsPleromaAdapter) then) =
      __$UnifediApiInstanceUrlsPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiInstanceUrls value});

  @override
  $PleromaApiInstanceUrlsCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiInstanceUrlsPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiInstanceUrlsPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiInstanceUrlsPleromaAdapterCopyWith<$Res> {
  __$UnifediApiInstanceUrlsPleromaAdapterCopyWithImpl(
      _UnifediApiInstanceUrlsPleromaAdapter _value,
      $Res Function(_UnifediApiInstanceUrlsPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiInstanceUrlsPleromaAdapter));

  @override
  _UnifediApiInstanceUrlsPleromaAdapter get _value =>
      super._value as _UnifediApiInstanceUrlsPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiInstanceUrlsPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstanceUrls,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiInstanceUrlsPleromaAdapter
    extends _UnifediApiInstanceUrlsPleromaAdapter {
  const _$_UnifediApiInstanceUrlsPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiInstanceUrlsPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiInstanceUrlsPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiInstanceUrls value;

  @override
  String toString() {
    return 'UnifediApiInstanceUrlsPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiInstanceUrlsPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstanceUrlsPleromaAdapterCopyWith<
          _UnifediApiInstanceUrlsPleromaAdapter>
      get copyWith => __$UnifediApiInstanceUrlsPleromaAdapterCopyWithImpl<
          _UnifediApiInstanceUrlsPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstanceUrlsPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiInstanceUrlsPleromaAdapter
    extends UnifediApiInstanceUrlsPleromaAdapter {
  const factory _UnifediApiInstanceUrlsPleromaAdapter(
          @HiveField(0) PleromaApiInstanceUrls value) =
      _$_UnifediApiInstanceUrlsPleromaAdapter;
  const _UnifediApiInstanceUrlsPleromaAdapter._() : super._();

  factory _UnifediApiInstanceUrlsPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiInstanceUrlsPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiInstanceUrls get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstanceUrlsPleromaAdapterCopyWith<
          _UnifediApiInstanceUrlsPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
