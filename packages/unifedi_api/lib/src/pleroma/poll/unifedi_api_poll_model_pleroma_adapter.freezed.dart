// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_poll_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPollPleromaAdapter _$UnifediApiPollPleromaAdapterFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiPollPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiPollPleromaAdapterTearOff {
  const _$UnifediApiPollPleromaAdapterTearOff();

  _UnifediApiPollPleromaAdapter call(@HiveField(0) PleromaApiPoll value) {
    return _UnifediApiPollPleromaAdapter(
      value,
    );
  }

  UnifediApiPollPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiPollPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPollPleromaAdapter = _$UnifediApiPollPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiPollPleromaAdapter {
  @HiveField(0)
  PleromaApiPoll get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPollPleromaAdapterCopyWith<UnifediApiPollPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPollPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiPollPleromaAdapterCopyWith(
          UnifediApiPollPleromaAdapter value,
          $Res Function(UnifediApiPollPleromaAdapter) then) =
      _$UnifediApiPollPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiPoll value});

  $PleromaApiPollCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiPollPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiPollPleromaAdapterCopyWith<$Res> {
  _$UnifediApiPollPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiPollPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPollPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiPoll,
    ));
  }

  @override
  $PleromaApiPollCopyWith<$Res> get value {
    return $PleromaApiPollCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiPollPleromaAdapterCopyWith<$Res>
    implements $UnifediApiPollPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiPollPleromaAdapterCopyWith(
          _UnifediApiPollPleromaAdapter value,
          $Res Function(_UnifediApiPollPleromaAdapter) then) =
      __$UnifediApiPollPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiPoll value});

  @override
  $PleromaApiPollCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiPollPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiPollPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiPollPleromaAdapterCopyWith<$Res> {
  __$UnifediApiPollPleromaAdapterCopyWithImpl(
      _UnifediApiPollPleromaAdapter _value,
      $Res Function(_UnifediApiPollPleromaAdapter) _then)
      : super(_value, (v) => _then(v as _UnifediApiPollPleromaAdapter));

  @override
  _UnifediApiPollPleromaAdapter get _value =>
      super._value as _UnifediApiPollPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiPollPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiPoll,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPollPleromaAdapter extends _UnifediApiPollPleromaAdapter {
  const _$_UnifediApiPollPleromaAdapter(@HiveField(0) this.value) : super._();

  factory _$_UnifediApiPollPleromaAdapter.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiPollPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiPoll value;

  @override
  String toString() {
    return 'UnifediApiPollPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiPollPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPollPleromaAdapterCopyWith<_UnifediApiPollPleromaAdapter>
      get copyWith => __$UnifediApiPollPleromaAdapterCopyWithImpl<
          _UnifediApiPollPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPollPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiPollPleromaAdapter
    extends UnifediApiPollPleromaAdapter {
  const factory _UnifediApiPollPleromaAdapter(
      @HiveField(0) PleromaApiPoll value) = _$_UnifediApiPollPleromaAdapter;
  const _UnifediApiPollPleromaAdapter._() : super._();

  factory _UnifediApiPollPleromaAdapter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiPollPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiPoll get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPollPleromaAdapterCopyWith<_UnifediApiPollPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
