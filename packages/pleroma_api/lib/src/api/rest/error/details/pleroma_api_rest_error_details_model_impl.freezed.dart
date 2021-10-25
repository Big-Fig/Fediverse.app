// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_rest_error_details_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiRestErrorDetails _$PleromaApiRestErrorDetailsFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiRestErrorDetails.fromJson(json);
}

/// @nodoc
class _$PleromaApiRestErrorDetailsTearOff {
  const _$PleromaApiRestErrorDetailsTearOff();

  _PleromaApiRestErrorDetails call(
      {required String? error,
      required String? identifier,
      required String? message}) {
    return _PleromaApiRestErrorDetails(
      error: error,
      identifier: identifier,
      message: message,
    );
  }

  PleromaApiRestErrorDetails fromJson(Map<String, Object> json) {
    return PleromaApiRestErrorDetails.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiRestErrorDetails = _$PleromaApiRestErrorDetailsTearOff();

/// @nodoc
mixin _$PleromaApiRestErrorDetails {
  String? get error => throw _privateConstructorUsedError;
  String? get identifier => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiRestErrorDetailsCopyWith<PleromaApiRestErrorDetails>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiRestErrorDetailsCopyWith<$Res> {
  factory $PleromaApiRestErrorDetailsCopyWith(PleromaApiRestErrorDetails value,
          $Res Function(PleromaApiRestErrorDetails) then) =
      _$PleromaApiRestErrorDetailsCopyWithImpl<$Res>;
  $Res call({String? error, String? identifier, String? message});
}

/// @nodoc
class _$PleromaApiRestErrorDetailsCopyWithImpl<$Res>
    implements $PleromaApiRestErrorDetailsCopyWith<$Res> {
  _$PleromaApiRestErrorDetailsCopyWithImpl(this._value, this._then);

  final PleromaApiRestErrorDetails _value;
  // ignore: unused_field
  final $Res Function(PleromaApiRestErrorDetails) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? identifier = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiRestErrorDetailsCopyWith<$Res>
    implements $PleromaApiRestErrorDetailsCopyWith<$Res> {
  factory _$PleromaApiRestErrorDetailsCopyWith(
          _PleromaApiRestErrorDetails value,
          $Res Function(_PleromaApiRestErrorDetails) then) =
      __$PleromaApiRestErrorDetailsCopyWithImpl<$Res>;
  @override
  $Res call({String? error, String? identifier, String? message});
}

/// @nodoc
class __$PleromaApiRestErrorDetailsCopyWithImpl<$Res>
    extends _$PleromaApiRestErrorDetailsCopyWithImpl<$Res>
    implements _$PleromaApiRestErrorDetailsCopyWith<$Res> {
  __$PleromaApiRestErrorDetailsCopyWithImpl(_PleromaApiRestErrorDetails _value,
      $Res Function(_PleromaApiRestErrorDetails) _then)
      : super(_value, (v) => _then(v as _PleromaApiRestErrorDetails));

  @override
  _PleromaApiRestErrorDetails get _value =>
      super._value as _PleromaApiRestErrorDetails;

  @override
  $Res call({
    Object? error = freezed,
    Object? identifier = freezed,
    Object? message = freezed,
  }) {
    return _then(_PleromaApiRestErrorDetails(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiRestErrorDetails implements _PleromaApiRestErrorDetails {
  const _$_PleromaApiRestErrorDetails(
      {required this.error, required this.identifier, required this.message});

  factory _$_PleromaApiRestErrorDetails.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiRestErrorDetailsFromJson(json);

  @override
  final String? error;
  @override
  final String? identifier;
  @override
  final String? message;

  @override
  String toString() {
    return 'PleromaApiRestErrorDetails(error: $error, identifier: $identifier, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiRestErrorDetails &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiRestErrorDetailsCopyWith<_PleromaApiRestErrorDetails>
      get copyWith => __$PleromaApiRestErrorDetailsCopyWithImpl<
          _PleromaApiRestErrorDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiRestErrorDetailsToJson(this);
  }
}

abstract class _PleromaApiRestErrorDetails
    implements PleromaApiRestErrorDetails {
  const factory _PleromaApiRestErrorDetails(
      {required String? error,
      required String? identifier,
      required String? message}) = _$_PleromaApiRestErrorDetails;

  factory _PleromaApiRestErrorDetails.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiRestErrorDetails.fromJson;

  @override
  String? get error => throw _privateConstructorUsedError;
  @override
  String? get identifier => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiRestErrorDetailsCopyWith<_PleromaApiRestErrorDetails>
      get copyWith => throw _privateConstructorUsedError;
}
