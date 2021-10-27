// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_account_report_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiAccountReport _$UnifediApiAccountReportFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiAccountReport.fromJson(json);
}

/// @nodoc
class _$UnifediApiAccountReportTearOff {
  const _$UnifediApiAccountReportTearOff();

  _UnifediApiAccountReport call(
      {@HiveField(0) required UnifediApiAccount? account,
      @HiveField(1) required List<UnifediApiStatus>? statuses,
      @HiveField(2) required UnifediApiAccount? user}) {
    return _UnifediApiAccountReport(
      account: account,
      statuses: statuses,
      user: user,
    );
  }

  UnifediApiAccountReport fromJson(Map<String, Object?> json) {
    return UnifediApiAccountReport.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiAccountReport = _$UnifediApiAccountReportTearOff();

/// @nodoc
mixin _$UnifediApiAccountReport {
  @HiveField(0)
  UnifediApiAccount? get account => throw _privateConstructorUsedError;
  @HiveField(1)
  List<UnifediApiStatus>? get statuses => throw _privateConstructorUsedError;
  @HiveField(2)
  UnifediApiAccount? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiAccountReportCopyWith<UnifediApiAccountReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiAccountReportCopyWith<$Res> {
  factory $UnifediApiAccountReportCopyWith(UnifediApiAccountReport value,
          $Res Function(UnifediApiAccountReport) then) =
      _$UnifediApiAccountReportCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) UnifediApiAccount? account,
      @HiveField(1) List<UnifediApiStatus>? statuses,
      @HiveField(2) UnifediApiAccount? user});

  $UnifediApiAccountCopyWith<$Res>? get account;
  $UnifediApiAccountCopyWith<$Res>? get user;
}

/// @nodoc
class _$UnifediApiAccountReportCopyWithImpl<$Res>
    implements $UnifediApiAccountReportCopyWith<$Res> {
  _$UnifediApiAccountReportCopyWithImpl(this._value, this._then);

  final UnifediApiAccountReport _value;
  // ignore: unused_field
  final $Res Function(UnifediApiAccountReport) _then;

  @override
  $Res call({
    Object? account = freezed,
    Object? statuses = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccount?,
      statuses: statuses == freezed
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiStatus>?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccount?,
    ));
  }

  @override
  $UnifediApiAccountCopyWith<$Res>? get account {
    if (_value.account == null) {
      return null;
    }

    return $UnifediApiAccountCopyWith<$Res>(_value.account!, (value) {
      return _then(_value.copyWith(account: value));
    });
  }

  @override
  $UnifediApiAccountCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UnifediApiAccountCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$UnifediApiAccountReportCopyWith<$Res>
    implements $UnifediApiAccountReportCopyWith<$Res> {
  factory _$UnifediApiAccountReportCopyWith(_UnifediApiAccountReport value,
          $Res Function(_UnifediApiAccountReport) then) =
      __$UnifediApiAccountReportCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) UnifediApiAccount? account,
      @HiveField(1) List<UnifediApiStatus>? statuses,
      @HiveField(2) UnifediApiAccount? user});

  @override
  $UnifediApiAccountCopyWith<$Res>? get account;
  @override
  $UnifediApiAccountCopyWith<$Res>? get user;
}

/// @nodoc
class __$UnifediApiAccountReportCopyWithImpl<$Res>
    extends _$UnifediApiAccountReportCopyWithImpl<$Res>
    implements _$UnifediApiAccountReportCopyWith<$Res> {
  __$UnifediApiAccountReportCopyWithImpl(_UnifediApiAccountReport _value,
      $Res Function(_UnifediApiAccountReport) _then)
      : super(_value, (v) => _then(v as _UnifediApiAccountReport));

  @override
  _UnifediApiAccountReport get _value =>
      super._value as _UnifediApiAccountReport;

  @override
  $Res call({
    Object? account = freezed,
    Object? statuses = freezed,
    Object? user = freezed,
  }) {
    return _then(_UnifediApiAccountReport(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccount?,
      statuses: statuses == freezed
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiStatus>?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UnifediApiAccount?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiAccountReport implements _UnifediApiAccountReport {
  const _$_UnifediApiAccountReport(
      {@HiveField(0) required this.account,
      @HiveField(1) required this.statuses,
      @HiveField(2) required this.user});

  factory _$_UnifediApiAccountReport.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiAccountReportFromJson(json);

  @override
  @HiveField(0)
  final UnifediApiAccount? account;
  @override
  @HiveField(1)
  final List<UnifediApiStatus>? statuses;
  @override
  @HiveField(2)
  final UnifediApiAccount? user;

  @override
  String toString() {
    return 'UnifediApiAccountReport(account: $account, statuses: $statuses, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnifediApiAccountReport &&
            (identical(other.account, account) || other.account == account) &&
            const DeepCollectionEquality().equals(other.statuses, statuses) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account,
      const DeepCollectionEquality().hash(statuses), user);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiAccountReportCopyWith<_UnifediApiAccountReport> get copyWith =>
      __$UnifediApiAccountReportCopyWithImpl<_UnifediApiAccountReport>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiAccountReportToJson(this);
  }
}

abstract class _UnifediApiAccountReport implements UnifediApiAccountReport {
  const factory _UnifediApiAccountReport(
          {@HiveField(0) required UnifediApiAccount? account,
          @HiveField(1) required List<UnifediApiStatus>? statuses,
          @HiveField(2) required UnifediApiAccount? user}) =
      _$_UnifediApiAccountReport;

  factory _UnifediApiAccountReport.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiAccountReport.fromJson;

  @override
  @HiveField(0)
  UnifediApiAccount? get account;
  @override
  @HiveField(1)
  List<UnifediApiStatus>? get statuses;
  @override
  @HiveField(2)
  UnifediApiAccount? get user;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiAccountReportCopyWith<_UnifediApiAccountReport> get copyWith =>
      throw _privateConstructorUsedError;
}
