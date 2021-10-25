// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_rest_error_details_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiRestErrorDetails _$UnifediApiRestErrorDetailsFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiRestErrorDetails.fromJson(json);
}

/// @nodoc
class _$UnifediApiRestErrorDetailsTearOff {
  const _$UnifediApiRestErrorDetailsTearOff();

  _UnifediApiRestErrorDetails call(
      {required String? identifier,
      required String? message,
      required Map<String, List<UnifediApiRestErrorDetails>>? details}) {
    return _UnifediApiRestErrorDetails(
      identifier: identifier,
      message: message,
      details: details,
    );
  }

  UnifediApiRestErrorDetails fromJson(Map<String, Object> json) {
    return UnifediApiRestErrorDetails.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiRestErrorDetails = _$UnifediApiRestErrorDetailsTearOff();

/// @nodoc
mixin _$UnifediApiRestErrorDetails {
  String? get identifier => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Map<String, List<UnifediApiRestErrorDetails>>? get details =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiRestErrorDetailsCopyWith<UnifediApiRestErrorDetails>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiRestErrorDetailsCopyWith<$Res> {
  factory $UnifediApiRestErrorDetailsCopyWith(UnifediApiRestErrorDetails value,
          $Res Function(UnifediApiRestErrorDetails) then) =
      _$UnifediApiRestErrorDetailsCopyWithImpl<$Res>;
  $Res call(
      {String? identifier,
      String? message,
      Map<String, List<UnifediApiRestErrorDetails>>? details});
}

/// @nodoc
class _$UnifediApiRestErrorDetailsCopyWithImpl<$Res>
    implements $UnifediApiRestErrorDetailsCopyWith<$Res> {
  _$UnifediApiRestErrorDetailsCopyWithImpl(this._value, this._then);

  final UnifediApiRestErrorDetails _value;
  // ignore: unused_field
  final $Res Function(UnifediApiRestErrorDetails) _then;

  @override
  $Res call({
    Object? identifier = freezed,
    Object? message = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, List<UnifediApiRestErrorDetails>>?,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiRestErrorDetailsCopyWith<$Res>
    implements $UnifediApiRestErrorDetailsCopyWith<$Res> {
  factory _$UnifediApiRestErrorDetailsCopyWith(
          _UnifediApiRestErrorDetails value,
          $Res Function(_UnifediApiRestErrorDetails) then) =
      __$UnifediApiRestErrorDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? identifier,
      String? message,
      Map<String, List<UnifediApiRestErrorDetails>>? details});
}

/// @nodoc
class __$UnifediApiRestErrorDetailsCopyWithImpl<$Res>
    extends _$UnifediApiRestErrorDetailsCopyWithImpl<$Res>
    implements _$UnifediApiRestErrorDetailsCopyWith<$Res> {
  __$UnifediApiRestErrorDetailsCopyWithImpl(_UnifediApiRestErrorDetails _value,
      $Res Function(_UnifediApiRestErrorDetails) _then)
      : super(_value, (v) => _then(v as _UnifediApiRestErrorDetails));

  @override
  _UnifediApiRestErrorDetails get _value =>
      super._value as _UnifediApiRestErrorDetails;

  @override
  $Res call({
    Object? identifier = freezed,
    Object? message = freezed,
    Object? details = freezed,
  }) {
    return _then(_UnifediApiRestErrorDetails(
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, List<UnifediApiRestErrorDetails>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiRestErrorDetails implements _UnifediApiRestErrorDetails {
  const _$_UnifediApiRestErrorDetails(
      {required this.identifier, required this.message, required this.details});

  factory _$_UnifediApiRestErrorDetails.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiRestErrorDetailsFromJson(json);

  @override
  final String? identifier;
  @override
  final String? message;
  @override
  final Map<String, List<UnifediApiRestErrorDetails>>? details;

  @override
  String toString() {
    return 'UnifediApiRestErrorDetails(identifier: $identifier, message: $message, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiRestErrorDetails &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality().equals(other.details, details)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(details);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiRestErrorDetailsCopyWith<_UnifediApiRestErrorDetails>
      get copyWith => __$UnifediApiRestErrorDetailsCopyWithImpl<
          _UnifediApiRestErrorDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiRestErrorDetailsToJson(this);
  }
}

abstract class _UnifediApiRestErrorDetails
    implements UnifediApiRestErrorDetails {
  const factory _UnifediApiRestErrorDetails(
          {required String? identifier,
          required String? message,
          required Map<String, List<UnifediApiRestErrorDetails>>? details}) =
      _$_UnifediApiRestErrorDetails;

  factory _UnifediApiRestErrorDetails.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiRestErrorDetails.fromJson;

  @override
  String? get identifier => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  Map<String, List<UnifediApiRestErrorDetails>>? get details =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiRestErrorDetailsCopyWith<_UnifediApiRestErrorDetails>
      get copyWith => throw _privateConstructorUsedError;
}
