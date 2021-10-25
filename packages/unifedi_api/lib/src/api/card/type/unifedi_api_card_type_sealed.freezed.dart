// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_card_type_sealed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UnifediApiCardTypeTearOff {
  const _$UnifediApiCardTypeTearOff();

  _Link link({String stringValue = UnifediApiCardType.linkStringValue}) {
    return _Link(
      stringValue: stringValue,
    );
  }

  _Photo photo({String stringValue = UnifediApiCardType.photoStringValue}) {
    return _Photo(
      stringValue: stringValue,
    );
  }

  _Video video({String stringValue = UnifediApiCardType.videoStringValue}) {
    return _Video(
      stringValue: stringValue,
    );
  }

  _Rich rich({String stringValue = UnifediApiCardType.richStringValue}) {
    return _Rich(
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
const $UnifediApiCardType = _$UnifediApiCardTypeTearOff();

/// @nodoc
mixin _$UnifediApiCardType {
  String get stringValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) link,
    required TResult Function(String stringValue) photo,
    required TResult Function(String stringValue) video,
    required TResult Function(String stringValue) rich,
    required TResult Function(String stringValue) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? link,
    TResult Function(String stringValue)? photo,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? rich,
    TResult Function(String stringValue)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? link,
    TResult Function(String stringValue)? photo,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? rich,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Link value) link,
    required TResult Function(_Photo value) photo,
    required TResult Function(_Video value) video,
    required TResult Function(_Rich value) rich,
    required TResult Function(_Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Link value)? link,
    TResult Function(_Photo value)? photo,
    TResult Function(_Video value)? video,
    TResult Function(_Rich value)? rich,
    TResult Function(_Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Link value)? link,
    TResult Function(_Photo value)? photo,
    TResult Function(_Video value)? video,
    TResult Function(_Rich value)? rich,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnifediApiCardTypeCopyWith<UnifediApiCardType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiCardTypeCopyWith<$Res> {
  factory $UnifediApiCardTypeCopyWith(
          UnifediApiCardType value, $Res Function(UnifediApiCardType) then) =
      _$UnifediApiCardTypeCopyWithImpl<$Res>;
  $Res call({String stringValue});
}

/// @nodoc
class _$UnifediApiCardTypeCopyWithImpl<$Res>
    implements $UnifediApiCardTypeCopyWith<$Res> {
  _$UnifediApiCardTypeCopyWithImpl(this._value, this._then);

  final UnifediApiCardType _value;
  // ignore: unused_field
  final $Res Function(UnifediApiCardType) _then;

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
abstract class _$LinkCopyWith<$Res>
    implements $UnifediApiCardTypeCopyWith<$Res> {
  factory _$LinkCopyWith(_Link value, $Res Function(_Link) then) =
      __$LinkCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$LinkCopyWithImpl<$Res> extends _$UnifediApiCardTypeCopyWithImpl<$Res>
    implements _$LinkCopyWith<$Res> {
  __$LinkCopyWithImpl(_Link _value, $Res Function(_Link) _then)
      : super(_value, (v) => _then(v as _Link));

  @override
  _Link get _value => super._value as _Link;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Link(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Link implements _Link {
  const _$_Link({this.stringValue = UnifediApiCardType.linkStringValue});

  @JsonKey(defaultValue: UnifediApiCardType.linkStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'UnifediApiCardType.link(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Link &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$LinkCopyWith<_Link> get copyWith =>
      __$LinkCopyWithImpl<_Link>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) link,
    required TResult Function(String stringValue) photo,
    required TResult Function(String stringValue) video,
    required TResult Function(String stringValue) rich,
    required TResult Function(String stringValue) unknown,
  }) {
    return link(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? link,
    TResult Function(String stringValue)? photo,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? rich,
    TResult Function(String stringValue)? unknown,
  }) {
    return link?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? link,
    TResult Function(String stringValue)? photo,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? rich,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (link != null) {
      return link(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Link value) link,
    required TResult Function(_Photo value) photo,
    required TResult Function(_Video value) video,
    required TResult Function(_Rich value) rich,
    required TResult Function(_Unknown value) unknown,
  }) {
    return link(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Link value)? link,
    TResult Function(_Photo value)? photo,
    TResult Function(_Video value)? video,
    TResult Function(_Rich value)? rich,
    TResult Function(_Unknown value)? unknown,
  }) {
    return link?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Link value)? link,
    TResult Function(_Photo value)? photo,
    TResult Function(_Video value)? video,
    TResult Function(_Rich value)? rich,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (link != null) {
      return link(this);
    }
    return orElse();
  }
}

abstract class _Link implements UnifediApiCardType {
  const factory _Link({String stringValue}) = _$_Link;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LinkCopyWith<_Link> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PhotoCopyWith<$Res>
    implements $UnifediApiCardTypeCopyWith<$Res> {
  factory _$PhotoCopyWith(_Photo value, $Res Function(_Photo) then) =
      __$PhotoCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$PhotoCopyWithImpl<$Res> extends _$UnifediApiCardTypeCopyWithImpl<$Res>
    implements _$PhotoCopyWith<$Res> {
  __$PhotoCopyWithImpl(_Photo _value, $Res Function(_Photo) _then)
      : super(_value, (v) => _then(v as _Photo));

  @override
  _Photo get _value => super._value as _Photo;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Photo(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Photo implements _Photo {
  const _$_Photo({this.stringValue = UnifediApiCardType.photoStringValue});

  @JsonKey(defaultValue: UnifediApiCardType.photoStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'UnifediApiCardType.photo(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Photo &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$PhotoCopyWith<_Photo> get copyWith =>
      __$PhotoCopyWithImpl<_Photo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) link,
    required TResult Function(String stringValue) photo,
    required TResult Function(String stringValue) video,
    required TResult Function(String stringValue) rich,
    required TResult Function(String stringValue) unknown,
  }) {
    return photo(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? link,
    TResult Function(String stringValue)? photo,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? rich,
    TResult Function(String stringValue)? unknown,
  }) {
    return photo?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? link,
    TResult Function(String stringValue)? photo,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? rich,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (photo != null) {
      return photo(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Link value) link,
    required TResult Function(_Photo value) photo,
    required TResult Function(_Video value) video,
    required TResult Function(_Rich value) rich,
    required TResult Function(_Unknown value) unknown,
  }) {
    return photo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Link value)? link,
    TResult Function(_Photo value)? photo,
    TResult Function(_Video value)? video,
    TResult Function(_Rich value)? rich,
    TResult Function(_Unknown value)? unknown,
  }) {
    return photo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Link value)? link,
    TResult Function(_Photo value)? photo,
    TResult Function(_Video value)? video,
    TResult Function(_Rich value)? rich,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (photo != null) {
      return photo(this);
    }
    return orElse();
  }
}

abstract class _Photo implements UnifediApiCardType {
  const factory _Photo({String stringValue}) = _$_Photo;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PhotoCopyWith<_Photo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$VideoCopyWith<$Res>
    implements $UnifediApiCardTypeCopyWith<$Res> {
  factory _$VideoCopyWith(_Video value, $Res Function(_Video) then) =
      __$VideoCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$VideoCopyWithImpl<$Res> extends _$UnifediApiCardTypeCopyWithImpl<$Res>
    implements _$VideoCopyWith<$Res> {
  __$VideoCopyWithImpl(_Video _value, $Res Function(_Video) _then)
      : super(_value, (v) => _then(v as _Video));

  @override
  _Video get _value => super._value as _Video;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Video(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Video implements _Video {
  const _$_Video({this.stringValue = UnifediApiCardType.videoStringValue});

  @JsonKey(defaultValue: UnifediApiCardType.videoStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'UnifediApiCardType.video(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Video &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$VideoCopyWith<_Video> get copyWith =>
      __$VideoCopyWithImpl<_Video>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) link,
    required TResult Function(String stringValue) photo,
    required TResult Function(String stringValue) video,
    required TResult Function(String stringValue) rich,
    required TResult Function(String stringValue) unknown,
  }) {
    return video(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? link,
    TResult Function(String stringValue)? photo,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? rich,
    TResult Function(String stringValue)? unknown,
  }) {
    return video?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? link,
    TResult Function(String stringValue)? photo,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? rich,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (video != null) {
      return video(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Link value) link,
    required TResult Function(_Photo value) photo,
    required TResult Function(_Video value) video,
    required TResult Function(_Rich value) rich,
    required TResult Function(_Unknown value) unknown,
  }) {
    return video(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Link value)? link,
    TResult Function(_Photo value)? photo,
    TResult Function(_Video value)? video,
    TResult Function(_Rich value)? rich,
    TResult Function(_Unknown value)? unknown,
  }) {
    return video?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Link value)? link,
    TResult Function(_Photo value)? photo,
    TResult Function(_Video value)? video,
    TResult Function(_Rich value)? rich,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (video != null) {
      return video(this);
    }
    return orElse();
  }
}

abstract class _Video implements UnifediApiCardType {
  const factory _Video({String stringValue}) = _$_Video;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VideoCopyWith<_Video> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RichCopyWith<$Res>
    implements $UnifediApiCardTypeCopyWith<$Res> {
  factory _$RichCopyWith(_Rich value, $Res Function(_Rich) then) =
      __$RichCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$RichCopyWithImpl<$Res> extends _$UnifediApiCardTypeCopyWithImpl<$Res>
    implements _$RichCopyWith<$Res> {
  __$RichCopyWithImpl(_Rich _value, $Res Function(_Rich) _then)
      : super(_value, (v) => _then(v as _Rich));

  @override
  _Rich get _value => super._value as _Rich;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Rich(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Rich implements _Rich {
  const _$_Rich({this.stringValue = UnifediApiCardType.richStringValue});

  @JsonKey(defaultValue: UnifediApiCardType.richStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'UnifediApiCardType.rich(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Rich &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$RichCopyWith<_Rich> get copyWith =>
      __$RichCopyWithImpl<_Rich>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) link,
    required TResult Function(String stringValue) photo,
    required TResult Function(String stringValue) video,
    required TResult Function(String stringValue) rich,
    required TResult Function(String stringValue) unknown,
  }) {
    return rich(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? link,
    TResult Function(String stringValue)? photo,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? rich,
    TResult Function(String stringValue)? unknown,
  }) {
    return rich?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? link,
    TResult Function(String stringValue)? photo,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? rich,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (rich != null) {
      return rich(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Link value) link,
    required TResult Function(_Photo value) photo,
    required TResult Function(_Video value) video,
    required TResult Function(_Rich value) rich,
    required TResult Function(_Unknown value) unknown,
  }) {
    return rich(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Link value)? link,
    TResult Function(_Photo value)? photo,
    TResult Function(_Video value)? video,
    TResult Function(_Rich value)? rich,
    TResult Function(_Unknown value)? unknown,
  }) {
    return rich?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Link value)? link,
    TResult Function(_Photo value)? photo,
    TResult Function(_Video value)? video,
    TResult Function(_Rich value)? rich,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (rich != null) {
      return rich(this);
    }
    return orElse();
  }
}

abstract class _Rich implements UnifediApiCardType {
  const factory _Rich({String stringValue}) = _$_Rich;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RichCopyWith<_Rich> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UnknownCopyWith<$Res>
    implements $UnifediApiCardTypeCopyWith<$Res> {
  factory _$UnknownCopyWith(_Unknown value, $Res Function(_Unknown) then) =
      __$UnknownCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$UnknownCopyWithImpl<$Res>
    extends _$UnifediApiCardTypeCopyWithImpl<$Res>
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
    return 'UnifediApiCardType.unknown(stringValue: $stringValue)';
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
    required TResult Function(String stringValue) link,
    required TResult Function(String stringValue) photo,
    required TResult Function(String stringValue) video,
    required TResult Function(String stringValue) rich,
    required TResult Function(String stringValue) unknown,
  }) {
    return unknown(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? link,
    TResult Function(String stringValue)? photo,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? rich,
    TResult Function(String stringValue)? unknown,
  }) {
    return unknown?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? link,
    TResult Function(String stringValue)? photo,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? rich,
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
    required TResult Function(_Link value) link,
    required TResult Function(_Photo value) photo,
    required TResult Function(_Video value) video,
    required TResult Function(_Rich value) rich,
    required TResult Function(_Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Link value)? link,
    TResult Function(_Photo value)? photo,
    TResult Function(_Video value)? video,
    TResult Function(_Rich value)? rich,
    TResult Function(_Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Link value)? link,
    TResult Function(_Photo value)? photo,
    TResult Function(_Video value)? video,
    TResult Function(_Rich value)? rich,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown implements UnifediApiCardType {
  const factory _Unknown({required String stringValue}) = _$_Unknown;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnknownCopyWith<_Unknown> get copyWith =>
      throw _privateConstructorUsedError;
}
