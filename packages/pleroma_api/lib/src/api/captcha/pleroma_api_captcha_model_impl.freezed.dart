// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_captcha_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiCaptcha _$PleromaApiCaptchaFromJson(Map<String, dynamic> json) {
  return _PleromaApiCaptcha.fromJson(json);
}

/// @nodoc
class _$PleromaApiCaptchaTearOff {
  const _$PleromaApiCaptchaTearOff();

  _PleromaApiCaptcha call(
      {@HiveField(1)
      @JsonKey(name: 'seconds_valid')
          required int? secondsValid,
      @HiveField(2)
          required String? token,
      @HiveField(3)
          required String type,
      @HiveField(4)
          required String? url,
      @JsonKey(name: 'answer_data')
      @HiveField(5)
          required String? answerData}) {
    return _PleromaApiCaptcha(
      secondsValid: secondsValid,
      token: token,
      type: type,
      url: url,
      answerData: answerData,
    );
  }

  PleromaApiCaptcha fromJson(Map<String, Object?> json) {
    return PleromaApiCaptcha.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiCaptcha = _$PleromaApiCaptchaTearOff();

/// @nodoc
mixin _$PleromaApiCaptcha {
  @HiveField(1)
  @JsonKey(name: 'seconds_valid')
  int? get secondsValid => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get token => throw _privateConstructorUsedError;
  @HiveField(3)
  String get type => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_data')
  @HiveField(5)
  String? get answerData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiCaptchaCopyWith<PleromaApiCaptcha> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiCaptchaCopyWith<$Res> {
  factory $PleromaApiCaptchaCopyWith(
          PleromaApiCaptcha value, $Res Function(PleromaApiCaptcha) then) =
      _$PleromaApiCaptchaCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(1) @JsonKey(name: 'seconds_valid') int? secondsValid,
      @HiveField(2) String? token,
      @HiveField(3) String type,
      @HiveField(4) String? url,
      @JsonKey(name: 'answer_data') @HiveField(5) String? answerData});
}

/// @nodoc
class _$PleromaApiCaptchaCopyWithImpl<$Res>
    implements $PleromaApiCaptchaCopyWith<$Res> {
  _$PleromaApiCaptchaCopyWithImpl(this._value, this._then);

  final PleromaApiCaptcha _value;
  // ignore: unused_field
  final $Res Function(PleromaApiCaptcha) _then;

  @override
  $Res call({
    Object? secondsValid = freezed,
    Object? token = freezed,
    Object? type = freezed,
    Object? url = freezed,
    Object? answerData = freezed,
  }) {
    return _then(_value.copyWith(
      secondsValid: secondsValid == freezed
          ? _value.secondsValid
          : secondsValid // ignore: cast_nullable_to_non_nullable
              as int?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      answerData: answerData == freezed
          ? _value.answerData
          : answerData // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiCaptchaCopyWith<$Res>
    implements $PleromaApiCaptchaCopyWith<$Res> {
  factory _$PleromaApiCaptchaCopyWith(
          _PleromaApiCaptcha value, $Res Function(_PleromaApiCaptcha) then) =
      __$PleromaApiCaptchaCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(1) @JsonKey(name: 'seconds_valid') int? secondsValid,
      @HiveField(2) String? token,
      @HiveField(3) String type,
      @HiveField(4) String? url,
      @JsonKey(name: 'answer_data') @HiveField(5) String? answerData});
}

/// @nodoc
class __$PleromaApiCaptchaCopyWithImpl<$Res>
    extends _$PleromaApiCaptchaCopyWithImpl<$Res>
    implements _$PleromaApiCaptchaCopyWith<$Res> {
  __$PleromaApiCaptchaCopyWithImpl(
      _PleromaApiCaptcha _value, $Res Function(_PleromaApiCaptcha) _then)
      : super(_value, (v) => _then(v as _PleromaApiCaptcha));

  @override
  _PleromaApiCaptcha get _value => super._value as _PleromaApiCaptcha;

  @override
  $Res call({
    Object? secondsValid = freezed,
    Object? token = freezed,
    Object? type = freezed,
    Object? url = freezed,
    Object? answerData = freezed,
  }) {
    return _then(_PleromaApiCaptcha(
      secondsValid: secondsValid == freezed
          ? _value.secondsValid
          : secondsValid // ignore: cast_nullable_to_non_nullable
              as int?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      answerData: answerData == freezed
          ? _value.answerData
          : answerData // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiCaptcha implements _PleromaApiCaptcha {
  const _$_PleromaApiCaptcha(
      {@HiveField(1) @JsonKey(name: 'seconds_valid') required this.secondsValid,
      @HiveField(2) required this.token,
      @HiveField(3) required this.type,
      @HiveField(4) required this.url,
      @JsonKey(name: 'answer_data') @HiveField(5) required this.answerData});

  factory _$_PleromaApiCaptcha.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiCaptchaFromJson(json);

  @override
  @HiveField(1)
  @JsonKey(name: 'seconds_valid')
  final int? secondsValid;
  @override
  @HiveField(2)
  final String? token;
  @override
  @HiveField(3)
  final String type;
  @override
  @HiveField(4)
  final String? url;
  @override
  @JsonKey(name: 'answer_data')
  @HiveField(5)
  final String? answerData;

  @override
  String toString() {
    return 'PleromaApiCaptcha(secondsValid: $secondsValid, token: $token, type: $type, url: $url, answerData: $answerData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiCaptcha &&
            (identical(other.secondsValid, secondsValid) ||
                other.secondsValid == secondsValid) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.answerData, answerData) ||
                other.answerData == answerData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, secondsValid, token, type, url, answerData);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiCaptchaCopyWith<_PleromaApiCaptcha> get copyWith =>
      __$PleromaApiCaptchaCopyWithImpl<_PleromaApiCaptcha>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiCaptchaToJson(this);
  }
}

abstract class _PleromaApiCaptcha implements PleromaApiCaptcha {
  const factory _PleromaApiCaptcha(
      {@HiveField(1)
      @JsonKey(name: 'seconds_valid')
          required int? secondsValid,
      @HiveField(2)
          required String? token,
      @HiveField(3)
          required String type,
      @HiveField(4)
          required String? url,
      @JsonKey(name: 'answer_data')
      @HiveField(5)
          required String? answerData}) = _$_PleromaApiCaptcha;

  factory _PleromaApiCaptcha.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiCaptcha.fromJson;

  @override
  @HiveField(1)
  @JsonKey(name: 'seconds_valid')
  int? get secondsValid;
  @override
  @HiveField(2)
  String? get token;
  @override
  @HiveField(3)
  String get type;
  @override
  @HiveField(4)
  String? get url;
  @override
  @JsonKey(name: 'answer_data')
  @HiveField(5)
  String? get answerData;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiCaptchaCopyWith<_PleromaApiCaptcha> get copyWith =>
      throw _privateConstructorUsedError;
}
