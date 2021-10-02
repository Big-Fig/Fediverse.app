// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_account_old_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaMyAccountWrapperOld _$PleromaMyAccountWrapperOldFromJson(
    Map<String, dynamic> json) {
  return _PleromaMyAccountWrapperOld.fromJson(json);
}

/// @nodoc
class _$PleromaMyAccountWrapperOldTearOff {
  const _$PleromaMyAccountWrapperOldTearOff();

  _PleromaMyAccountWrapperOld call(
      {@HiveField(0)
      @JsonKey(name: 'remote_account')
          required PleromaMyAccountWrapperOld pleromaAccount}) {
    return _PleromaMyAccountWrapperOld(
      pleromaAccount: pleromaAccount,
    );
  }

  PleromaMyAccountWrapperOld fromJson(Map<String, Object> json) {
    return PleromaMyAccountWrapperOld.fromJson(json);
  }
}

/// @nodoc
const $PleromaMyAccountWrapperOld = _$PleromaMyAccountWrapperOldTearOff();

/// @nodoc
mixin _$PleromaMyAccountWrapperOld {
  @HiveField(0)
  @JsonKey(name: 'remote_account')
  PleromaMyAccountWrapperOld get pleromaAccount =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaMyAccountWrapperOldCopyWith<PleromaMyAccountWrapperOld>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaMyAccountWrapperOldCopyWith<$Res> {
  factory $PleromaMyAccountWrapperOldCopyWith(PleromaMyAccountWrapperOld value,
          $Res Function(PleromaMyAccountWrapperOld) then) =
      _$PleromaMyAccountWrapperOldCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'remote_account')
          PleromaMyAccountWrapperOld pleromaAccount});

  $PleromaMyAccountWrapperOldCopyWith<$Res> get pleromaAccount;
}

/// @nodoc
class _$PleromaMyAccountWrapperOldCopyWithImpl<$Res>
    implements $PleromaMyAccountWrapperOldCopyWith<$Res> {
  _$PleromaMyAccountWrapperOldCopyWithImpl(this._value, this._then);

  final PleromaMyAccountWrapperOld _value;
  // ignore: unused_field
  final $Res Function(PleromaMyAccountWrapperOld) _then;

  @override
  $Res call({
    Object? pleromaAccount = freezed,
  }) {
    return _then(_value.copyWith(
      pleromaAccount: pleromaAccount == freezed
          ? _value.pleromaAccount
          : pleromaAccount // ignore: cast_nullable_to_non_nullable
              as PleromaMyAccountWrapperOld,
    ));
  }

  @override
  $PleromaMyAccountWrapperOldCopyWith<$Res> get pleromaAccount {
    return $PleromaMyAccountWrapperOldCopyWith<$Res>(_value.pleromaAccount,
        (value) {
      return _then(_value.copyWith(pleromaAccount: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaMyAccountWrapperOldCopyWith<$Res>
    implements $PleromaMyAccountWrapperOldCopyWith<$Res> {
  factory _$PleromaMyAccountWrapperOldCopyWith(
          _PleromaMyAccountWrapperOld value,
          $Res Function(_PleromaMyAccountWrapperOld) then) =
      __$PleromaMyAccountWrapperOldCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'remote_account')
          PleromaMyAccountWrapperOld pleromaAccount});

  @override
  $PleromaMyAccountWrapperOldCopyWith<$Res> get pleromaAccount;
}

/// @nodoc
class __$PleromaMyAccountWrapperOldCopyWithImpl<$Res>
    extends _$PleromaMyAccountWrapperOldCopyWithImpl<$Res>
    implements _$PleromaMyAccountWrapperOldCopyWith<$Res> {
  __$PleromaMyAccountWrapperOldCopyWithImpl(_PleromaMyAccountWrapperOld _value,
      $Res Function(_PleromaMyAccountWrapperOld) _then)
      : super(_value, (v) => _then(v as _PleromaMyAccountWrapperOld));

  @override
  _PleromaMyAccountWrapperOld get _value =>
      super._value as _PleromaMyAccountWrapperOld;

  @override
  $Res call({
    Object? pleromaAccount = freezed,
  }) {
    return _then(_PleromaMyAccountWrapperOld(
      pleromaAccount: pleromaAccount == freezed
          ? _value.pleromaAccount
          : pleromaAccount // ignore: cast_nullable_to_non_nullable
              as PleromaMyAccountWrapperOld,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaMyAccountWrapperOld extends _PleromaMyAccountWrapperOld {
  const _$_PleromaMyAccountWrapperOld(
      {@HiveField(0)
      @JsonKey(name: 'remote_account')
          required this.pleromaAccount})
      : super._();

  factory _$_PleromaMyAccountWrapperOld.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaMyAccountWrapperOldFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'remote_account')
  final PleromaMyAccountWrapperOld pleromaAccount;

  @override
  String toString() {
    return 'PleromaMyAccountWrapperOld(pleromaAccount: $pleromaAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaMyAccountWrapperOld &&
            (identical(other.pleromaAccount, pleromaAccount) ||
                const DeepCollectionEquality()
                    .equals(other.pleromaAccount, pleromaAccount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pleromaAccount);

  @JsonKey(ignore: true)
  @override
  _$PleromaMyAccountWrapperOldCopyWith<_PleromaMyAccountWrapperOld>
      get copyWith => __$PleromaMyAccountWrapperOldCopyWithImpl<
          _PleromaMyAccountWrapperOld>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaMyAccountWrapperOldToJson(this);
  }
}

abstract class _PleromaMyAccountWrapperOld extends PleromaMyAccountWrapperOld {
  const factory _PleromaMyAccountWrapperOld(
          {@HiveField(0)
          @JsonKey(name: 'remote_account')
              required PleromaMyAccountWrapperOld pleromaAccount}) =
      _$_PleromaMyAccountWrapperOld;
  const _PleromaMyAccountWrapperOld._() : super._();

  factory _PleromaMyAccountWrapperOld.fromJson(Map<String, dynamic> json) =
      _$_PleromaMyAccountWrapperOld.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'remote_account')
  PleromaMyAccountWrapperOld get pleromaAccount =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaMyAccountWrapperOldCopyWith<_PleromaMyAccountWrapperOld>
      get copyWith => throw _privateConstructorUsedError;
}
