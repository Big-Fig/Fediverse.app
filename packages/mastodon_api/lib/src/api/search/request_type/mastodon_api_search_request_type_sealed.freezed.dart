// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_search_request_type_sealed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MastodonApiSearchRequestTypeTearOff {
  const _$MastodonApiSearchRequestTypeTearOff();

  _Accounts accounts(
      {String stringValue = MastodonApiSearchRequestType.accountsStringValue}) {
    return _Accounts(
      stringValue: stringValue,
    );
  }

  _Hashtags hashtags(
      {String stringValue = MastodonApiSearchRequestType.hashtagsStringValue}) {
    return _Hashtags(
      stringValue: stringValue,
    );
  }

  _Statuses statuses(
      {String stringValue = MastodonApiSearchRequestType.statusesStringValue}) {
    return _Statuses(
      stringValue: stringValue,
    );
  }
}

/// @nodoc
const $MastodonApiSearchRequestType = _$MastodonApiSearchRequestTypeTearOff();

/// @nodoc
mixin _$MastodonApiSearchRequestType {
  String get stringValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) accounts,
    required TResult Function(String stringValue) hashtags,
    required TResult Function(String stringValue) statuses,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? accounts,
    TResult Function(String stringValue)? hashtags,
    TResult Function(String stringValue)? statuses,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? accounts,
    TResult Function(String stringValue)? hashtags,
    TResult Function(String stringValue)? statuses,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Accounts value) accounts,
    required TResult Function(_Hashtags value) hashtags,
    required TResult Function(_Statuses value) statuses,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Accounts value)? accounts,
    TResult Function(_Hashtags value)? hashtags,
    TResult Function(_Statuses value)? statuses,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Accounts value)? accounts,
    TResult Function(_Hashtags value)? hashtags,
    TResult Function(_Statuses value)? statuses,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MastodonApiSearchRequestTypeCopyWith<MastodonApiSearchRequestType>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiSearchRequestTypeCopyWith<$Res> {
  factory $MastodonApiSearchRequestTypeCopyWith(
          MastodonApiSearchRequestType value,
          $Res Function(MastodonApiSearchRequestType) then) =
      _$MastodonApiSearchRequestTypeCopyWithImpl<$Res>;
  $Res call({String stringValue});
}

/// @nodoc
class _$MastodonApiSearchRequestTypeCopyWithImpl<$Res>
    implements $MastodonApiSearchRequestTypeCopyWith<$Res> {
  _$MastodonApiSearchRequestTypeCopyWithImpl(this._value, this._then);

  final MastodonApiSearchRequestType _value;
  // ignore: unused_field
  final $Res Function(MastodonApiSearchRequestType) _then;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_value.copyWith(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AccountsCopyWith<$Res>
    implements $MastodonApiSearchRequestTypeCopyWith<$Res> {
  factory _$AccountsCopyWith(_Accounts value, $Res Function(_Accounts) then) =
      __$AccountsCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$AccountsCopyWithImpl<$Res>
    extends _$MastodonApiSearchRequestTypeCopyWithImpl<$Res>
    implements _$AccountsCopyWith<$Res> {
  __$AccountsCopyWithImpl(_Accounts _value, $Res Function(_Accounts) _then)
      : super(_value, (v) => _then(v as _Accounts));

  @override
  _Accounts get _value => super._value as _Accounts;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Accounts(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Accounts implements _Accounts {
  const _$_Accounts(
      {this.stringValue = MastodonApiSearchRequestType.accountsStringValue});

  @JsonKey(defaultValue: MastodonApiSearchRequestType.accountsStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiSearchRequestType.accounts(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Accounts &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$AccountsCopyWith<_Accounts> get copyWith =>
      __$AccountsCopyWithImpl<_Accounts>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) accounts,
    required TResult Function(String stringValue) hashtags,
    required TResult Function(String stringValue) statuses,
  }) {
    return accounts(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? accounts,
    TResult Function(String stringValue)? hashtags,
    TResult Function(String stringValue)? statuses,
  }) {
    return accounts?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? accounts,
    TResult Function(String stringValue)? hashtags,
    TResult Function(String stringValue)? statuses,
    required TResult orElse(),
  }) {
    if (accounts != null) {
      return accounts(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Accounts value) accounts,
    required TResult Function(_Hashtags value) hashtags,
    required TResult Function(_Statuses value) statuses,
  }) {
    return accounts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Accounts value)? accounts,
    TResult Function(_Hashtags value)? hashtags,
    TResult Function(_Statuses value)? statuses,
  }) {
    return accounts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Accounts value)? accounts,
    TResult Function(_Hashtags value)? hashtags,
    TResult Function(_Statuses value)? statuses,
    required TResult orElse(),
  }) {
    if (accounts != null) {
      return accounts(this);
    }
    return orElse();
  }
}

abstract class _Accounts implements MastodonApiSearchRequestType {
  const factory _Accounts({String stringValue}) = _$_Accounts;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$AccountsCopyWith<_Accounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$HashtagsCopyWith<$Res>
    implements $MastodonApiSearchRequestTypeCopyWith<$Res> {
  factory _$HashtagsCopyWith(_Hashtags value, $Res Function(_Hashtags) then) =
      __$HashtagsCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$HashtagsCopyWithImpl<$Res>
    extends _$MastodonApiSearchRequestTypeCopyWithImpl<$Res>
    implements _$HashtagsCopyWith<$Res> {
  __$HashtagsCopyWithImpl(_Hashtags _value, $Res Function(_Hashtags) _then)
      : super(_value, (v) => _then(v as _Hashtags));

  @override
  _Hashtags get _value => super._value as _Hashtags;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Hashtags(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Hashtags implements _Hashtags {
  const _$_Hashtags(
      {this.stringValue = MastodonApiSearchRequestType.hashtagsStringValue});

  @JsonKey(defaultValue: MastodonApiSearchRequestType.hashtagsStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiSearchRequestType.hashtags(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Hashtags &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$HashtagsCopyWith<_Hashtags> get copyWith =>
      __$HashtagsCopyWithImpl<_Hashtags>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) accounts,
    required TResult Function(String stringValue) hashtags,
    required TResult Function(String stringValue) statuses,
  }) {
    return hashtags(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? accounts,
    TResult Function(String stringValue)? hashtags,
    TResult Function(String stringValue)? statuses,
  }) {
    return hashtags?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? accounts,
    TResult Function(String stringValue)? hashtags,
    TResult Function(String stringValue)? statuses,
    required TResult orElse(),
  }) {
    if (hashtags != null) {
      return hashtags(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Accounts value) accounts,
    required TResult Function(_Hashtags value) hashtags,
    required TResult Function(_Statuses value) statuses,
  }) {
    return hashtags(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Accounts value)? accounts,
    TResult Function(_Hashtags value)? hashtags,
    TResult Function(_Statuses value)? statuses,
  }) {
    return hashtags?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Accounts value)? accounts,
    TResult Function(_Hashtags value)? hashtags,
    TResult Function(_Statuses value)? statuses,
    required TResult orElse(),
  }) {
    if (hashtags != null) {
      return hashtags(this);
    }
    return orElse();
  }
}

abstract class _Hashtags implements MastodonApiSearchRequestType {
  const factory _Hashtags({String stringValue}) = _$_Hashtags;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$HashtagsCopyWith<_Hashtags> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$StatusesCopyWith<$Res>
    implements $MastodonApiSearchRequestTypeCopyWith<$Res> {
  factory _$StatusesCopyWith(_Statuses value, $Res Function(_Statuses) then) =
      __$StatusesCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$StatusesCopyWithImpl<$Res>
    extends _$MastodonApiSearchRequestTypeCopyWithImpl<$Res>
    implements _$StatusesCopyWith<$Res> {
  __$StatusesCopyWithImpl(_Statuses _value, $Res Function(_Statuses) _then)
      : super(_value, (v) => _then(v as _Statuses));

  @override
  _Statuses get _value => super._value as _Statuses;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Statuses(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Statuses implements _Statuses {
  const _$_Statuses(
      {this.stringValue = MastodonApiSearchRequestType.statusesStringValue});

  @JsonKey(defaultValue: MastodonApiSearchRequestType.statusesStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiSearchRequestType.statuses(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Statuses &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$StatusesCopyWith<_Statuses> get copyWith =>
      __$StatusesCopyWithImpl<_Statuses>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) accounts,
    required TResult Function(String stringValue) hashtags,
    required TResult Function(String stringValue) statuses,
  }) {
    return statuses(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? accounts,
    TResult Function(String stringValue)? hashtags,
    TResult Function(String stringValue)? statuses,
  }) {
    return statuses?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? accounts,
    TResult Function(String stringValue)? hashtags,
    TResult Function(String stringValue)? statuses,
    required TResult orElse(),
  }) {
    if (statuses != null) {
      return statuses(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Accounts value) accounts,
    required TResult Function(_Hashtags value) hashtags,
    required TResult Function(_Statuses value) statuses,
  }) {
    return statuses(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Accounts value)? accounts,
    TResult Function(_Hashtags value)? hashtags,
    TResult Function(_Statuses value)? statuses,
  }) {
    return statuses?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Accounts value)? accounts,
    TResult Function(_Hashtags value)? hashtags,
    TResult Function(_Statuses value)? statuses,
    required TResult orElse(),
  }) {
    if (statuses != null) {
      return statuses(this);
    }
    return orElse();
  }
}

abstract class _Statuses implements MastodonApiSearchRequestType {
  const factory _Statuses({String stringValue}) = _$_Statuses;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$StatusesCopyWith<_Statuses> get copyWith =>
      throw _privateConstructorUsedError;
}
