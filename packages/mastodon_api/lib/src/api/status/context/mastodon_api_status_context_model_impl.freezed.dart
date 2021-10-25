// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_status_context_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiStatusContext _$MastodonApiStatusContextFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiStatusContext.fromJson(json);
}

/// @nodoc
class _$MastodonApiStatusContextTearOff {
  const _$MastodonApiStatusContextTearOff();

  _MastodonApiStatusContext call(
      {@HiveField(0) required List<MastodonApiStatus> descendants,
      @HiveField(1) required List<MastodonApiStatus> ancestors}) {
    return _MastodonApiStatusContext(
      descendants: descendants,
      ancestors: ancestors,
    );
  }

  MastodonApiStatusContext fromJson(Map<String, Object> json) {
    return MastodonApiStatusContext.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiStatusContext = _$MastodonApiStatusContextTearOff();

/// @nodoc
mixin _$MastodonApiStatusContext {
  @HiveField(0)
  List<MastodonApiStatus> get descendants => throw _privateConstructorUsedError;
  @HiveField(1)
  List<MastodonApiStatus> get ancestors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiStatusContextCopyWith<MastodonApiStatusContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiStatusContextCopyWith<$Res> {
  factory $MastodonApiStatusContextCopyWith(MastodonApiStatusContext value,
          $Res Function(MastodonApiStatusContext) then) =
      _$MastodonApiStatusContextCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) List<MastodonApiStatus> descendants,
      @HiveField(1) List<MastodonApiStatus> ancestors});
}

/// @nodoc
class _$MastodonApiStatusContextCopyWithImpl<$Res>
    implements $MastodonApiStatusContextCopyWith<$Res> {
  _$MastodonApiStatusContextCopyWithImpl(this._value, this._then);

  final MastodonApiStatusContext _value;
  // ignore: unused_field
  final $Res Function(MastodonApiStatusContext) _then;

  @override
  $Res call({
    Object? descendants = freezed,
    Object? ancestors = freezed,
  }) {
    return _then(_value.copyWith(
      descendants: descendants == freezed
          ? _value.descendants
          : descendants // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiStatus>,
      ancestors: ancestors == freezed
          ? _value.ancestors
          : ancestors // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiStatus>,
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiStatusContextCopyWith<$Res>
    implements $MastodonApiStatusContextCopyWith<$Res> {
  factory _$MastodonApiStatusContextCopyWith(_MastodonApiStatusContext value,
          $Res Function(_MastodonApiStatusContext) then) =
      __$MastodonApiStatusContextCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) List<MastodonApiStatus> descendants,
      @HiveField(1) List<MastodonApiStatus> ancestors});
}

/// @nodoc
class __$MastodonApiStatusContextCopyWithImpl<$Res>
    extends _$MastodonApiStatusContextCopyWithImpl<$Res>
    implements _$MastodonApiStatusContextCopyWith<$Res> {
  __$MastodonApiStatusContextCopyWithImpl(_MastodonApiStatusContext _value,
      $Res Function(_MastodonApiStatusContext) _then)
      : super(_value, (v) => _then(v as _MastodonApiStatusContext));

  @override
  _MastodonApiStatusContext get _value =>
      super._value as _MastodonApiStatusContext;

  @override
  $Res call({
    Object? descendants = freezed,
    Object? ancestors = freezed,
  }) {
    return _then(_MastodonApiStatusContext(
      descendants: descendants == freezed
          ? _value.descendants
          : descendants // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiStatus>,
      ancestors: ancestors == freezed
          ? _value.ancestors
          : ancestors // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiStatus>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiStatusContext implements _MastodonApiStatusContext {
  const _$_MastodonApiStatusContext(
      {@HiveField(0) required this.descendants,
      @HiveField(1) required this.ancestors});

  factory _$_MastodonApiStatusContext.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiStatusContextFromJson(json);

  @override
  @HiveField(0)
  final List<MastodonApiStatus> descendants;
  @override
  @HiveField(1)
  final List<MastodonApiStatus> ancestors;

  @override
  String toString() {
    return 'MastodonApiStatusContext(descendants: $descendants, ancestors: $ancestors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MastodonApiStatusContext &&
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
  _$MastodonApiStatusContextCopyWith<_MastodonApiStatusContext> get copyWith =>
      __$MastodonApiStatusContextCopyWithImpl<_MastodonApiStatusContext>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiStatusContextToJson(this);
  }
}

abstract class _MastodonApiStatusContext implements MastodonApiStatusContext {
  const factory _MastodonApiStatusContext(
          {@HiveField(0) required List<MastodonApiStatus> descendants,
          @HiveField(1) required List<MastodonApiStatus> ancestors}) =
      _$_MastodonApiStatusContext;

  factory _MastodonApiStatusContext.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiStatusContext.fromJson;

  @override
  @HiveField(0)
  List<MastodonApiStatus> get descendants => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  List<MastodonApiStatus> get ancestors => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiStatusContextCopyWith<_MastodonApiStatusContext> get copyWith =>
      throw _privateConstructorUsedError;
}
