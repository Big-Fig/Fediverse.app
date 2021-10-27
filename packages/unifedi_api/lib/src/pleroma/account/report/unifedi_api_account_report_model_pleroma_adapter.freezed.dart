// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_account_report_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccountReportPleromaAdapter
    _$UnifediApiAccountReportPleromaAdapterFromJson(Map<String, dynamic> json) {
  return _UnifediApiAccountReportPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccountReportPleromaAdapterTearOff {
  const _$UnifediApiAccountReportPleromaAdapterTearOff();

  _UnifediApiAccountReportPleromaAdapter call(
      @HiveField(0) PleromaApiAccountReport value) {
    return _UnifediApiAccountReportPleromaAdapter(
      value,
    );
  }

  UnifediApiAccountReportPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiAccountReportPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccountReportPleromaAdapter =
    _$UnifediApiAccountReportPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiAccountReportPleromaAdapter {
  @HiveField(0)
  PleromaApiAccountReport get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccountReportPleromaAdapterCopyWith<
          UnifediApiAccountReportPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccountReportPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiAccountReportPleromaAdapterCopyWith(
          UnifediApiAccountReportPleromaAdapter value,
          $Res Function(UnifediApiAccountReportPleromaAdapter) then) =
      _$UnifediApiAccountReportPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiAccountReport value});

  $PleromaApiAccountReportCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiAccountReportPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiAccountReportPleromaAdapterCopyWith<$Res> {
  _$UnifediApiAccountReportPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiAccountReportPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccountReportPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccountReport,
    ));
  }

  @override
  $PleromaApiAccountReportCopyWith<$Res> get value {
    return $PleromaApiAccountReportCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccountReportPleromaAdapterCopyWith<$Res>
    implements $UnifediApiAccountReportPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiAccountReportPleromaAdapterCopyWith(
          _UnifediApiAccountReportPleromaAdapter value,
          $Res Function(_UnifediApiAccountReportPleromaAdapter) then) =
      __$UnifediApiAccountReportPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiAccountReport value});

  @override
  $PleromaApiAccountReportCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiAccountReportPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiAccountReportPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiAccountReportPleromaAdapterCopyWith<$Res> {
  __$UnifediApiAccountReportPleromaAdapterCopyWithImpl(
      _UnifediApiAccountReportPleromaAdapter _value,
      $Res Function(_UnifediApiAccountReportPleromaAdapter) _then)
      : super(
            _value, (v) => _then(v as _UnifediApiAccountReportPleromaAdapter));

  @override
  _UnifediApiAccountReportPleromaAdapter get _value =>
      super._value as _UnifediApiAccountReportPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiAccountReportPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccountReport,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccountReportPleromaAdapter
    extends _UnifediApiAccountReportPleromaAdapter {
  const _$_UnifediApiAccountReportPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiAccountReportPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiAccountReportPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiAccountReport value;

  @override
  String toString() {
    return 'UnifediApiAccountReportPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiAccountReportPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccountReportPleromaAdapterCopyWith<
          _UnifediApiAccountReportPleromaAdapter>
      get copyWith => __$UnifediApiAccountReportPleromaAdapterCopyWithImpl<
          _UnifediApiAccountReportPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccountReportPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiAccountReportPleromaAdapter
    extends UnifediApiAccountReportPleromaAdapter {
  const factory _UnifediApiAccountReportPleromaAdapter(
          @HiveField(0) PleromaApiAccountReport value) =
      _$_UnifediApiAccountReportPleromaAdapter;
  const _UnifediApiAccountReportPleromaAdapter._() : super._();

  factory _UnifediApiAccountReportPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiAccountReportPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiAccountReport get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccountReportPleromaAdapterCopyWith<
          _UnifediApiAccountReportPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
