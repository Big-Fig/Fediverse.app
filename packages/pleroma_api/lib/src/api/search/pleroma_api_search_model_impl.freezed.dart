// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_search_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiSearchResult _$PleromaApiSearchResultFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiSearchResult.fromJson(json);
}

/// @nodoc
class _$PleromaApiSearchResultTearOff {
  const _$PleromaApiSearchResultTearOff();

  _PleromaApiSearchResult call(
      {@HiveField(0) required List<PleromaApiAccount> accounts,
      @HiveField(1) required List<PleromaApiTag> hashtags,
      @HiveField(2) required List<PleromaApiStatus> statuses}) {
    return _PleromaApiSearchResult(
      accounts: accounts,
      hashtags: hashtags,
      statuses: statuses,
    );
  }

  PleromaApiSearchResult fromJson(Map<String, Object> json) {
    return PleromaApiSearchResult.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiSearchResult = _$PleromaApiSearchResultTearOff();

/// @nodoc
mixin _$PleromaApiSearchResult {
  @HiveField(0)
  List<PleromaApiAccount> get accounts => throw _privateConstructorUsedError;
  @HiveField(1)
  List<PleromaApiTag> get hashtags => throw _privateConstructorUsedError;
  @HiveField(2)
  List<PleromaApiStatus> get statuses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiSearchResultCopyWith<PleromaApiSearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiSearchResultCopyWith<$Res> {
  factory $PleromaApiSearchResultCopyWith(PleromaApiSearchResult value,
          $Res Function(PleromaApiSearchResult) then) =
      _$PleromaApiSearchResultCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) List<PleromaApiAccount> accounts,
      @HiveField(1) List<PleromaApiTag> hashtags,
      @HiveField(2) List<PleromaApiStatus> statuses});
}

/// @nodoc
class _$PleromaApiSearchResultCopyWithImpl<$Res>
    implements $PleromaApiSearchResultCopyWith<$Res> {
  _$PleromaApiSearchResultCopyWithImpl(this._value, this._then);

  final PleromaApiSearchResult _value;
  // ignore: unused_field
  final $Res Function(PleromaApiSearchResult) _then;

  @override
  $Res call({
    Object? accounts = freezed,
    Object? hashtags = freezed,
    Object? statuses = freezed,
  }) {
    return _then(_value.copyWith(
      accounts: accounts == freezed
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiAccount>,
      hashtags: hashtags == freezed
          ? _value.hashtags
          : hashtags // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiTag>,
      statuses: statuses == freezed
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiStatus>,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiSearchResultCopyWith<$Res>
    implements $PleromaApiSearchResultCopyWith<$Res> {
  factory _$PleromaApiSearchResultCopyWith(_PleromaApiSearchResult value,
          $Res Function(_PleromaApiSearchResult) then) =
      __$PleromaApiSearchResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) List<PleromaApiAccount> accounts,
      @HiveField(1) List<PleromaApiTag> hashtags,
      @HiveField(2) List<PleromaApiStatus> statuses});
}

/// @nodoc
class __$PleromaApiSearchResultCopyWithImpl<$Res>
    extends _$PleromaApiSearchResultCopyWithImpl<$Res>
    implements _$PleromaApiSearchResultCopyWith<$Res> {
  __$PleromaApiSearchResultCopyWithImpl(_PleromaApiSearchResult _value,
      $Res Function(_PleromaApiSearchResult) _then)
      : super(_value, (v) => _then(v as _PleromaApiSearchResult));

  @override
  _PleromaApiSearchResult get _value => super._value as _PleromaApiSearchResult;

  @override
  $Res call({
    Object? accounts = freezed,
    Object? hashtags = freezed,
    Object? statuses = freezed,
  }) {
    return _then(_PleromaApiSearchResult(
      accounts: accounts == freezed
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiAccount>,
      hashtags: hashtags == freezed
          ? _value.hashtags
          : hashtags // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiTag>,
      statuses: statuses == freezed
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<PleromaApiStatus>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiSearchResult implements _PleromaApiSearchResult {
  const _$_PleromaApiSearchResult(
      {@HiveField(0) required this.accounts,
      @HiveField(1) required this.hashtags,
      @HiveField(2) required this.statuses});

  factory _$_PleromaApiSearchResult.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiSearchResultFromJson(json);

  @override
  @HiveField(0)
  final List<PleromaApiAccount> accounts;
  @override
  @HiveField(1)
  final List<PleromaApiTag> hashtags;
  @override
  @HiveField(2)
  final List<PleromaApiStatus> statuses;

  @override
  String toString() {
    return 'PleromaApiSearchResult(accounts: $accounts, hashtags: $hashtags, statuses: $statuses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiSearchResult &&
            (identical(other.accounts, accounts) ||
                const DeepCollectionEquality()
                    .equals(other.accounts, accounts)) &&
            (identical(other.hashtags, hashtags) ||
                const DeepCollectionEquality()
                    .equals(other.hashtags, hashtags)) &&
            (identical(other.statuses, statuses) ||
                const DeepCollectionEquality()
                    .equals(other.statuses, statuses)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(accounts) ^
      const DeepCollectionEquality().hash(hashtags) ^
      const DeepCollectionEquality().hash(statuses);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiSearchResultCopyWith<_PleromaApiSearchResult> get copyWith =>
      __$PleromaApiSearchResultCopyWithImpl<_PleromaApiSearchResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiSearchResultToJson(this);
  }
}

abstract class _PleromaApiSearchResult implements PleromaApiSearchResult {
  const factory _PleromaApiSearchResult(
          {@HiveField(0) required List<PleromaApiAccount> accounts,
          @HiveField(1) required List<PleromaApiTag> hashtags,
          @HiveField(2) required List<PleromaApiStatus> statuses}) =
      _$_PleromaApiSearchResult;

  factory _PleromaApiSearchResult.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiSearchResult.fromJson;

  @override
  @HiveField(0)
  List<PleromaApiAccount> get accounts => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  List<PleromaApiTag> get hashtags => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  List<PleromaApiStatus> get statuses => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiSearchResultCopyWith<_PleromaApiSearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}
