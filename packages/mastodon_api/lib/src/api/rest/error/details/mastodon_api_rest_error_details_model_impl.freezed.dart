// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_rest_error_details_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiRestErrorDetails _$MastodonApiRestErrorDetailsFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiRestErrorDetails.fromJson(json);
}

/// @nodoc
class _$MastodonApiRestErrorDetailsTearOff {
  const _$MastodonApiRestErrorDetailsTearOff();

  _MastodonApiRestErrorDetails call(
      {required String error,
      required String? description,
      required Map<String, List<MastodonApiRestErrorDetails>>? details}) {
    return _MastodonApiRestErrorDetails(
      error: error,
      description: description,
      details: details,
    );
  }

  MastodonApiRestErrorDetails fromJson(Map<String, Object?> json) {
    return MastodonApiRestErrorDetails.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiRestErrorDetails = _$MastodonApiRestErrorDetailsTearOff();

/// @nodoc
mixin _$MastodonApiRestErrorDetails {
  String get error => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Map<String, List<MastodonApiRestErrorDetails>>? get details =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiRestErrorDetailsCopyWith<MastodonApiRestErrorDetails>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiRestErrorDetailsCopyWith<$Res> {
  factory $MastodonApiRestErrorDetailsCopyWith(
          MastodonApiRestErrorDetails value,
          $Res Function(MastodonApiRestErrorDetails) then) =
      _$MastodonApiRestErrorDetailsCopyWithImpl<$Res>;
  $Res call(
      {String error,
      String? description,
      Map<String, List<MastodonApiRestErrorDetails>>? details});
}

/// @nodoc
class _$MastodonApiRestErrorDetailsCopyWithImpl<$Res>
    implements $MastodonApiRestErrorDetailsCopyWith<$Res> {
  _$MastodonApiRestErrorDetailsCopyWithImpl(this._value, this._then);

  final MastodonApiRestErrorDetails _value;
  // ignore: unused_field
  final $Res Function(MastodonApiRestErrorDetails) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? description = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, List<MastodonApiRestErrorDetails>>?,
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiRestErrorDetailsCopyWith<$Res>
    implements $MastodonApiRestErrorDetailsCopyWith<$Res> {
  factory _$MastodonApiRestErrorDetailsCopyWith(
          _MastodonApiRestErrorDetails value,
          $Res Function(_MastodonApiRestErrorDetails) then) =
      __$MastodonApiRestErrorDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String error,
      String? description,
      Map<String, List<MastodonApiRestErrorDetails>>? details});
}

/// @nodoc
class __$MastodonApiRestErrorDetailsCopyWithImpl<$Res>
    extends _$MastodonApiRestErrorDetailsCopyWithImpl<$Res>
    implements _$MastodonApiRestErrorDetailsCopyWith<$Res> {
  __$MastodonApiRestErrorDetailsCopyWithImpl(
      _MastodonApiRestErrorDetails _value,
      $Res Function(_MastodonApiRestErrorDetails) _then)
      : super(_value, (v) => _then(v as _MastodonApiRestErrorDetails));

  @override
  _MastodonApiRestErrorDetails get _value =>
      super._value as _MastodonApiRestErrorDetails;

  @override
  $Res call({
    Object? error = freezed,
    Object? description = freezed,
    Object? details = freezed,
  }) {
    return _then(_MastodonApiRestErrorDetails(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, List<MastodonApiRestErrorDetails>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiRestErrorDetails implements _MastodonApiRestErrorDetails {
  const _$_MastodonApiRestErrorDetails(
      {required this.error, required this.description, required this.details});

  factory _$_MastodonApiRestErrorDetails.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiRestErrorDetailsFromJson(json);

  @override
  final String error;
  @override
  final String? description;
  @override
  final Map<String, List<MastodonApiRestErrorDetails>>? details;

  @override
  String toString() {
    return 'MastodonApiRestErrorDetails(error: $error, description: $description, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiRestErrorDetails &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.details, details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, description,
      const DeepCollectionEquality().hash(details));

  @JsonKey(ignore: true)
  @override
  _$MastodonApiRestErrorDetailsCopyWith<_MastodonApiRestErrorDetails>
      get copyWith => __$MastodonApiRestErrorDetailsCopyWithImpl<
          _MastodonApiRestErrorDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiRestErrorDetailsToJson(this);
  }
}

abstract class _MastodonApiRestErrorDetails
    implements MastodonApiRestErrorDetails {
  const factory _MastodonApiRestErrorDetails(
          {required String error,
          required String? description,
          required Map<String, List<MastodonApiRestErrorDetails>>? details}) =
      _$_MastodonApiRestErrorDetails;

  factory _MastodonApiRestErrorDetails.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiRestErrorDetails.fromJson;

  @override
  String get error;
  @override
  String? get description;
  @override
  Map<String, List<MastodonApiRestErrorDetails>>? get details;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiRestErrorDetailsCopyWith<_MastodonApiRestErrorDetails>
      get copyWith => throw _privateConstructorUsedError;
}
