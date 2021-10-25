// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_search_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiSearchResult _$UnifediApiSearchResultFromJson(
    Map<String, dynamic> json) {
  return _UnifediApiSearchResult.fromJson(json);
}

/// @nodoc
class _$UnifediApiSearchResultTearOff {
  const _$UnifediApiSearchResultTearOff();

  _UnifediApiSearchResult call(
      {@HiveField(0) required List<UnifediApiAccount> accounts,
      @HiveField(1) required List<UnifediApiTag> hashtags,
      @HiveField(2) required List<UnifediApiStatus> statuses}) {
    return _UnifediApiSearchResult(
      accounts: accounts,
      hashtags: hashtags,
      statuses: statuses,
    );
  }

  UnifediApiSearchResult fromJson(Map<String, Object> json) {
    return UnifediApiSearchResult.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiSearchResult = _$UnifediApiSearchResultTearOff();

/// @nodoc
mixin _$UnifediApiSearchResult {
  @HiveField(0)
  List<UnifediApiAccount> get accounts => throw _privateConstructorUsedError;
  @HiveField(1)
  List<UnifediApiTag> get hashtags => throw _privateConstructorUsedError;
  @HiveField(2)
  List<UnifediApiStatus> get statuses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiSearchResultCopyWith<UnifediApiSearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiSearchResultCopyWith<$Res> {
  factory $UnifediApiSearchResultCopyWith(UnifediApiSearchResult value,
          $Res Function(UnifediApiSearchResult) then) =
      _$UnifediApiSearchResultCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) List<UnifediApiAccount> accounts,
      @HiveField(1) List<UnifediApiTag> hashtags,
      @HiveField(2) List<UnifediApiStatus> statuses});
}

/// @nodoc
class _$UnifediApiSearchResultCopyWithImpl<$Res>
    implements $UnifediApiSearchResultCopyWith<$Res> {
  _$UnifediApiSearchResultCopyWithImpl(this._value, this._then);

  final UnifediApiSearchResult _value;
  // ignore: unused_field
  final $Res Function(UnifediApiSearchResult) _then;

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
              as List<UnifediApiAccount>,
      hashtags: hashtags == freezed
          ? _value.hashtags
          : hashtags // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiTag>,
      statuses: statuses == freezed
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiStatus>,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiSearchResultCopyWith<$Res>
    implements $UnifediApiSearchResultCopyWith<$Res> {
  factory _$UnifediApiSearchResultCopyWith(_UnifediApiSearchResult value,
          $Res Function(_UnifediApiSearchResult) then) =
      __$UnifediApiSearchResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) List<UnifediApiAccount> accounts,
      @HiveField(1) List<UnifediApiTag> hashtags,
      @HiveField(2) List<UnifediApiStatus> statuses});
}

/// @nodoc
class __$UnifediApiSearchResultCopyWithImpl<$Res>
    extends _$UnifediApiSearchResultCopyWithImpl<$Res>
    implements _$UnifediApiSearchResultCopyWith<$Res> {
  __$UnifediApiSearchResultCopyWithImpl(_UnifediApiSearchResult _value,
      $Res Function(_UnifediApiSearchResult) _then)
      : super(_value, (v) => _then(v as _UnifediApiSearchResult));

  @override
  _UnifediApiSearchResult get _value => super._value as _UnifediApiSearchResult;

  @override
  $Res call({
    Object? accounts = freezed,
    Object? hashtags = freezed,
    Object? statuses = freezed,
  }) {
    return _then(_UnifediApiSearchResult(
      accounts: accounts == freezed
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiAccount>,
      hashtags: hashtags == freezed
          ? _value.hashtags
          : hashtags // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiTag>,
      statuses: statuses == freezed
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<UnifediApiStatus>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiSearchResult implements _UnifediApiSearchResult {
  const _$_UnifediApiSearchResult(
      {@HiveField(0) required this.accounts,
      @HiveField(1) required this.hashtags,
      @HiveField(2) required this.statuses});

  factory _$_UnifediApiSearchResult.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiSearchResultFromJson(json);

  @override
  @HiveField(0)
  final List<UnifediApiAccount> accounts;
  @override
  @HiveField(1)
  final List<UnifediApiTag> hashtags;
  @override
  @HiveField(2)
  final List<UnifediApiStatus> statuses;

  @override
  String toString() {
    return 'UnifediApiSearchResult(accounts: $accounts, hashtags: $hashtags, statuses: $statuses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiSearchResult &&
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
  _$UnifediApiSearchResultCopyWith<_UnifediApiSearchResult> get copyWith =>
      __$UnifediApiSearchResultCopyWithImpl<_UnifediApiSearchResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiSearchResultToJson(this);
  }
}

abstract class _UnifediApiSearchResult implements UnifediApiSearchResult {
  const factory _UnifediApiSearchResult(
          {@HiveField(0) required List<UnifediApiAccount> accounts,
          @HiveField(1) required List<UnifediApiTag> hashtags,
          @HiveField(2) required List<UnifediApiStatus> statuses}) =
      _$_UnifediApiSearchResult;

  factory _UnifediApiSearchResult.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiSearchResult.fromJson;

  @override
  @HiveField(0)
  List<UnifediApiAccount> get accounts => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  List<UnifediApiTag> get hashtags => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  List<UnifediApiStatus> get statuses => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiSearchResultCopyWith<_UnifediApiSearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}
