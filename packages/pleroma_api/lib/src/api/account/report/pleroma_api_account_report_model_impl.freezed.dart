// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_account_report_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiAccountReport _$PleromaApiAccountReportFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiAccountReport.fromJson(json);
}

/// @nodoc
class _$PleromaApiAccountReportTearOff {
  const _$PleromaApiAccountReportTearOff();

  _PleromaApiAccountReport call(
      {@HiveField(0) required PleromaApiAccount? account,
      @HiveField(1) required List<PleromaApiStatus>? statuses,
      @HiveField(2) required PleromaApiAccount? user}) {
    return _PleromaApiAccountReport(
      account: account,
      statuses: statuses,
      user: user,
    );
  }

  PleromaApiAccountReport fromJson(Map<String, Object?> json) {
    return PleromaApiAccountReport.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiAccountReport = _$PleromaApiAccountReportTearOff();

/// @nodoc
mixin _$PleromaApiAccountReport {
  @HiveField(0)
  PleromaApiAccount? get account => throw _privateConstructorUsedError;
  @HiveField(1)
  List<PleromaApiStatus>? get statuses => throw _privateConstructorUsedError;
  @HiveField(2)
  PleromaApiAccount? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiAccountReportCopyWith<PleromaApiAccountReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiAccountReportCopyWith<$Res> {
  factory $PleromaApiAccountReportCopyWith(PleromaApiAccountReport value,
          $Res Function(PleromaApiAccountReport) then) =
      _$PleromaApiAccountReportCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) PleromaApiAccount? account,
      @HiveField(1) List<PleromaApiStatus>? statuses,
      @HiveField(2) PleromaApiAccount? user});

  $PleromaApiAccountCopyWith<$Res>? get account;
  $PleromaApiAccountCopyWith<$Res>? get user;
}

/// @nodoc
class _$PleromaApiAccountReportCopyWithImpl<$Res>
    implements $PleromaApiAccountReportCopyWith<$Res> {
  _$PleromaApiAccountReportCopyWithImpl(this._value, this._then);

  final PleromaApiAccountReport _value;
  // ignore: unused_field
  final $Res Function(PleromaApiAccountReport) _then;

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
              as PleromaApiAccount?,
      statuses: statuses == freezed
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiStatus>?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccount?,
    ));
  }

  @override
  $PleromaApiAccountCopyWith<$Res>? get account {
    if (_value.account == null) {
      return null;
    }

    return $PleromaApiAccountCopyWith<$Res>(_value.account!, (value) {
      return _then(_value.copyWith(account: value));
    });
  }

  @override
  $PleromaApiAccountCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $PleromaApiAccountCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiAccountReportCopyWith<$Res>
    implements $PleromaApiAccountReportCopyWith<$Res> {
  factory _$PleromaApiAccountReportCopyWith(_PleromaApiAccountReport value,
          $Res Function(_PleromaApiAccountReport) then) =
      __$PleromaApiAccountReportCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) PleromaApiAccount? account,
      @HiveField(1) List<PleromaApiStatus>? statuses,
      @HiveField(2) PleromaApiAccount? user});

  @override
  $PleromaApiAccountCopyWith<$Res>? get account;
  @override
  $PleromaApiAccountCopyWith<$Res>? get user;
}

/// @nodoc
class __$PleromaApiAccountReportCopyWithImpl<$Res>
    extends _$PleromaApiAccountReportCopyWithImpl<$Res>
    implements _$PleromaApiAccountReportCopyWith<$Res> {
  __$PleromaApiAccountReportCopyWithImpl(_PleromaApiAccountReport _value,
      $Res Function(_PleromaApiAccountReport) _then)
      : super(_value, (v) => _then(v as _PleromaApiAccountReport));

  @override
  _PleromaApiAccountReport get _value =>
      super._value as _PleromaApiAccountReport;

  @override
  $Res call({
    Object? account = freezed,
    Object? statuses = freezed,
    Object? user = freezed,
  }) {
    return _then(_PleromaApiAccountReport(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccount?,
      statuses: statuses == freezed
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiStatus>?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as PleromaApiAccount?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiAccountReport implements _PleromaApiAccountReport {
  const _$_PleromaApiAccountReport(
      {@HiveField(0) required this.account,
      @HiveField(1) required this.statuses,
      @HiveField(2) required this.user});

  factory _$_PleromaApiAccountReport.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiAccountReportFromJson(json);

  @override
  @HiveField(0)
  final PleromaApiAccount? account;
  @override
  @HiveField(1)
  final List<PleromaApiStatus>? statuses;
  @override
  @HiveField(2)
  final PleromaApiAccount? user;

  @override
  String toString() {
    return 'PleromaApiAccountReport(account: $account, statuses: $statuses, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiAccountReport &&
            (identical(other.account, account) || other.account == account) &&
            const DeepCollectionEquality().equals(other.statuses, statuses) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account,
      const DeepCollectionEquality().hash(statuses), user);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiAccountReportCopyWith<_PleromaApiAccountReport> get copyWith =>
      __$PleromaApiAccountReportCopyWithImpl<_PleromaApiAccountReport>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiAccountReportToJson(this);
  }
}

abstract class _PleromaApiAccountReport implements PleromaApiAccountReport {
  const factory _PleromaApiAccountReport(
          {@HiveField(0) required PleromaApiAccount? account,
          @HiveField(1) required List<PleromaApiStatus>? statuses,
          @HiveField(2) required PleromaApiAccount? user}) =
      _$_PleromaApiAccountReport;

  factory _PleromaApiAccountReport.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiAccountReport.fromJson;

  @override
  @HiveField(0)
  PleromaApiAccount? get account;
  @override
  @HiveField(1)
  List<PleromaApiStatus>? get statuses;
  @override
  @HiveField(2)
  PleromaApiAccount? get user;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiAccountReportCopyWith<_PleromaApiAccountReport> get copyWith =>
      throw _privateConstructorUsedError;
}
