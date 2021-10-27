// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_content_variants_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiContentVariants _$UnifediApiContentVariantsFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiContentVariants.fromJson(json);
}

/// @nodoc
class _$UnifediApiContentVariantsTearOff {
  const _$UnifediApiContentVariantsTearOff();

  _UnifediApiContentVariants call(
      {@HiveField(0) @JsonKey(name: 'text/plain') required String? textPlain}) {
    return _UnifediApiContentVariants(
      textPlain: textPlain,
    );
  }

  UnifediApiContentVariants fromJson(Map<String, Object?> json) {
    return UnifediApiContentVariants.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiContentVariants = _$UnifediApiContentVariantsTearOff();

/// @nodoc
mixin _$UnifediApiContentVariants {
  @HiveField(0)
  @JsonKey(name: 'text/plain')
  String? get textPlain => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiContentVariantsCopyWith<UnifediApiContentVariants> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiContentVariantsCopyWith<$Res> {
  factory $UnifediApiContentVariantsCopyWith(UnifediApiContentVariants value,
          $Res Function(UnifediApiContentVariants) then) =
      _$UnifediApiContentVariantsCopyWithImpl<$Res>;
  $Res call({@HiveField(0) @JsonKey(name: 'text/plain') String? textPlain});
}

/// @nodoc
class _$UnifediApiContentVariantsCopyWithImpl<$Res>
    implements $UnifediApiContentVariantsCopyWith<$Res> {
  _$UnifediApiContentVariantsCopyWithImpl(this._value, this._then);

  final UnifediApiContentVariants _value;
  // ignore: unused_field
  final $Res Function(UnifediApiContentVariants) _then;

  @override
  $Res call({
    Object? textPlain = freezed,
  }) {
    return _then(_value.copyWith(
      textPlain: textPlain == freezed
          ? _value.textPlain
          : textPlain // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiContentVariantsCopyWith<$Res>
    implements $UnifediApiContentVariantsCopyWith<$Res> {
  factory _$UnifediApiContentVariantsCopyWith(_UnifediApiContentVariants value,
          $Res Function(_UnifediApiContentVariants) then) =
      __$UnifediApiContentVariantsCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) @JsonKey(name: 'text/plain') String? textPlain});
}

/// @nodoc
class __$UnifediApiContentVariantsCopyWithImpl<$Res>
    extends _$UnifediApiContentVariantsCopyWithImpl<$Res>
    implements _$UnifediApiContentVariantsCopyWith<$Res> {
  __$UnifediApiContentVariantsCopyWithImpl(_UnifediApiContentVariants _value,
      $Res Function(_UnifediApiContentVariants) _then)
      : super(_value, (v) => _then(v as _UnifediApiContentVariants));

  @override
  _UnifediApiContentVariants get _value =>
      super._value as _UnifediApiContentVariants;

  @override
  $Res call({
    Object? textPlain = freezed,
  }) {
    return _then(_UnifediApiContentVariants(
      textPlain: textPlain == freezed
          ? _value.textPlain
          : textPlain // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiContentVariants implements _UnifediApiContentVariants {
  const _$_UnifediApiContentVariants(
      {@HiveField(0) @JsonKey(name: 'text/plain') required this.textPlain});

  factory _$_UnifediApiContentVariants.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiContentVariantsFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'text/plain')
  final String? textPlain;

  @override
  String toString() {
    return 'UnifediApiContentVariants(textPlain: $textPlain)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiContentVariants &&
            (identical(other.textPlain, textPlain) ||
                other.textPlain == textPlain));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textPlain);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiContentVariantsCopyWith<_UnifediApiContentVariants>
      get copyWith =>
          __$UnifediApiContentVariantsCopyWithImpl<_UnifediApiContentVariants>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiContentVariantsToJson(this);
  }
}

abstract class _UnifediApiContentVariants implements UnifediApiContentVariants {
  const factory _UnifediApiContentVariants(
      {@HiveField(0)
      @JsonKey(name: 'text/plain')
          required String? textPlain}) = _$_UnifediApiContentVariants;

  factory _UnifediApiContentVariants.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiContentVariants.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'text/plain')
  String? get textPlain;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiContentVariantsCopyWith<_UnifediApiContentVariants>
      get copyWith => throw _privateConstructorUsedError;
}
