// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_visibility_sealed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MastodonApiVisibilityTearOff {
  const _$MastodonApiVisibilityTearOff();

  _Public public(
      {String stringValue = MastodonApiVisibility.publicStringValue}) {
    return _Public(
      stringValue: stringValue,
    );
  }

  _Unlisted unlisted(
      {String stringValue = MastodonApiVisibility.unlistedStringValue}) {
    return _Unlisted(
      stringValue: stringValue,
    );
  }

  _Direct direct(
      {String stringValue = MastodonApiVisibility.directStringValue}) {
    return _Direct(
      stringValue: stringValue,
    );
  }

  _Private private(
      {String stringValue = MastodonApiVisibility.privateStringValue}) {
    return _Private(
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
const $MastodonApiVisibility = _$MastodonApiVisibilityTearOff();

/// @nodoc
mixin _$MastodonApiVisibility {
  String get stringValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) public,
    required TResult Function(String stringValue) unlisted,
    required TResult Function(String stringValue) direct,
    required TResult Function(String stringValue) private,
    required TResult Function(String stringValue) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? unlisted,
    TResult Function(String stringValue)? direct,
    TResult Function(String stringValue)? private,
    TResult Function(String stringValue)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? unlisted,
    TResult Function(String stringValue)? direct,
    TResult Function(String stringValue)? private,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Public value) public,
    required TResult Function(_Unlisted value) unlisted,
    required TResult Function(_Direct value) direct,
    required TResult Function(_Private value) private,
    required TResult Function(_Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Public value)? public,
    TResult Function(_Unlisted value)? unlisted,
    TResult Function(_Direct value)? direct,
    TResult Function(_Private value)? private,
    TResult Function(_Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Public value)? public,
    TResult Function(_Unlisted value)? unlisted,
    TResult Function(_Direct value)? direct,
    TResult Function(_Private value)? private,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MastodonApiVisibilityCopyWith<MastodonApiVisibility> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiVisibilityCopyWith<$Res> {
  factory $MastodonApiVisibilityCopyWith(MastodonApiVisibility value,
          $Res Function(MastodonApiVisibility) then) =
      _$MastodonApiVisibilityCopyWithImpl<$Res>;
  $Res call({String stringValue});
}

/// @nodoc
class _$MastodonApiVisibilityCopyWithImpl<$Res>
    implements $MastodonApiVisibilityCopyWith<$Res> {
  _$MastodonApiVisibilityCopyWithImpl(this._value, this._then);

  final MastodonApiVisibility _value;
  // ignore: unused_field
  final $Res Function(MastodonApiVisibility) _then;

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
abstract class _$PublicCopyWith<$Res>
    implements $MastodonApiVisibilityCopyWith<$Res> {
  factory _$PublicCopyWith(_Public value, $Res Function(_Public) then) =
      __$PublicCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$PublicCopyWithImpl<$Res>
    extends _$MastodonApiVisibilityCopyWithImpl<$Res>
    implements _$PublicCopyWith<$Res> {
  __$PublicCopyWithImpl(_Public _value, $Res Function(_Public) _then)
      : super(_value, (v) => _then(v as _Public));

  @override
  _Public get _value => super._value as _Public;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Public(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Public implements _Public {
  const _$_Public({this.stringValue = MastodonApiVisibility.publicStringValue});

  @JsonKey(defaultValue: MastodonApiVisibility.publicStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiVisibility.public(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Public &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$PublicCopyWith<_Public> get copyWith =>
      __$PublicCopyWithImpl<_Public>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) public,
    required TResult Function(String stringValue) unlisted,
    required TResult Function(String stringValue) direct,
    required TResult Function(String stringValue) private,
    required TResult Function(String stringValue) unknown,
  }) {
    return public(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? unlisted,
    TResult Function(String stringValue)? direct,
    TResult Function(String stringValue)? private,
    TResult Function(String stringValue)? unknown,
  }) {
    return public?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? unlisted,
    TResult Function(String stringValue)? direct,
    TResult Function(String stringValue)? private,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (public != null) {
      return public(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Public value) public,
    required TResult Function(_Unlisted value) unlisted,
    required TResult Function(_Direct value) direct,
    required TResult Function(_Private value) private,
    required TResult Function(_Unknown value) unknown,
  }) {
    return public(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Public value)? public,
    TResult Function(_Unlisted value)? unlisted,
    TResult Function(_Direct value)? direct,
    TResult Function(_Private value)? private,
    TResult Function(_Unknown value)? unknown,
  }) {
    return public?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Public value)? public,
    TResult Function(_Unlisted value)? unlisted,
    TResult Function(_Direct value)? direct,
    TResult Function(_Private value)? private,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (public != null) {
      return public(this);
    }
    return orElse();
  }
}

abstract class _Public implements MastodonApiVisibility {
  const factory _Public({String stringValue}) = _$_Public;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PublicCopyWith<_Public> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UnlistedCopyWith<$Res>
    implements $MastodonApiVisibilityCopyWith<$Res> {
  factory _$UnlistedCopyWith(_Unlisted value, $Res Function(_Unlisted) then) =
      __$UnlistedCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$UnlistedCopyWithImpl<$Res>
    extends _$MastodonApiVisibilityCopyWithImpl<$Res>
    implements _$UnlistedCopyWith<$Res> {
  __$UnlistedCopyWithImpl(_Unlisted _value, $Res Function(_Unlisted) _then)
      : super(_value, (v) => _then(v as _Unlisted));

  @override
  _Unlisted get _value => super._value as _Unlisted;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Unlisted(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Unlisted implements _Unlisted {
  const _$_Unlisted(
      {this.stringValue = MastodonApiVisibility.unlistedStringValue});

  @JsonKey(defaultValue: MastodonApiVisibility.unlistedStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiVisibility.unlisted(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Unlisted &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$UnlistedCopyWith<_Unlisted> get copyWith =>
      __$UnlistedCopyWithImpl<_Unlisted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) public,
    required TResult Function(String stringValue) unlisted,
    required TResult Function(String stringValue) direct,
    required TResult Function(String stringValue) private,
    required TResult Function(String stringValue) unknown,
  }) {
    return unlisted(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? unlisted,
    TResult Function(String stringValue)? direct,
    TResult Function(String stringValue)? private,
    TResult Function(String stringValue)? unknown,
  }) {
    return unlisted?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? unlisted,
    TResult Function(String stringValue)? direct,
    TResult Function(String stringValue)? private,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (unlisted != null) {
      return unlisted(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Public value) public,
    required TResult Function(_Unlisted value) unlisted,
    required TResult Function(_Direct value) direct,
    required TResult Function(_Private value) private,
    required TResult Function(_Unknown value) unknown,
  }) {
    return unlisted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Public value)? public,
    TResult Function(_Unlisted value)? unlisted,
    TResult Function(_Direct value)? direct,
    TResult Function(_Private value)? private,
    TResult Function(_Unknown value)? unknown,
  }) {
    return unlisted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Public value)? public,
    TResult Function(_Unlisted value)? unlisted,
    TResult Function(_Direct value)? direct,
    TResult Function(_Private value)? private,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unlisted != null) {
      return unlisted(this);
    }
    return orElse();
  }
}

abstract class _Unlisted implements MastodonApiVisibility {
  const factory _Unlisted({String stringValue}) = _$_Unlisted;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnlistedCopyWith<_Unlisted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DirectCopyWith<$Res>
    implements $MastodonApiVisibilityCopyWith<$Res> {
  factory _$DirectCopyWith(_Direct value, $Res Function(_Direct) then) =
      __$DirectCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$DirectCopyWithImpl<$Res>
    extends _$MastodonApiVisibilityCopyWithImpl<$Res>
    implements _$DirectCopyWith<$Res> {
  __$DirectCopyWithImpl(_Direct _value, $Res Function(_Direct) _then)
      : super(_value, (v) => _then(v as _Direct));

  @override
  _Direct get _value => super._value as _Direct;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Direct(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Direct implements _Direct {
  const _$_Direct({this.stringValue = MastodonApiVisibility.directStringValue});

  @JsonKey(defaultValue: MastodonApiVisibility.directStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiVisibility.direct(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Direct &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$DirectCopyWith<_Direct> get copyWith =>
      __$DirectCopyWithImpl<_Direct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) public,
    required TResult Function(String stringValue) unlisted,
    required TResult Function(String stringValue) direct,
    required TResult Function(String stringValue) private,
    required TResult Function(String stringValue) unknown,
  }) {
    return direct(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? unlisted,
    TResult Function(String stringValue)? direct,
    TResult Function(String stringValue)? private,
    TResult Function(String stringValue)? unknown,
  }) {
    return direct?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? unlisted,
    TResult Function(String stringValue)? direct,
    TResult Function(String stringValue)? private,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (direct != null) {
      return direct(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Public value) public,
    required TResult Function(_Unlisted value) unlisted,
    required TResult Function(_Direct value) direct,
    required TResult Function(_Private value) private,
    required TResult Function(_Unknown value) unknown,
  }) {
    return direct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Public value)? public,
    TResult Function(_Unlisted value)? unlisted,
    TResult Function(_Direct value)? direct,
    TResult Function(_Private value)? private,
    TResult Function(_Unknown value)? unknown,
  }) {
    return direct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Public value)? public,
    TResult Function(_Unlisted value)? unlisted,
    TResult Function(_Direct value)? direct,
    TResult Function(_Private value)? private,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (direct != null) {
      return direct(this);
    }
    return orElse();
  }
}

abstract class _Direct implements MastodonApiVisibility {
  const factory _Direct({String stringValue}) = _$_Direct;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DirectCopyWith<_Direct> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PrivateCopyWith<$Res>
    implements $MastodonApiVisibilityCopyWith<$Res> {
  factory _$PrivateCopyWith(_Private value, $Res Function(_Private) then) =
      __$PrivateCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$PrivateCopyWithImpl<$Res>
    extends _$MastodonApiVisibilityCopyWithImpl<$Res>
    implements _$PrivateCopyWith<$Res> {
  __$PrivateCopyWithImpl(_Private _value, $Res Function(_Private) _then)
      : super(_value, (v) => _then(v as _Private));

  @override
  _Private get _value => super._value as _Private;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Private(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Private implements _Private {
  const _$_Private(
      {this.stringValue = MastodonApiVisibility.privateStringValue});

  @JsonKey(defaultValue: MastodonApiVisibility.privateStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiVisibility.private(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Private &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$PrivateCopyWith<_Private> get copyWith =>
      __$PrivateCopyWithImpl<_Private>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) public,
    required TResult Function(String stringValue) unlisted,
    required TResult Function(String stringValue) direct,
    required TResult Function(String stringValue) private,
    required TResult Function(String stringValue) unknown,
  }) {
    return private(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? unlisted,
    TResult Function(String stringValue)? direct,
    TResult Function(String stringValue)? private,
    TResult Function(String stringValue)? unknown,
  }) {
    return private?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? unlisted,
    TResult Function(String stringValue)? direct,
    TResult Function(String stringValue)? private,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (private != null) {
      return private(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Public value) public,
    required TResult Function(_Unlisted value) unlisted,
    required TResult Function(_Direct value) direct,
    required TResult Function(_Private value) private,
    required TResult Function(_Unknown value) unknown,
  }) {
    return private(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Public value)? public,
    TResult Function(_Unlisted value)? unlisted,
    TResult Function(_Direct value)? direct,
    TResult Function(_Private value)? private,
    TResult Function(_Unknown value)? unknown,
  }) {
    return private?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Public value)? public,
    TResult Function(_Unlisted value)? unlisted,
    TResult Function(_Direct value)? direct,
    TResult Function(_Private value)? private,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (private != null) {
      return private(this);
    }
    return orElse();
  }
}

abstract class _Private implements MastodonApiVisibility {
  const factory _Private({String stringValue}) = _$_Private;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PrivateCopyWith<_Private> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UnknownCopyWith<$Res>
    implements $MastodonApiVisibilityCopyWith<$Res> {
  factory _$UnknownCopyWith(_Unknown value, $Res Function(_Unknown) then) =
      __$UnknownCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$UnknownCopyWithImpl<$Res>
    extends _$MastodonApiVisibilityCopyWithImpl<$Res>
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
    return 'MastodonApiVisibility.unknown(stringValue: $stringValue)';
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
    required TResult Function(String stringValue) public,
    required TResult Function(String stringValue) unlisted,
    required TResult Function(String stringValue) direct,
    required TResult Function(String stringValue) private,
    required TResult Function(String stringValue) unknown,
  }) {
    return unknown(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? unlisted,
    TResult Function(String stringValue)? direct,
    TResult Function(String stringValue)? private,
    TResult Function(String stringValue)? unknown,
  }) {
    return unknown?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? public,
    TResult Function(String stringValue)? unlisted,
    TResult Function(String stringValue)? direct,
    TResult Function(String stringValue)? private,
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
    required TResult Function(_Public value) public,
    required TResult Function(_Unlisted value) unlisted,
    required TResult Function(_Direct value) direct,
    required TResult Function(_Private value) private,
    required TResult Function(_Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Public value)? public,
    TResult Function(_Unlisted value)? unlisted,
    TResult Function(_Direct value)? direct,
    TResult Function(_Private value)? private,
    TResult Function(_Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Public value)? public,
    TResult Function(_Unlisted value)? unlisted,
    TResult Function(_Direct value)? direct,
    TResult Function(_Private value)? private,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown implements MastodonApiVisibility {
  const factory _Unknown({required String stringValue}) = _$_Unknown;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnknownCopyWith<_Unknown> get copyWith =>
      throw _privateConstructorUsedError;
}
