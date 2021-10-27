// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiMyAccountWrapper _$UnifediApiMyAccountWrapperFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiMyAccountWrapper.fromJson(json);
}

/// @nodoc
class _$UnifediApiMyAccountWrapperTearOff {
  const _$UnifediApiMyAccountWrapperTearOff();

  _UnifediApiMyAccountWrapper call(
      {@HiveField(0)
      @JsonKey(name: 'remote_account')
          required UnifediApiMyAccount unifediApiAccount}) {
    return _UnifediApiMyAccountWrapper(
      unifediApiAccount: unifediApiAccount,
    );
  }

  UnifediApiMyAccountWrapper fromJson(Map<String, Object?> json) {
    return UnifediApiMyAccountWrapper.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiMyAccountWrapper = _$UnifediApiMyAccountWrapperTearOff();

/// @nodoc
mixin _$UnifediApiMyAccountWrapper {
  @HiveField(0)
  @JsonKey(name: 'remote_account')
  UnifediApiMyAccount get unifediApiAccount =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiMyAccountWrapperCopyWith<UnifediApiMyAccountWrapper>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiMyAccountWrapperCopyWith<$Res> {
  factory $UnifediApiMyAccountWrapperCopyWith(UnifediApiMyAccountWrapper value,
          $Res Function(UnifediApiMyAccountWrapper) then) =
      _$UnifediApiMyAccountWrapperCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'remote_account')
          UnifediApiMyAccount unifediApiAccount});

  $UnifediApiMyAccountCopyWith<$Res> get unifediApiAccount;
}

/// @nodoc
class _$UnifediApiMyAccountWrapperCopyWithImpl<$Res>
    implements $UnifediApiMyAccountWrapperCopyWith<$Res> {
  _$UnifediApiMyAccountWrapperCopyWithImpl(this._value, this._then);

  final UnifediApiMyAccountWrapper _value;
  // ignore: unused_field
  final $Res Function(UnifediApiMyAccountWrapper) _then;

  @override
  $Res call({
    Object? unifediApiAccount = freezed,
  }) {
    return _then(_value.copyWith(
      unifediApiAccount: unifediApiAccount == freezed
          ? _value.unifediApiAccount
          : unifediApiAccount // ignore: cast_nullable_to_non_nullable
              as UnifediApiMyAccount,
    ));
  }

  @override
  $UnifediApiMyAccountCopyWith<$Res> get unifediApiAccount {
    return $UnifediApiMyAccountCopyWith<$Res>(_value.unifediApiAccount,
        (value) {
      return _then(_value.copyWith(unifediApiAccount: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiMyAccountWrapperCopyWith<$Res>
    implements $UnifediApiMyAccountWrapperCopyWith<$Res> {
  factory _$UnifediApiMyAccountWrapperCopyWith(
          _UnifediApiMyAccountWrapper value,
          $Res Function(_UnifediApiMyAccountWrapper) then) =
      __$UnifediApiMyAccountWrapperCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'remote_account')
          UnifediApiMyAccount unifediApiAccount});

  @override
  $UnifediApiMyAccountCopyWith<$Res> get unifediApiAccount;
}

/// @nodoc
class __$UnifediApiMyAccountWrapperCopyWithImpl<$Res>
    extends _$UnifediApiMyAccountWrapperCopyWithImpl<$Res>
    implements _$UnifediApiMyAccountWrapperCopyWith<$Res> {
  __$UnifediApiMyAccountWrapperCopyWithImpl(_UnifediApiMyAccountWrapper _value,
      $Res Function(_UnifediApiMyAccountWrapper) _then)
      : super(_value, (v) => _then(v as _UnifediApiMyAccountWrapper));

  @override
  _UnifediApiMyAccountWrapper get _value =>
      super._value as _UnifediApiMyAccountWrapper;

  @override
  $Res call({
    Object? unifediApiAccount = freezed,
  }) {
    return _then(_UnifediApiMyAccountWrapper(
      unifediApiAccount: unifediApiAccount == freezed
          ? _value.unifediApiAccount
          : unifediApiAccount // ignore: cast_nullable_to_non_nullable
              as UnifediApiMyAccount,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiMyAccountWrapper extends _UnifediApiMyAccountWrapper {
  const _$_UnifediApiMyAccountWrapper(
      {@HiveField(0)
      @JsonKey(name: 'remote_account')
          required this.unifediApiAccount})
      : super._();

  factory _$_UnifediApiMyAccountWrapper.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiMyAccountWrapperFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'remote_account')
  final UnifediApiMyAccount unifediApiAccount;

  @override
  String toString() {
    return 'UnifediApiMyAccountWrapper(unifediApiAccount: $unifediApiAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiMyAccountWrapper &&
            (identical(other.unifediApiAccount, unifediApiAccount) ||
                other.unifediApiAccount == unifediApiAccount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, unifediApiAccount);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiMyAccountWrapperCopyWith<_UnifediApiMyAccountWrapper>
      get copyWith => __$UnifediApiMyAccountWrapperCopyWithImpl<
          _UnifediApiMyAccountWrapper>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiMyAccountWrapperToJson(this);
  }
}

abstract class _UnifediApiMyAccountWrapper extends UnifediApiMyAccountWrapper {
  const factory _UnifediApiMyAccountWrapper(
          {@HiveField(0)
          @JsonKey(name: 'remote_account')
              required UnifediApiMyAccount unifediApiAccount}) =
      _$_UnifediApiMyAccountWrapper;
  const _UnifediApiMyAccountWrapper._() : super._();

  factory _UnifediApiMyAccountWrapper.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiMyAccountWrapper.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'remote_account')
  UnifediApiMyAccount get unifediApiAccount;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiMyAccountWrapperCopyWith<_UnifediApiMyAccountWrapper>
      get copyWith => throw _privateConstructorUsedError;
}
