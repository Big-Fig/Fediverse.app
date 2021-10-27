// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_content_variants_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiContentVariants _$PleromaApiContentVariantsFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiContentVariants.fromJson(json);
}

/// @nodoc
class _$PleromaApiContentVariantsTearOff {
  const _$PleromaApiContentVariantsTearOff();

  _PleromaApiContentVariants call(
      {@HiveField(0) @JsonKey(name: 'text/plain') required String? textPlain}) {
    return _PleromaApiContentVariants(
      textPlain: textPlain,
    );
  }

  PleromaApiContentVariants fromJson(Map<String, Object?> json) {
    return PleromaApiContentVariants.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiContentVariants = _$PleromaApiContentVariantsTearOff();

/// @nodoc
mixin _$PleromaApiContentVariants {
  @HiveField(0)
  @JsonKey(name: 'text/plain')
  String? get textPlain => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiContentVariantsCopyWith<PleromaApiContentVariants> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiContentVariantsCopyWith<$Res> {
  factory $PleromaApiContentVariantsCopyWith(PleromaApiContentVariants value,
          $Res Function(PleromaApiContentVariants) then) =
      _$PleromaApiContentVariantsCopyWithImpl<$Res>;
  $Res call({@HiveField(0) @JsonKey(name: 'text/plain') String? textPlain});
}

/// @nodoc
class _$PleromaApiContentVariantsCopyWithImpl<$Res>
    implements $PleromaApiContentVariantsCopyWith<$Res> {
  _$PleromaApiContentVariantsCopyWithImpl(this._value, this._then);

  final PleromaApiContentVariants _value;
  // ignore: unused_field
  final $Res Function(PleromaApiContentVariants) _then;

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
abstract class _$PleromaApiContentVariantsCopyWith<$Res>
    implements $PleromaApiContentVariantsCopyWith<$Res> {
  factory _$PleromaApiContentVariantsCopyWith(_PleromaApiContentVariants value,
          $Res Function(_PleromaApiContentVariants) then) =
      __$PleromaApiContentVariantsCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) @JsonKey(name: 'text/plain') String? textPlain});
}

/// @nodoc
class __$PleromaApiContentVariantsCopyWithImpl<$Res>
    extends _$PleromaApiContentVariantsCopyWithImpl<$Res>
    implements _$PleromaApiContentVariantsCopyWith<$Res> {
  __$PleromaApiContentVariantsCopyWithImpl(_PleromaApiContentVariants _value,
      $Res Function(_PleromaApiContentVariants) _then)
      : super(_value, (v) => _then(v as _PleromaApiContentVariants));

  @override
  _PleromaApiContentVariants get _value =>
      super._value as _PleromaApiContentVariants;

  @override
  $Res call({
    Object? textPlain = freezed,
  }) {
    return _then(_PleromaApiContentVariants(
      textPlain: textPlain == freezed
          ? _value.textPlain
          : textPlain // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiContentVariants implements _PleromaApiContentVariants {
  const _$_PleromaApiContentVariants(
      {@HiveField(0) @JsonKey(name: 'text/plain') required this.textPlain});

  factory _$_PleromaApiContentVariants.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiContentVariantsFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'text/plain')
  final String? textPlain;

  @override
  String toString() {
    return 'PleromaApiContentVariants(textPlain: $textPlain)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiContentVariants &&
            (identical(other.textPlain, textPlain) ||
                other.textPlain == textPlain));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textPlain);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiContentVariantsCopyWith<_PleromaApiContentVariants>
      get copyWith =>
          __$PleromaApiContentVariantsCopyWithImpl<_PleromaApiContentVariants>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiContentVariantsToJson(this);
  }
}

abstract class _PleromaApiContentVariants implements PleromaApiContentVariants {
  const factory _PleromaApiContentVariants(
      {@HiveField(0)
      @JsonKey(name: 'text/plain')
          required String? textPlain}) = _$_PleromaApiContentVariants;

  factory _PleromaApiContentVariants.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiContentVariants.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'text/plain')
  String? get textPlain;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiContentVariantsCopyWith<_PleromaApiContentVariants>
      get copyWith => throw _privateConstructorUsedError;
}
