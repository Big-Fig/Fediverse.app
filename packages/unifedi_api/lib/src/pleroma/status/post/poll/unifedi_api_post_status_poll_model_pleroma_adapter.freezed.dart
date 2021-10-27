// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_post_status_poll_model_pleroma_adapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPostStatusPollPleromaAdapter
    _$UnifediApiPostStatusPollPleromaAdapterFromJson(
        Map<String, dynamic> json) {
  return _UnifediApiPostStatusPollPleromaAdapter.fromJson(json);
}

/// @nodoc
class _$UnifediApiPostStatusPollPleromaAdapterTearOff {
  const _$UnifediApiPostStatusPollPleromaAdapterTearOff();

  _UnifediApiPostStatusPollPleromaAdapter call(
      @HiveField(0) PleromaApiPostStatusPoll value) {
    return _UnifediApiPostStatusPollPleromaAdapter(
      value,
    );
  }

  UnifediApiPostStatusPollPleromaAdapter fromJson(Map<String, Object?> json) {
    return UnifediApiPostStatusPollPleromaAdapter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPostStatusPollPleromaAdapter =
    _$UnifediApiPostStatusPollPleromaAdapterTearOff();

/// @nodoc
mixin _$UnifediApiPostStatusPollPleromaAdapter {
  @HiveField(0)
  PleromaApiPostStatusPoll get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPostStatusPollPleromaAdapterCopyWith<
          UnifediApiPostStatusPollPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPostStatusPollPleromaAdapterCopyWith<$Res> {
  factory $UnifediApiPostStatusPollPleromaAdapterCopyWith(
          UnifediApiPostStatusPollPleromaAdapter value,
          $Res Function(UnifediApiPostStatusPollPleromaAdapter) then) =
      _$UnifediApiPostStatusPollPleromaAdapterCopyWithImpl<$Res>;
  $Res call({@HiveField(0) PleromaApiPostStatusPoll value});

  $PleromaApiPostStatusPollCopyWith<$Res> get value;
}

/// @nodoc
class _$UnifediApiPostStatusPollPleromaAdapterCopyWithImpl<$Res>
    implements $UnifediApiPostStatusPollPleromaAdapterCopyWith<$Res> {
  _$UnifediApiPostStatusPollPleromaAdapterCopyWithImpl(this._value, this._then);

  final UnifediApiPostStatusPollPleromaAdapter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPostStatusPollPleromaAdapter) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiPostStatusPoll,
    ));
  }

  @override
  $PleromaApiPostStatusPollCopyWith<$Res> get value {
    return $PleromaApiPostStatusPollCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiPostStatusPollPleromaAdapterCopyWith<$Res>
    implements $UnifediApiPostStatusPollPleromaAdapterCopyWith<$Res> {
  factory _$UnifediApiPostStatusPollPleromaAdapterCopyWith(
          _UnifediApiPostStatusPollPleromaAdapter value,
          $Res Function(_UnifediApiPostStatusPollPleromaAdapter) then) =
      __$UnifediApiPostStatusPollPleromaAdapterCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) PleromaApiPostStatusPoll value});

  @override
  $PleromaApiPostStatusPollCopyWith<$Res> get value;
}

/// @nodoc
class __$UnifediApiPostStatusPollPleromaAdapterCopyWithImpl<$Res>
    extends _$UnifediApiPostStatusPollPleromaAdapterCopyWithImpl<$Res>
    implements _$UnifediApiPostStatusPollPleromaAdapterCopyWith<$Res> {
  __$UnifediApiPostStatusPollPleromaAdapterCopyWithImpl(
      _UnifediApiPostStatusPollPleromaAdapter _value,
      $Res Function(_UnifediApiPostStatusPollPleromaAdapter) _then)
      : super(
            _value, (v) => _then(v as _UnifediApiPostStatusPollPleromaAdapter));

  @override
  _UnifediApiPostStatusPollPleromaAdapter get _value =>
      super._value as _UnifediApiPostStatusPollPleromaAdapter;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_UnifediApiPostStatusPollPleromaAdapter(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as PleromaApiPostStatusPoll,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPostStatusPollPleromaAdapter
    extends _UnifediApiPostStatusPollPleromaAdapter {
  const _$_UnifediApiPostStatusPollPleromaAdapter(@HiveField(0) this.value)
      : super._();

  factory _$_UnifediApiPostStatusPollPleromaAdapter.fromJson(
          Map<String, dynamic> json) =>
      _$$_UnifediApiPostStatusPollPleromaAdapterFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiPostStatusPoll value;

  @override
  String toString() {
    return 'UnifediApiPostStatusPollPleromaAdapter(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiPostStatusPollPleromaAdapter &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPostStatusPollPleromaAdapterCopyWith<
          _UnifediApiPostStatusPollPleromaAdapter>
      get copyWith => __$UnifediApiPostStatusPollPleromaAdapterCopyWithImpl<
          _UnifediApiPostStatusPollPleromaAdapter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPostStatusPollPleromaAdapterToJson(this);
  }
}

abstract class _UnifediApiPostStatusPollPleromaAdapter
    extends UnifediApiPostStatusPollPleromaAdapter {
  const factory _UnifediApiPostStatusPollPleromaAdapter(
          @HiveField(0) PleromaApiPostStatusPoll value) =
      _$_UnifediApiPostStatusPollPleromaAdapter;
  const _UnifediApiPostStatusPollPleromaAdapter._() : super._();

  factory _UnifediApiPostStatusPollPleromaAdapter.fromJson(
          Map<String, dynamic> json) =
      _$_UnifediApiPostStatusPollPleromaAdapter.fromJson;

  @override
  @HiveField(0)
  PleromaApiPostStatusPoll get value;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPostStatusPollPleromaAdapterCopyWith<
          _UnifediApiPostStatusPollPleromaAdapter>
      get copyWith => throw _privateConstructorUsedError;
}
