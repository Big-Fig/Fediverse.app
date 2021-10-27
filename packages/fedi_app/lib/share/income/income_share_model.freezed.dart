// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'income_share_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$IncomeShareEventTearOff {
  const _$IncomeShareEventTearOff();

  _IncomeShareEvent call(
      {required String? text, required List<IncomeShareEventMedia>? medias}) {
    return _IncomeShareEvent(
      text: text,
      medias: medias,
    );
  }
}

/// @nodoc
const $IncomeShareEvent = _$IncomeShareEventTearOff();

/// @nodoc
mixin _$IncomeShareEvent {
  String? get text => throw _privateConstructorUsedError;
  List<IncomeShareEventMedia>? get medias => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IncomeShareEventCopyWith<IncomeShareEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeShareEventCopyWith<$Res> {
  factory $IncomeShareEventCopyWith(
          IncomeShareEvent value, $Res Function(IncomeShareEvent) then) =
      _$IncomeShareEventCopyWithImpl<$Res>;
  $Res call({String? text, List<IncomeShareEventMedia>? medias});
}

/// @nodoc
class _$IncomeShareEventCopyWithImpl<$Res>
    implements $IncomeShareEventCopyWith<$Res> {
  _$IncomeShareEventCopyWithImpl(this._value, this._then);

  final IncomeShareEvent _value;
  // ignore: unused_field
  final $Res Function(IncomeShareEvent) _then;

  @override
  $Res call({
    Object? text = freezed,
    Object? medias = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      medias: medias == freezed
          ? _value.medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<IncomeShareEventMedia>?,
    ));
  }
}

/// @nodoc
abstract class _$IncomeShareEventCopyWith<$Res>
    implements $IncomeShareEventCopyWith<$Res> {
  factory _$IncomeShareEventCopyWith(
          _IncomeShareEvent value, $Res Function(_IncomeShareEvent) then) =
      __$IncomeShareEventCopyWithImpl<$Res>;
  @override
  $Res call({String? text, List<IncomeShareEventMedia>? medias});
}

/// @nodoc
class __$IncomeShareEventCopyWithImpl<$Res>
    extends _$IncomeShareEventCopyWithImpl<$Res>
    implements _$IncomeShareEventCopyWith<$Res> {
  __$IncomeShareEventCopyWithImpl(
      _IncomeShareEvent _value, $Res Function(_IncomeShareEvent) _then)
      : super(_value, (v) => _then(v as _IncomeShareEvent));

  @override
  _IncomeShareEvent get _value => super._value as _IncomeShareEvent;

  @override
  $Res call({
    Object? text = freezed,
    Object? medias = freezed,
  }) {
    return _then(_IncomeShareEvent(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      medias: medias == freezed
          ? _value.medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<IncomeShareEventMedia>?,
    ));
  }
}

/// @nodoc

class _$_IncomeShareEvent implements _IncomeShareEvent {
  const _$_IncomeShareEvent({required this.text, required this.medias});

  @override
  final String? text;
  @override
  final List<IncomeShareEventMedia>? medias;

  @override
  String toString() {
    return 'IncomeShareEvent(text: $text, medias: $medias)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IncomeShareEvent &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other.medias, medias));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, text, const DeepCollectionEquality().hash(medias));

  @JsonKey(ignore: true)
  @override
  _$IncomeShareEventCopyWith<_IncomeShareEvent> get copyWith =>
      __$IncomeShareEventCopyWithImpl<_IncomeShareEvent>(this, _$identity);
}

abstract class _IncomeShareEvent implements IncomeShareEvent {
  const factory _IncomeShareEvent(
      {required String? text,
      required List<IncomeShareEventMedia>? medias}) = _$_IncomeShareEvent;

  @override
  String? get text;
  @override
  List<IncomeShareEventMedia>? get medias;
  @override
  @JsonKey(ignore: true)
  _$IncomeShareEventCopyWith<_IncomeShareEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$IncomeShareEventMediaTearOff {
  const _$IncomeShareEventMediaTearOff();

  _IncomeShareEventMedia call(
      {required String path,
      required String? thumbnail,
      required int? duration,
      required IncomeShareEventMediaType type}) {
    return _IncomeShareEventMedia(
      path: path,
      thumbnail: thumbnail,
      duration: duration,
      type: type,
    );
  }
}

/// @nodoc
const $IncomeShareEventMedia = _$IncomeShareEventMediaTearOff();

/// @nodoc
mixin _$IncomeShareEventMedia {
  String get path => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  IncomeShareEventMediaType get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IncomeShareEventMediaCopyWith<IncomeShareEventMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeShareEventMediaCopyWith<$Res> {
  factory $IncomeShareEventMediaCopyWith(IncomeShareEventMedia value,
          $Res Function(IncomeShareEventMedia) then) =
      _$IncomeShareEventMediaCopyWithImpl<$Res>;
  $Res call(
      {String path,
      String? thumbnail,
      int? duration,
      IncomeShareEventMediaType type});
}

/// @nodoc
class _$IncomeShareEventMediaCopyWithImpl<$Res>
    implements $IncomeShareEventMediaCopyWith<$Res> {
  _$IncomeShareEventMediaCopyWithImpl(this._value, this._then);

  final IncomeShareEventMedia _value;
  // ignore: unused_field
  final $Res Function(IncomeShareEventMedia) _then;

  @override
  $Res call({
    Object? path = freezed,
    Object? thumbnail = freezed,
    Object? duration = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as IncomeShareEventMediaType,
    ));
  }
}

/// @nodoc
abstract class _$IncomeShareEventMediaCopyWith<$Res>
    implements $IncomeShareEventMediaCopyWith<$Res> {
  factory _$IncomeShareEventMediaCopyWith(_IncomeShareEventMedia value,
          $Res Function(_IncomeShareEventMedia) then) =
      __$IncomeShareEventMediaCopyWithImpl<$Res>;
  @override
  $Res call(
      {String path,
      String? thumbnail,
      int? duration,
      IncomeShareEventMediaType type});
}

/// @nodoc
class __$IncomeShareEventMediaCopyWithImpl<$Res>
    extends _$IncomeShareEventMediaCopyWithImpl<$Res>
    implements _$IncomeShareEventMediaCopyWith<$Res> {
  __$IncomeShareEventMediaCopyWithImpl(_IncomeShareEventMedia _value,
      $Res Function(_IncomeShareEventMedia) _then)
      : super(_value, (v) => _then(v as _IncomeShareEventMedia));

  @override
  _IncomeShareEventMedia get _value => super._value as _IncomeShareEventMedia;

  @override
  $Res call({
    Object? path = freezed,
    Object? thumbnail = freezed,
    Object? duration = freezed,
    Object? type = freezed,
  }) {
    return _then(_IncomeShareEventMedia(
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as IncomeShareEventMediaType,
    ));
  }
}

/// @nodoc

class _$_IncomeShareEventMedia implements _IncomeShareEventMedia {
  const _$_IncomeShareEventMedia(
      {required this.path,
      required this.thumbnail,
      required this.duration,
      required this.type});

  @override
  final String path;
  @override
  final String? thumbnail;
  @override
  final int? duration;
  @override
  final IncomeShareEventMediaType type;

  @override
  String toString() {
    return 'IncomeShareEventMedia(path: $path, thumbnail: $thumbnail, duration: $duration, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IncomeShareEventMedia &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path, thumbnail, duration, type);

  @JsonKey(ignore: true)
  @override
  _$IncomeShareEventMediaCopyWith<_IncomeShareEventMedia> get copyWith =>
      __$IncomeShareEventMediaCopyWithImpl<_IncomeShareEventMedia>(
          this, _$identity);
}

abstract class _IncomeShareEventMedia implements IncomeShareEventMedia {
  const factory _IncomeShareEventMedia(
      {required String path,
      required String? thumbnail,
      required int? duration,
      required IncomeShareEventMediaType type}) = _$_IncomeShareEventMedia;

  @override
  String get path;
  @override
  String? get thumbnail;
  @override
  int? get duration;
  @override
  IncomeShareEventMediaType get type;
  @override
  @JsonKey(ignore: true)
  _$IncomeShareEventMediaCopyWith<_IncomeShareEventMedia> get copyWith =>
      throw _privateConstructorUsedError;
}
