// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_instance_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UnifediApiInstanceTypeTearOff {
  const _$UnifediApiInstanceTypeTearOff();

  _Pleroma pleroma(
      {String? stringValue = UnifediApiInstanceType.pleromaStringValue}) {
    return _Pleroma(
      stringValue: stringValue,
    );
  }

  _Mastodon mastodon(
      {String? stringValue = UnifediApiInstanceType.mastodonStringValue}) {
    return _Mastodon(
      stringValue: stringValue,
    );
  }

  _Unknown unknown({required String? stringValue}) {
    return _Unknown(
      stringValue: stringValue,
    );
  }
}

/// @nodoc
const $UnifediApiInstanceType = _$UnifediApiInstanceTypeTearOff();

/// @nodoc
mixin _$UnifediApiInstanceType {
  String? get stringValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? stringValue) pleroma,
    required TResult Function(String? stringValue) mastodon,
    required TResult Function(String? stringValue) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? stringValue)? pleroma,
    TResult Function(String? stringValue)? mastodon,
    TResult Function(String? stringValue)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? stringValue)? pleroma,
    TResult Function(String? stringValue)? mastodon,
    TResult Function(String? stringValue)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Pleroma value) pleroma,
    required TResult Function(_Mastodon value) mastodon,
    required TResult Function(_Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Pleroma value)? pleroma,
    TResult Function(_Mastodon value)? mastodon,
    TResult Function(_Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pleroma value)? pleroma,
    TResult Function(_Mastodon value)? mastodon,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnifediApiInstanceTypeCopyWith<UnifediApiInstanceType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiInstanceTypeCopyWith<$Res> {
  factory $UnifediApiInstanceTypeCopyWith(UnifediApiInstanceType value,
          $Res Function(UnifediApiInstanceType) then) =
      _$UnifediApiInstanceTypeCopyWithImpl<$Res>;
  $Res call({String? stringValue});
}

/// @nodoc
class _$UnifediApiInstanceTypeCopyWithImpl<$Res>
    implements $UnifediApiInstanceTypeCopyWith<$Res> {
  _$UnifediApiInstanceTypeCopyWithImpl(this._value, this._then);

  final UnifediApiInstanceType _value;
  // ignore: unused_field
  final $Res Function(UnifediApiInstanceType) _then;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_value.copyWith(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaCopyWith<$Res>
    implements $UnifediApiInstanceTypeCopyWith<$Res> {
  factory _$PleromaCopyWith(_Pleroma value, $Res Function(_Pleroma) then) =
      __$PleromaCopyWithImpl<$Res>;
  @override
  $Res call({String? stringValue});
}

/// @nodoc
class __$PleromaCopyWithImpl<$Res>
    extends _$UnifediApiInstanceTypeCopyWithImpl<$Res>
    implements _$PleromaCopyWith<$Res> {
  __$PleromaCopyWithImpl(_Pleroma _value, $Res Function(_Pleroma) _then)
      : super(_value, (v) => _then(v as _Pleroma));

  @override
  _Pleroma get _value => super._value as _Pleroma;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Pleroma(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Pleroma implements _Pleroma {
  const _$_Pleroma(
      {this.stringValue = UnifediApiInstanceType.pleromaStringValue});

  @JsonKey(defaultValue: UnifediApiInstanceType.pleromaStringValue)
  @override
  final String? stringValue;

  @override
  String toString() {
    return 'UnifediApiInstanceType.pleroma(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Pleroma &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$PleromaCopyWith<_Pleroma> get copyWith =>
      __$PleromaCopyWithImpl<_Pleroma>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? stringValue) pleroma,
    required TResult Function(String? stringValue) mastodon,
    required TResult Function(String? stringValue) unknown,
  }) {
    return pleroma(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? stringValue)? pleroma,
    TResult Function(String? stringValue)? mastodon,
    TResult Function(String? stringValue)? unknown,
  }) {
    return pleroma?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? stringValue)? pleroma,
    TResult Function(String? stringValue)? mastodon,
    TResult Function(String? stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (pleroma != null) {
      return pleroma(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Pleroma value) pleroma,
    required TResult Function(_Mastodon value) mastodon,
    required TResult Function(_Unknown value) unknown,
  }) {
    return pleroma(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Pleroma value)? pleroma,
    TResult Function(_Mastodon value)? mastodon,
    TResult Function(_Unknown value)? unknown,
  }) {
    return pleroma?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pleroma value)? pleroma,
    TResult Function(_Mastodon value)? mastodon,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (pleroma != null) {
      return pleroma(this);
    }
    return orElse();
  }
}

abstract class _Pleroma implements UnifediApiInstanceType {
  const factory _Pleroma({String? stringValue}) = _$_Pleroma;

  @override
  String? get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaCopyWith<_Pleroma> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$MastodonCopyWith<$Res>
    implements $UnifediApiInstanceTypeCopyWith<$Res> {
  factory _$MastodonCopyWith(_Mastodon value, $Res Function(_Mastodon) then) =
      __$MastodonCopyWithImpl<$Res>;
  @override
  $Res call({String? stringValue});
}

/// @nodoc
class __$MastodonCopyWithImpl<$Res>
    extends _$UnifediApiInstanceTypeCopyWithImpl<$Res>
    implements _$MastodonCopyWith<$Res> {
  __$MastodonCopyWithImpl(_Mastodon _value, $Res Function(_Mastodon) _then)
      : super(_value, (v) => _then(v as _Mastodon));

  @override
  _Mastodon get _value => super._value as _Mastodon;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Mastodon(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Mastodon implements _Mastodon {
  const _$_Mastodon(
      {this.stringValue = UnifediApiInstanceType.mastodonStringValue});

  @JsonKey(defaultValue: UnifediApiInstanceType.mastodonStringValue)
  @override
  final String? stringValue;

  @override
  String toString() {
    return 'UnifediApiInstanceType.mastodon(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Mastodon &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$MastodonCopyWith<_Mastodon> get copyWith =>
      __$MastodonCopyWithImpl<_Mastodon>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? stringValue) pleroma,
    required TResult Function(String? stringValue) mastodon,
    required TResult Function(String? stringValue) unknown,
  }) {
    return mastodon(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? stringValue)? pleroma,
    TResult Function(String? stringValue)? mastodon,
    TResult Function(String? stringValue)? unknown,
  }) {
    return mastodon?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? stringValue)? pleroma,
    TResult Function(String? stringValue)? mastodon,
    TResult Function(String? stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (mastodon != null) {
      return mastodon(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Pleroma value) pleroma,
    required TResult Function(_Mastodon value) mastodon,
    required TResult Function(_Unknown value) unknown,
  }) {
    return mastodon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Pleroma value)? pleroma,
    TResult Function(_Mastodon value)? mastodon,
    TResult Function(_Unknown value)? unknown,
  }) {
    return mastodon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pleroma value)? pleroma,
    TResult Function(_Mastodon value)? mastodon,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (mastodon != null) {
      return mastodon(this);
    }
    return orElse();
  }
}

abstract class _Mastodon implements UnifediApiInstanceType {
  const factory _Mastodon({String? stringValue}) = _$_Mastodon;

  @override
  String? get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MastodonCopyWith<_Mastodon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UnknownCopyWith<$Res>
    implements $UnifediApiInstanceTypeCopyWith<$Res> {
  factory _$UnknownCopyWith(_Unknown value, $Res Function(_Unknown) then) =
      __$UnknownCopyWithImpl<$Res>;
  @override
  $Res call({String? stringValue});
}

/// @nodoc
class __$UnknownCopyWithImpl<$Res>
    extends _$UnifediApiInstanceTypeCopyWithImpl<$Res>
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
              as String?,
    ));
  }
}

/// @nodoc

class _$_Unknown implements _Unknown {
  const _$_Unknown({required this.stringValue});

  @override
  final String? stringValue;

  @override
  String toString() {
    return 'UnifediApiInstanceType.unknown(stringValue: $stringValue)';
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
    required TResult Function(String? stringValue) pleroma,
    required TResult Function(String? stringValue) mastodon,
    required TResult Function(String? stringValue) unknown,
  }) {
    return unknown(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? stringValue)? pleroma,
    TResult Function(String? stringValue)? mastodon,
    TResult Function(String? stringValue)? unknown,
  }) {
    return unknown?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? stringValue)? pleroma,
    TResult Function(String? stringValue)? mastodon,
    TResult Function(String? stringValue)? unknown,
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
    required TResult Function(_Pleroma value) pleroma,
    required TResult Function(_Mastodon value) mastodon,
    required TResult Function(_Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Pleroma value)? pleroma,
    TResult Function(_Mastodon value)? mastodon,
    TResult Function(_Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pleroma value)? pleroma,
    TResult Function(_Mastodon value)? mastodon,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown implements UnifediApiInstanceType {
  const factory _Unknown({required String? stringValue}) = _$_Unknown;

  @override
  String? get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnknownCopyWith<_Unknown> get copyWith =>
      throw _privateConstructorUsedError;
}
