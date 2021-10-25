// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_activity_item_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiInstanceActivityItemPleromaAdapter
    _$UnifediApiInstanceActivityItemPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiInstanceActivityItemPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiInstanceActivityItemPleromaAdapterTearOff {
  const _$UnifediApiInstanceActivityItemPleromaAdapterTearOff();

  _UnifediApiInstanceActivityItemPleromaAdapter call(
      @HiveField(0) PleromaApiInstanceActivityItem value) {
    return _UnifediApiInstanceActivityItemPleromaAdapter(
      value,
    );
  }

  UnifediApiInstanceActivityItemPleromaAdapter fromJson(
      Map<String, Object> json) {
    return UnifediApiInstanceActivityItemPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiInstanceActivityItemPleromaAdapter =
    _$UnifediApiInstanceActivityItemPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiInstanceActivityItemPleromaAdapter {
  @HiveField(0)
  PleromaApiInstanceActivityItem get value =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiInstanceActivityItemPleromaAdapterCopyWith<
          UnifediApiInstanceActivityItemPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstanceActivityItemPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiInstanceActivityItemPleromaAdapterCopyWith(
          UnifediApiInstanceActivityItemPleromaAdapter value,
          $Res Function(UnifediApiInstanceActivityItemPleromaAdapter) then) =
      _$UnifediApiInstanceActivityItemPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiInstanceActivityItem value});

  $PleromaApiInstanceActivityItemCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiInstanceActivityItemPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiInstanceActivityItemPleromaAdapterCopyWith<$Res> {
  _$UnifediApiInstanceActivityItemPleromaAdapterCopyWithImpl(
      this._value, this._then);

  final UnifediApiInstanceActivityItemPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstanceActivityItemPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstanceActivityItem,
    ));
  }

  @override
  $PleromaApiInstanceActivityItemCopyWith<$Res> get value {
    return $PleromaApiInstanceActivityItemCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiInstanceActivityItemPleromaAdapterCopyWith<$Res>
    implements $UnifediApiInstanceActivityItemPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiInstanceActivityItemPleromaAdapterCopyWith(
          _UnifediApiInstanceActivityItemPleromaAdapter value,
          $Res Function(_UnifediApiInstanceActivityItemPleromaAdapter) then) =
      __$UnifediApiInstanceActivityItemPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiInstanceActivityItem value});

  @override
  $PleromaApiInstanceActivityItemCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiInstanceActivityItemPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiInstanceActivityItemPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiInstanceActivityItemPleromaAdapterCopyWith<$Res> {
  __$UnifediApiInstanceActivityItemPleromaAdapterCopyWithImpl(
      _UnifediApiInstanceActivityItemPleromaAdapter _value,
      $Res Function(_UnifediApiInstanceActivityItemPleromaAdapter) _then)
      : super(_value,
            (v) => _then(v as _UnifediApiInstanceActivityItemPleromaAdapter));

  @override
  _UnifediApiInstanceActivityItemPleromaAdapter get _value =>
      super._value as _UnifediApiInstanceActivityItemPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiInstanceActivityItemPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiInstanceActivityItem,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiInstanceActivityItemPleromaAdapter
    extends _UnifediApiInstanceActivityItemPleromaAdapter {
  const _$_UnifediApiInstanceActivityItemPleromaAdapter(
      @HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiInstanceActivityItemPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiInstanceActivityItemPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiInstanceActivityItem value;

  @override
  String toString() {
    return 'UnifediApiInstanceActivityItemPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiInstanceActivityItemPleromaAdapter &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiInstanceActivityItemPleromaAdapterCopyWith<
          _UnifediApiInstanceActivityItemPleromaAdapter>
      get copyWith =>
          __$UnifediApiInstanceActivityItemPleromaAdapterCopyWithImpl<
              _UnifediApiInstanceActivityItemPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiInstanceActivityItemPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiInstanceActivityItemPleromaAdapter
    extends UnifediApiInstanceActivityItemPleromaAdapter {
  const factory _UnifediApiInstanceActivityItemPleromaAdapter(
          @HiveField(0) PleromaApiInstanceActivityItem value) =
      _$_UnifediApiInstanceActivityItemPleromaAdapter;
  const _UnifediApiInstanceActivityItemPleromaAdapter._() : super._();

  factory _UnifediApiInstanceActivityItemPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiInstanceActivityItemPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiInstanceActivityItem get value =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiInstanceActivityItemPleromaAdapterCopyWith<
          _UnifediApiInstanceActivityItemPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
