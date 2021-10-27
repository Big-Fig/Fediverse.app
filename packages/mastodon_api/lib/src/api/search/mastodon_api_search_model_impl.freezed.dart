// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_search_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiSearchResult _$MastodonApiSearchResultFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiSearchResult.fromJson(json);
}

/// @nodoc
class _$MastodonApiSearchResultTearOff {
  const _$MastodonApiSearchResultTearOff();

  _MastodonApiSearchResult call(
      {@HiveField(0) required List<MastodonApiAccount> accounts,
      @HiveField(1) required List<MastodonApiTag> hashtags,
      @HiveField(2) required List<MastodonApiStatus> statuses}) {
    return _MastodonApiSearchResult(
      accounts: accounts,
      hashtags: hashtags,
      statuses: statuses,
    );
  }

  MastodonApiSearchResult fromJson(Map<String, Object?> json) {
    return MastodonApiSearchResult.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiSearchResult = _$MastodonApiSearchResultTearOff();

/// @nodoc
mixin _$MastodonApiSearchResult {
  @HiveField(0)
  List<MastodonApiAccount> get accounts => throw _privateConstructorUsedError;
  @HiveField(1)
  List<MastodonApiTag> get hashtags => throw _privateConstructorUsedError;
  @HiveField(2)
  List<MastodonApiStatus> get statuses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiSearchResultCopyWith<MastodonApiSearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiSearchResultCopyWith<$Res> {
  factory $MastodonApiSearchResultCopyWith(MastodonApiSearchResult value,
          $Res Function(MastodonApiSearchResult) then) =
      _$MastodonApiSearchResultCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) List<MastodonApiAccount> accounts,
      @HiveField(1) List<MastodonApiTag> hashtags,
      @HiveField(2) List<MastodonApiStatus> statuses});
}

/// @nodoc
class _$MastodonApiSearchResultCopyWithImpl<$Res>
    implements $MastodonApiSearchResultCopyWith<$Res> {
  _$MastodonApiSearchResultCopyWithImpl(this._value, this._then);

  final MastodonApiSearchResult _value;
  // ignore: unused_field
  final $Res Function(MastodonApiSearchResult) _then;

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
              as List<MastodonApiAccount>,
      hashtags: hashtags == freezed
          ? _value.hashtags
          : hashtags // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiTag>,
      statuses: statuses == freezed
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiStatus>,
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiSearchResultCopyWith<$Res>
    implements $MastodonApiSearchResultCopyWith<$Res> {
  factory _$MastodonApiSearchResultCopyWith(_MastodonApiSearchResult value,
          $Res Function(_MastodonApiSearchResult) then) =
      __$MastodonApiSearchResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) List<MastodonApiAccount> accounts,
      @HiveField(1) List<MastodonApiTag> hashtags,
      @HiveField(2) List<MastodonApiStatus> statuses});
}

/// @nodoc
class __$MastodonApiSearchResultCopyWithImpl<$Res>
    extends _$MastodonApiSearchResultCopyWithImpl<$Res>
    implements _$MastodonApiSearchResultCopyWith<$Res> {
  __$MastodonApiSearchResultCopyWithImpl(_MastodonApiSearchResult _value,
      $Res Function(_MastodonApiSearchResult) _then)
      : super(_value, (v) => _then(v as _MastodonApiSearchResult));

  @override
  _MastodonApiSearchResult get _value =>
      super._value as _MastodonApiSearchResult;

  @override
  $Res call({
    Object? accounts = freezed,
    Object? hashtags = freezed,
    Object? statuses = freezed,
  }) {
    return _then(_MastodonApiSearchResult(
      accounts: accounts == freezed
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiAccount>,
      hashtags: hashtags == freezed
          ? _value.hashtags
          : hashtags // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiTag>,
      statuses: statuses == freezed
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiStatus>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiSearchResult implements _MastodonApiSearchResult {
  const _$_MastodonApiSearchResult(
      {@HiveField(0) required this.accounts,
      @HiveField(1) required this.hashtags,
      @HiveField(2) required this.statuses});

  factory _$_MastodonApiSearchResult.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiSearchResultFromJson(json);

  @override
  @HiveField(0)
  final List<MastodonApiAccount> accounts;
  @override
  @HiveField(1)
  final List<MastodonApiTag> hashtags;
  @override
  @HiveField(2)
  final List<MastodonApiStatus> statuses;

  @override
  String toString() {
    return 'MastodonApiSearchResult(accounts: $accounts, hashtags: $hashtags, statuses: $statuses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiSearchResult &&
            const DeepCollectionEquality().equals(other.accounts, accounts) &&
            const DeepCollectionEquality().equals(other.hashtags, hashtags) &&
            const DeepCollectionEquality().equals(other.statuses, statuses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(accounts),
      const DeepCollectionEquality().hash(hashtags),
      const DeepCollectionEquality().hash(statuses));

  @JsonKey(ignore: true)
  @override
  _$MastodonApiSearchResultCopyWith<_MastodonApiSearchResult> get copyWith =>
      __$MastodonApiSearchResultCopyWithImpl<_MastodonApiSearchResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiSearchResultToJson(this);
  }
}

abstract class _MastodonApiSearchResult implements MastodonApiSearchResult {
  const factory _MastodonApiSearchResult(
          {@HiveField(0) required List<MastodonApiAccount> accounts,
          @HiveField(1) required List<MastodonApiTag> hashtags,
          @HiveField(2) required List<MastodonApiStatus> statuses}) =
      _$_MastodonApiSearchResult;

  factory _MastodonApiSearchResult.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiSearchResult.fromJson;

  @override
  @HiveField(0)
  List<MastodonApiAccount> get accounts;
  @override
  @HiveField(1)
  List<MastodonApiTag> get hashtags;
  @override
  @HiveField(2)
  List<MastodonApiStatus> get statuses;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiSearchResultCopyWith<_MastodonApiSearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}
