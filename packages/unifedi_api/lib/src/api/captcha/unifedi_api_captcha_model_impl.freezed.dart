// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_captcha_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiCaptcha _$UnifediApiCaptchaFromJson(Map<String, dynamic> json) {
  return _UnifediApiCaptcha.fromJson(json);
}

/// @nodoc
class _$UnifediApiCaptchaTearOff {
  const _$UnifediApiCaptchaTearOff();

  _UnifediApiCaptcha call(
      {@HiveField(1) @JsonKey(name: 'seconds_valid') required int? secondsValid,
      @HiveField(2) required String? token,
      @HiveField(3) required String type,
      @HiveField(4) required String? url,
      @HiveField(5) required String? answerData}) {
    return _UnifediApiCaptcha(
      secondsValid: secondsValid,
      token: token,
      type: type,
      url: url,
      answerData: answerData,
    );
  }

  UnifediApiCaptcha fromJson(Map<String, Object> json) {
    return UnifediApiCaptcha.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiCaptcha = _$UnifediApiCaptchaTearOff();

/// @nodoc
mixin _$UnifediApiCaptcha {
  @HiveField(1)
  @JsonKey(name: 'seconds_valid')
  int? get secondsValid => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get token => throw _privateConstructorUsedError;
  @HiveField(3)
  String get type => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get url => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get answerData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiCaptchaCopyWith<UnifediApiCaptcha> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiCaptchaCopyWith<$Res> {
  factory $UnifediApiCaptchaCopyWith(
          UnifediApiCaptcha value, $Res Function(UnifediApiCaptcha) then) =
      _$UnifediApiCaptchaCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(1) @JsonKey(name: 'seconds_valid') int? secondsValid,
      @HiveField(2) String? token,
      @HiveField(3) String type,
      @HiveField(4) String? url,
      @HiveField(5) String? answerData});
}

/// @nodoc
class _$UnifediApiCaptchaCopyWithImpl<$Res>
    implements $UnifediApiCaptchaCopyWith<$Res> {
  _$UnifediApiCaptchaCopyWithImpl(this._value, this._then);

  final UnifediApiCaptcha _value;
  // ignore: unused_field
  final $Res Function(UnifediApiCaptcha) _then;

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
abstract class _$UnifediApiCaptchaCopyWith<$Res>
    implements $UnifediApiCaptchaCopyWith<$Res> {
  factory _$UnifediApiCaptchaCopyWith(
          _UnifediApiCaptcha value, $Res Function(_UnifediApiCaptcha) then) =
      __$UnifediApiCaptchaCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(1) @JsonKey(name: 'seconds_valid') int? secondsValid,
      @HiveField(2) String? token,
      @HiveField(3) String type,
      @HiveField(4) String? url,
      @HiveField(5) String? answerData});
}

/// @nodoc
class __$UnifediApiCaptchaCopyWithImpl<$Res>
    extends _$UnifediApiCaptchaCopyWithImpl<$Res>
    implements _$UnifediApiCaptchaCopyWith<$Res> {
  __$UnifediApiCaptchaCopyWithImpl(
      _UnifediApiCaptcha _value, $Res Function(_UnifediApiCaptcha) _then)
      : super(_value, (v) => _then(v as _UnifediApiCaptcha));

  @override
  _UnifediApiCaptcha get _value => super._value as _UnifediApiCaptcha;

  @override
  $Res call({
    Object? secondsValid = freezed,
    Object? token = freezed,
    Object? type = freezed,
    Object? url = freezed,
    Object? answerData = freezed,
  }) {
    return _then(_UnifediApiCaptcha(
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
class _$_UnifediApiCaptcha implements _UnifediApiCaptcha {
  const _$_UnifediApiCaptcha(
      {@HiveField(1) @JsonKey(name: 'seconds_valid') required this.secondsValid,
      @HiveField(2) required this.token,
      @HiveField(3) required this.type,
      @HiveField(4) required this.url,
      @HiveField(5) required this.answerData});

  factory _$_UnifediApiCaptcha.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiCaptchaFromJson(json);

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
  @HiveField(5)
  final String? answerData;

  @override
  String toString() {
    return 'UnifediApiCaptcha(secondsValid: $secondsValid, token: $token, type: $type, url: $url, answerData: $answerData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiCaptcha &&
            (identical(other.secondsValid, secondsValid) ||
                const DeepCollectionEquality()
                    .equals(other.secondsValid, secondsValid)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.answerData, answerData) ||
                const DeepCollectionEquality()
                    .equals(other.answerData, answerData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(secondsValid) ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(answerData);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiCaptchaCopyWith<_UnifediApiCaptcha> get copyWith =>
      __$UnifediApiCaptchaCopyWithImpl<_UnifediApiCaptcha>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiCaptchaToJson(this);
  }
}

abstract class _UnifediApiCaptcha implements UnifediApiCaptcha {
  const factory _UnifediApiCaptcha(
      {@HiveField(1) @JsonKey(name: 'seconds_valid') required int? secondsValid,
      @HiveField(2) required String? token,
      @HiveField(3) required String type,
      @HiveField(4) required String? url,
      @HiveField(5) required String? answerData}) = _$_UnifediApiCaptcha;

  factory _UnifediApiCaptcha.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiCaptcha.fromJson;

  @override
  @HiveField(1)
  @JsonKey(name: 'seconds_valid')
  int? get secondsValid => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String? get token => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  String get type => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  String? get url => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  String? get answerData => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiCaptchaCopyWith<_UnifediApiCaptcha> get copyWith =>
      throw _privateConstructorUsedError;
}
