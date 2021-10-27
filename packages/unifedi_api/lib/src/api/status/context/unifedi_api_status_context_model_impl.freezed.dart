// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_status_context_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiStatusContext _$UnifediApiStatusContextFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiStatusContext.fromJson(json);
}

/// @nodoc
class _$UnifediApiStatusContextTearOff {
  const _$UnifediApiStatusContextTearOff();

  _UnifediApiStatusContext call(
      {@HiveField(0) required List<UnifediApiStatus> descendants,
      @HiveField(1) required List<UnifediApiStatus> ancestors}) {
    return _UnifediApiStatusContext(
      descendants: descendants,
      ancestors: ancestors,
    );
  }

  UnifediApiStatusContext fromJson(Map<String, Object?> json) {
    return UnifediApiStatusContext.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiStatusContext = _$UnifediApiStatusContextTearOff();

/// @nodoc
mixin _$UnifediApiStatusContext {
  @HiveField(0)
  List<UnifediApiStatus> get descendants => throw _privateConstructorUsedError;
  @HiveField(1)
  List<UnifediApiStatus> get ancestors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiStatusContextCopyWith<UnifediApiStatusContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiStatusContextCopyWith<$Res> {
  factory $UnifediApiStatusContextCopyWith(UnifediApiStatusContext value,
          $Res Function(UnifediApiStatusContext) then) =
      _$UnifediApiStatusContextCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) List<UnifediApiStatus> descendants,
      @HiveField(1) List<UnifediApiStatus> ancestors});
}

/// @nodoc
class _$UnifediApiStatusContextCopyWithImpl<$Res>
    implements $UnifediApiStatusContextCopyWith<$Res> {
  _$UnifediApiStatusContextCopyWithImpl(this._value, this._then);

  final UnifediApiStatusContext _value;
  // ignore: unused_field
  final $Res Function(UnifediApiStatusContext) _then;

  @override
  $Res call({
    Object? descendants = freezed,
    Object? ancestors = freezed,
  }) {
    return _then(_value.copyWith(
      descendants: descendants == freezed
          ? _value.descendants
          : descendants // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiStatus>,
      ancestors: ancestors == freezed
          ? _value.ancestors
          : ancestors // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiStatus>,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiStatusContextCopyWith<$Res>
    implements $UnifediApiStatusContextCopyWith<$Res> {
  factory _$UnifediApiStatusContextCopyWith(_UnifediApiStatusContext value,
          $Res Function(_UnifediApiStatusContext) then) =
      __$UnifediApiStatusContextCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) List<UnifediApiStatus> descendants,
      @HiveField(1) List<UnifediApiStatus> ancestors});
}

/// @nodoc
class __$UnifediApiStatusContextCopyWithImpl<$Res>
    extends _$UnifediApiStatusContextCopyWithImpl<$Res>
    implements _$UnifediApiStatusContextCopyWith<$Res> {
  __$UnifediApiStatusContextCopyWithImpl(_UnifediApiStatusContext _value,
      $Res Function(_UnifediApiStatusContext) _then)
      : super(_value, (v) => _then(v as _UnifediApiStatusContext));

  @override
  _UnifediApiStatusContext get _value =>
      super._value as _UnifediApiStatusContext;

  @override
  $Res call({
    Object? descendants = freezed,
    Object? ancestors = freezed,
  }) {
    return _then(_UnifediApiStatusContext(
      descendants: descendants == freezed
          ? _value.descendants
          : descendants // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiStatus>,
      ancestors: ancestors == freezed
          ? _value.ancestors
          : ancestors // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiStatus>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiStatusContext implements _UnifediApiStatusContext {
  const _$_UnifediApiStatusContext(
      {@HiveField(0) required this.descendants,
      @HiveField(1) required this.ancestors});

  factory _$_UnifediApiStatusContext.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiStatusContextFromJson(json);

  @override
  @HiveField(0)
  final List<UnifediApiStatus> descendants;
  @override
  @HiveField(1)
  final List<UnifediApiStatus> ancestors;

  @override
  String toString() {
    return 'UnifediApiStatusContext(descendants: $descendants, ancestors: $ancestors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiStatusContext &&
            const DeepCollectionEquality()
                .equals(other.descendants, descendants) &&
            const DeepCollectionEquality().equals(other.ancestors, ancestors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(descendants),
      const DeepCollectionEquality().hash(ancestors));

  @JsonKey(ignore: true)
  @override
  _$UnifediApiStatusContextCopyWith<_UnifediApiStatusContext> get copyWith =>
      __$UnifediApiStatusContextCopyWithImpl<_UnifediApiStatusContext>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiStatusContextToJson(this);
  }
}

abstract class _UnifediApiStatusContext implements UnifediApiStatusContext {
  const factory _UnifediApiStatusContext(
          {@HiveField(0) required List<UnifediApiStatus> descendants,
          @HiveField(1) required List<UnifediApiStatus> ancestors}) =
      _$_UnifediApiStatusContext;

  factory _UnifediApiStatusContext.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiStatusContext.fromJson;

  @override
  @HiveField(0)
  List<UnifediApiStatus> get descendants;
  @override
  @HiveField(1)
  List<UnifediApiStatus> get ancestors;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiStatusContextCopyWith<_UnifediApiStatusContext> get copyWith =>
      throw _privateConstructorUsedError;
}
