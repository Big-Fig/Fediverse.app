// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_status_context_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiStatusContext _$PleromaApiStatusContextFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiStatusContext.fromJson(json);
}

/// @nodoc
class _$PleromaApiStatusContextTearOff {
  const _$PleromaApiStatusContextTearOff();

  _PleromaApiStatusContext call(
      {@HiveField(0) required List<PleromaApiStatus> descendants,
      @HiveField(1) required List<PleromaApiStatus> ancestors}) {
    return _PleromaApiStatusContext(
      descendants: descendants,
      ancestors: ancestors,
    );
  }

  PleromaApiStatusContext fromJson(Map<String, Object> json) {
    return PleromaApiStatusContext.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiStatusContext = _$PleromaApiStatusContextTearOff();

/// @nodoc
mixin _$PleromaApiStatusContext {
  @HiveField(0)
  List<PleromaApiStatus> get descendants => throw _privateConstructorUsedError;
  @HiveField(1)
  List<PleromaApiStatus> get ancestors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiStatusContextCopyWith<PleromaApiStatusContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiStatusContextCopyWith<$Res> {
  factory $PleromaApiStatusContextCopyWith(PleromaApiStatusContext value,
          $Res Function(PleromaApiStatusContext) then) =
      _$PleromaApiStatusContextCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) List<PleromaApiStatus> descendants,
      @HiveField(1) List<PleromaApiStatus> ancestors});
}

/// @nodoc
class _$PleromaApiStatusContextCopyWithImpl<$Res>
    implements $PleromaApiStatusContextCopyWith<$Res> {
  _$PleromaApiStatusContextCopyWithImpl(this._value, this._then);

  final PleromaApiStatusContext _value;
  // ignore: unused_field
  final $Res Function(PleromaApiStatusContext) _then;

  @override
  $Res call({
    Object? descendants = freezed,
    Object? ancestors = freezed,
  }) {
    return _then(_value.copyWith(
      descendants: descendants == freezed
          ? _value.descendants
          : descendants // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiStatus>,
      ancestors: ancestors == freezed
          ? _value.ancestors
          : ancestors // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiStatus>,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiStatusContextCopyWith<$Res>
    implements $PleromaApiStatusContextCopyWith<$Res> {
  factory _$PleromaApiStatusContextCopyWith(_PleromaApiStatusContext value,
          $Res Function(_PleromaApiStatusContext) then) =
      __$PleromaApiStatusContextCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) List<PleromaApiStatus> descendants,
      @HiveField(1) List<PleromaApiStatus> ancestors});
}

/// @nodoc
class __$PleromaApiStatusContextCopyWithImpl<$Res>
    extends _$PleromaApiStatusContextCopyWithImpl<$Res>
    implements _$PleromaApiStatusContextCopyWith<$Res> {
  __$PleromaApiStatusContextCopyWithImpl(_PleromaApiStatusContext _value,
      $Res Function(_PleromaApiStatusContext) _then)
      : super(_value, (v) => _then(v as _PleromaApiStatusContext));

  @override
  _PleromaApiStatusContext get _value =>
      super._value as _PleromaApiStatusContext;

  @override
  $Res call({
    Object? descendants = freezed,
    Object? ancestors = freezed,
  }) {
    return _then(_PleromaApiStatusContext(
      descendants: descendants == freezed
          ? _value.descendants
          : descendants // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiStatus>,
      ancestors: ancestors == freezed
          ? _value.ancestors
          : ancestors // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiStatus>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiStatusContext implements _PleromaApiStatusContext {
  const _$_PleromaApiStatusContext(
      {@HiveField(0) required this.descendants,
      @HiveField(1) required this.ancestors});

  factory _$_PleromaApiStatusContext.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiStatusContextFromJson(json);

  @override
  @HiveField(0)
  final List<PleromaApiStatus> descendants;
  @override
  @HiveField(1)
  final List<PleromaApiStatus> ancestors;

  @override
  String toString() {
    return 'PleromaApiStatusContext(descendants: $descendants, ancestors: $ancestors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiStatusContext &&
            (identical(other.descendants, descendants) ||
                const DeepCollectionEquality()
                    .equals(other.descendants, descendants)) &&
            (identical(other.ancestors, ancestors) ||
                const DeepCollectionEquality()
                    .equals(other.ancestors, ancestors)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(descendants) ^
      const DeepCollectionEquality().hash(ancestors);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiStatusContextCopyWith<_PleromaApiStatusContext> get copyWith =>
      __$PleromaApiStatusContextCopyWithImpl<_PleromaApiStatusContext>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiStatusContextToJson(this);
  }
}

abstract class _PleromaApiStatusContext implements PleromaApiStatusContext {
  const factory _PleromaApiStatusContext(
          {@HiveField(0) required List<PleromaApiStatus> descendants,
          @HiveField(1) required List<PleromaApiStatus> ancestors}) =
      _$_PleromaApiStatusContext;

  factory _PleromaApiStatusContext.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiStatusContext.fromJson;

  @override
  @HiveField(0)
  List<PleromaApiStatus> get descendants => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  List<PleromaApiStatus> get ancestors => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiStatusContextCopyWith<_PleromaApiStatusContext> get copyWith =>
      throw _privateConstructorUsedError;
}
