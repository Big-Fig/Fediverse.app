// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_card_replies_policy_type_sealed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UnifediApiListRepliesPolicyTypeTearOff {
  const _$UnifediApiListRepliesPolicyTypeTearOff();

  _Followed followed(
      {String stringValue =
          UnifediApiListRepliesPolicyType.followedStringValue}) {
    return _Followed(
      stringValue: stringValue,
    );
  }

  _List list(
      {String stringValue = UnifediApiListRepliesPolicyType.listStringValue}) {
    return _List(
      stringValue: stringValue,
    );
  }

  _None none(
      {String stringValue = UnifediApiListRepliesPolicyType.noneStringValue}) {
    return _None(
      stringValue: stringValue,
    );
  }

  _Unknown unknown({required String stringValue}) {
    return _Unknown(
      stringValue: stringValue,
    );
  }
}

/// @nodoc
const $UnifediApiListRepliesPolicyType =
    _$UnifediApiListRepliesPolicyTypeTearOff();

/// @nodoc
mixin _$UnifediApiListRepliesPolicyType {
  String get stringValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) followed,
    required TResult Function(String stringValue) list,
    required TResult Function(String stringValue) none,
    required TResult Function(String stringValue) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? followed,
    TResult Function(String stringValue)? list,
    TResult Function(String stringValue)? none,
    TResult Function(String stringValue)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? followed,
    TResult Function(String stringValue)? list,
    TResult Function(String stringValue)? none,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Followed value) followed,
    required TResult Function(_List value) list,
    required TResult Function(_None value) none,
    required TResult Function(_Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Followed value)? followed,
    TResult Function(_List value)? list,
    TResult Function(_None value)? none,
    TResult Function(_Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Followed value)? followed,
    TResult Function(_List value)? list,
    TResult Function(_None value)? none,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnifediApiListRepliesPolicyTypeCopyWith<UnifediApiListRepliesPolicyType>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiListRepliesPolicyTypeCopyWith<$Res> {
  factory $UnifediApiListRepliesPolicyTypeCopyWith(
          UnifediApiListRepliesPolicyType value,
          $Res Function(UnifediApiListRepliesPolicyType) then) =
      _$UnifediApiListRepliesPolicyTypeCopyWithImpl<$Res>;
  $Res call({String stringValue});
}

/// @nodoc
class _$UnifediApiListRepliesPolicyTypeCopyWithImpl<$Res>
    implements $UnifediApiListRepliesPolicyTypeCopyWith<$Res> {
  _$UnifediApiListRepliesPolicyTypeCopyWithImpl(this._value, this._then);

  final UnifediApiListRepliesPolicyType _value;
  // ignore: unused_field
  final $Res Function(UnifediApiListRepliesPolicyType) _then;

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
abstract class _$FollowedCopyWith<$Res>
    implements $UnifediApiListRepliesPolicyTypeCopyWith<$Res> {
  factory _$FollowedCopyWith(_Followed value, $Res Function(_Followed) then) =
      __$FollowedCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$FollowedCopyWithImpl<$Res>
    extends _$UnifediApiListRepliesPolicyTypeCopyWithImpl<$Res>
    implements _$FollowedCopyWith<$Res> {
  __$FollowedCopyWithImpl(_Followed _value, $Res Function(_Followed) _then)
      : super(_value, (v) => _then(v as _Followed));

  @override
  _Followed get _value => super._value as _Followed;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Followed(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Followed implements _Followed {
  const _$_Followed(
      {this.stringValue = UnifediApiListRepliesPolicyType.followedStringValue});

  @JsonKey(defaultValue: UnifediApiListRepliesPolicyType.followedStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'UnifediApiListRepliesPolicyType.followed(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Followed &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$FollowedCopyWith<_Followed> get copyWith =>
      __$FollowedCopyWithImpl<_Followed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) followed,
    required TResult Function(String stringValue) list,
    required TResult Function(String stringValue) none,
    required TResult Function(String stringValue) unknown,
  }) {
    return followed(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? followed,
    TResult Function(String stringValue)? list,
    TResult Function(String stringValue)? none,
    TResult Function(String stringValue)? unknown,
  }) {
    return followed?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? followed,
    TResult Function(String stringValue)? list,
    TResult Function(String stringValue)? none,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (followed != null) {
      return followed(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Followed value) followed,
    required TResult Function(_List value) list,
    required TResult Function(_None value) none,
    required TResult Function(_Unknown value) unknown,
  }) {
    return followed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Followed value)? followed,
    TResult Function(_List value)? list,
    TResult Function(_None value)? none,
    TResult Function(_Unknown value)? unknown,
  }) {
    return followed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Followed value)? followed,
    TResult Function(_List value)? list,
    TResult Function(_None value)? none,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (followed != null) {
      return followed(this);
    }
    return orElse();
  }
}

abstract class _Followed implements UnifediApiListRepliesPolicyType {
  const factory _Followed({String stringValue}) = _$_Followed;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FollowedCopyWith<_Followed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ListCopyWith<$Res>
    implements $UnifediApiListRepliesPolicyTypeCopyWith<$Res> {
  factory _$ListCopyWith(_List value, $Res Function(_List) then) =
      __$ListCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$ListCopyWithImpl<$Res>
    extends _$UnifediApiListRepliesPolicyTypeCopyWithImpl<$Res>
    implements _$ListCopyWith<$Res> {
  __$ListCopyWithImpl(_List _value, $Res Function(_List) _then)
      : super(_value, (v) => _then(v as _List));

  @override
  _List get _value => super._value as _List;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_List(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_List implements _List {
  const _$_List(
      {this.stringValue = UnifediApiListRepliesPolicyType.listStringValue});

  @JsonKey(defaultValue: UnifediApiListRepliesPolicyType.listStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'UnifediApiListRepliesPolicyType.list(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _List &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$ListCopyWith<_List> get copyWith =>
      __$ListCopyWithImpl<_List>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) followed,
    required TResult Function(String stringValue) list,
    required TResult Function(String stringValue) none,
    required TResult Function(String stringValue) unknown,
  }) {
    return list(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? followed,
    TResult Function(String stringValue)? list,
    TResult Function(String stringValue)? none,
    TResult Function(String stringValue)? unknown,
  }) {
    return list?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? followed,
    TResult Function(String stringValue)? list,
    TResult Function(String stringValue)? none,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (list != null) {
      return list(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Followed value) followed,
    required TResult Function(_List value) list,
    required TResult Function(_None value) none,
    required TResult Function(_Unknown value) unknown,
  }) {
    return list(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Followed value)? followed,
    TResult Function(_List value)? list,
    TResult Function(_None value)? none,
    TResult Function(_Unknown value)? unknown,
  }) {
    return list?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Followed value)? followed,
    TResult Function(_List value)? list,
    TResult Function(_None value)? none,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (list != null) {
      return list(this);
    }
    return orElse();
  }
}

abstract class _List implements UnifediApiListRepliesPolicyType {
  const factory _List({String stringValue}) = _$_List;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ListCopyWith<_List> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$NoneCopyWith<$Res>
    implements $UnifediApiListRepliesPolicyTypeCopyWith<$Res> {
  factory _$NoneCopyWith(_None value, $Res Function(_None) then) =
      __$NoneCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$NoneCopyWithImpl<$Res>
    extends _$UnifediApiListRepliesPolicyTypeCopyWithImpl<$Res>
    implements _$NoneCopyWith<$Res> {
  __$NoneCopyWithImpl(_None _value, $Res Function(_None) _then)
      : super(_value, (v) => _then(v as _None));

  @override
  _None get _value => super._value as _None;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_None(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_None implements _None {
  const _$_None(
      {this.stringValue = UnifediApiListRepliesPolicyType.noneStringValue});

  @JsonKey(defaultValue: UnifediApiListRepliesPolicyType.noneStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'UnifediApiListRepliesPolicyType.none(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _None &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$NoneCopyWith<_None> get copyWith =>
      __$NoneCopyWithImpl<_None>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) followed,
    required TResult Function(String stringValue) list,
    required TResult Function(String stringValue) none,
    required TResult Function(String stringValue) unknown,
  }) {
    return none(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? followed,
    TResult Function(String stringValue)? list,
    TResult Function(String stringValue)? none,
    TResult Function(String stringValue)? unknown,
  }) {
    return none?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? followed,
    TResult Function(String stringValue)? list,
    TResult Function(String stringValue)? none,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Followed value) followed,
    required TResult Function(_List value) list,
    required TResult Function(_None value) none,
    required TResult Function(_Unknown value) unknown,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Followed value)? followed,
    TResult Function(_List value)? list,
    TResult Function(_None value)? none,
    TResult Function(_Unknown value)? unknown,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Followed value)? followed,
    TResult Function(_List value)? list,
    TResult Function(_None value)? none,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class _None implements UnifediApiListRepliesPolicyType {
  const factory _None({String stringValue}) = _$_None;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NoneCopyWith<_None> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UnknownCopyWith<$Res>
    implements $UnifediApiListRepliesPolicyTypeCopyWith<$Res> {
  factory _$UnknownCopyWith(_Unknown value, $Res Function(_Unknown) then) =
      __$UnknownCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$UnknownCopyWithImpl<$Res>
    extends _$UnifediApiListRepliesPolicyTypeCopyWithImpl<$Res>
    implements _$UnknownCopyWith<$Res> {
  __$UnknownCopyWithImpl(_Unknown _value, $Res Function(_Unknown) _then)
      : super(_value, (v) => _then(v as _Unknown));

  @override
  _Unknown get _value => super._value as _Unknown;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Unknown(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Unknown implements _Unknown {
  const _$_Unknown({required this.stringValue});

  @override
  final String stringValue;

  @override
  String toString() {
    return 'UnifediApiListRepliesPolicyType.unknown(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Unknown &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$UnknownCopyWith<_Unknown> get copyWith =>
      __$UnknownCopyWithImpl<_Unknown>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) followed,
    required TResult Function(String stringValue) list,
    required TResult Function(String stringValue) none,
    required TResult Function(String stringValue) unknown,
  }) {
    return unknown(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? followed,
    TResult Function(String stringValue)? list,
    TResult Function(String stringValue)? none,
    TResult Function(String stringValue)? unknown,
  }) {
    return unknown?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? followed,
    TResult Function(String stringValue)? list,
    TResult Function(String stringValue)? none,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Followed value) followed,
    required TResult Function(_List value) list,
    required TResult Function(_None value) none,
    required TResult Function(_Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Followed value)? followed,
    TResult Function(_List value)? list,
    TResult Function(_None value)? none,
    TResult Function(_Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Followed value)? followed,
    TResult Function(_List value)? list,
    TResult Function(_None value)? none,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown implements UnifediApiListRepliesPolicyType {
  const factory _Unknown({required String stringValue}) = _$_Unknown;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnknownCopyWith<_Unknown> get copyWith =>
      throw _privateConstructorUsedError;
}
