// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_media_attachment_type_sealed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PleromaApiMediaAttachmentTypeTearOff {
  const _$PleromaApiMediaAttachmentTypeTearOff();

  _Image image(
      {String stringValue = PleromaApiMediaAttachmentType.imageStringValue}) {
    return _Image(
      stringValue: stringValue,
    );
  }

  _Gifv gifv(
      {String stringValue = PleromaApiMediaAttachmentType.gifvStringValue}) {
    return _Gifv(
      stringValue: stringValue,
    );
  }

  _Video video(
      {String stringValue = PleromaApiMediaAttachmentType.videoStringValue}) {
    return _Video(
      stringValue: stringValue,
    );
  }

  _Audio audio(
      {String stringValue = PleromaApiMediaAttachmentType.audioStringValue}) {
    return _Audio(
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
const $PleromaApiMediaAttachmentType = _$PleromaApiMediaAttachmentTypeTearOff();

/// @nodoc
mixin _$PleromaApiMediaAttachmentType {
  String get stringValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) image,
    required TResult Function(String stringValue) gifv,
    required TResult Function(String stringValue) video,
    required TResult Function(String stringValue) audio,
    required TResult Function(String stringValue) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? image,
    TResult Function(String stringValue)? gifv,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? audio,
    TResult Function(String stringValue)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? image,
    TResult Function(String stringValue)? gifv,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? audio,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Image value) image,
    required TResult Function(_Gifv value) gifv,
    required TResult Function(_Video value) video,
    required TResult Function(_Audio value) audio,
    required TResult Function(_Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Image value)? image,
    TResult Function(_Gifv value)? gifv,
    TResult Function(_Video value)? video,
    TResult Function(_Audio value)? audio,
    TResult Function(_Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Image value)? image,
    TResult Function(_Gifv value)? gifv,
    TResult Function(_Video value)? video,
    TResult Function(_Audio value)? audio,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PleromaApiMediaAttachmentTypeCopyWith<PleromaApiMediaAttachmentType>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiMediaAttachmentTypeCopyWith<$Res> {
  factory $PleromaApiMediaAttachmentTypeCopyWith(
          PleromaApiMediaAttachmentType value,
          $Res Function(PleromaApiMediaAttachmentType) then) =
      _$PleromaApiMediaAttachmentTypeCopyWithImpl<$Res>;
  $Res call({String stringValue});
}

/// @nodoc
class _$PleromaApiMediaAttachmentTypeCopyWithImpl<$Res>
    implements $PleromaApiMediaAttachmentTypeCopyWith<$Res> {
  _$PleromaApiMediaAttachmentTypeCopyWithImpl(this._value, this._then);

  final PleromaApiMediaAttachmentType _value;
  // ignore: unused_field
  final $Res Function(PleromaApiMediaAttachmentType) _then;

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
abstract class _$ImageCopyWith<$Res>
    implements $PleromaApiMediaAttachmentTypeCopyWith<$Res> {
  factory _$ImageCopyWith(_Image value, $Res Function(_Image) then) =
      __$ImageCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$ImageCopyWithImpl<$Res>
    extends _$PleromaApiMediaAttachmentTypeCopyWithImpl<$Res>
    implements _$ImageCopyWith<$Res> {
  __$ImageCopyWithImpl(_Image _value, $Res Function(_Image) _then)
      : super(_value, (v) => _then(v as _Image));

  @override
  _Image get _value => super._value as _Image;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Image(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Image implements _Image {
  const _$_Image(
      {this.stringValue = PleromaApiMediaAttachmentType.imageStringValue});

  @JsonKey(defaultValue: PleromaApiMediaAttachmentType.imageStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'PleromaApiMediaAttachmentType.image(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Image &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$ImageCopyWith<_Image> get copyWith =>
      __$ImageCopyWithImpl<_Image>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) image,
    required TResult Function(String stringValue) gifv,
    required TResult Function(String stringValue) video,
    required TResult Function(String stringValue) audio,
    required TResult Function(String stringValue) unknown,
  }) {
    return image(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? image,
    TResult Function(String stringValue)? gifv,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? audio,
    TResult Function(String stringValue)? unknown,
  }) {
    return image?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? image,
    TResult Function(String stringValue)? gifv,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? audio,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (image != null) {
      return image(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Image value) image,
    required TResult Function(_Gifv value) gifv,
    required TResult Function(_Video value) video,
    required TResult Function(_Audio value) audio,
    required TResult Function(_Unknown value) unknown,
  }) {
    return image(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Image value)? image,
    TResult Function(_Gifv value)? gifv,
    TResult Function(_Video value)? video,
    TResult Function(_Audio value)? audio,
    TResult Function(_Unknown value)? unknown,
  }) {
    return image?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Image value)? image,
    TResult Function(_Gifv value)? gifv,
    TResult Function(_Video value)? video,
    TResult Function(_Audio value)? audio,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (image != null) {
      return image(this);
    }
    return orElse();
  }
}

abstract class _Image implements PleromaApiMediaAttachmentType {
  const factory _Image({String stringValue}) = _$_Image;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ImageCopyWith<_Image> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GifvCopyWith<$Res>
    implements $PleromaApiMediaAttachmentTypeCopyWith<$Res> {
  factory _$GifvCopyWith(_Gifv value, $Res Function(_Gifv) then) =
      __$GifvCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$GifvCopyWithImpl<$Res>
    extends _$PleromaApiMediaAttachmentTypeCopyWithImpl<$Res>
    implements _$GifvCopyWith<$Res> {
  __$GifvCopyWithImpl(_Gifv _value, $Res Function(_Gifv) _then)
      : super(_value, (v) => _then(v as _Gifv));

  @override
  _Gifv get _value => super._value as _Gifv;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Gifv(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Gifv implements _Gifv {
  const _$_Gifv(
      {this.stringValue = PleromaApiMediaAttachmentType.gifvStringValue});

  @JsonKey(defaultValue: PleromaApiMediaAttachmentType.gifvStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'PleromaApiMediaAttachmentType.gifv(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Gifv &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$GifvCopyWith<_Gifv> get copyWith =>
      __$GifvCopyWithImpl<_Gifv>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) image,
    required TResult Function(String stringValue) gifv,
    required TResult Function(String stringValue) video,
    required TResult Function(String stringValue) audio,
    required TResult Function(String stringValue) unknown,
  }) {
    return gifv(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? image,
    TResult Function(String stringValue)? gifv,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? audio,
    TResult Function(String stringValue)? unknown,
  }) {
    return gifv?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? image,
    TResult Function(String stringValue)? gifv,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? audio,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (gifv != null) {
      return gifv(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Image value) image,
    required TResult Function(_Gifv value) gifv,
    required TResult Function(_Video value) video,
    required TResult Function(_Audio value) audio,
    required TResult Function(_Unknown value) unknown,
  }) {
    return gifv(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Image value)? image,
    TResult Function(_Gifv value)? gifv,
    TResult Function(_Video value)? video,
    TResult Function(_Audio value)? audio,
    TResult Function(_Unknown value)? unknown,
  }) {
    return gifv?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Image value)? image,
    TResult Function(_Gifv value)? gifv,
    TResult Function(_Video value)? video,
    TResult Function(_Audio value)? audio,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (gifv != null) {
      return gifv(this);
    }
    return orElse();
  }
}

abstract class _Gifv implements PleromaApiMediaAttachmentType {
  const factory _Gifv({String stringValue}) = _$_Gifv;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GifvCopyWith<_Gifv> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$VideoCopyWith<$Res>
    implements $PleromaApiMediaAttachmentTypeCopyWith<$Res> {
  factory _$VideoCopyWith(_Video value, $Res Function(_Video) then) =
      __$VideoCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$VideoCopyWithImpl<$Res>
    extends _$PleromaApiMediaAttachmentTypeCopyWithImpl<$Res>
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
  const _$_Video(
      {this.stringValue = PleromaApiMediaAttachmentType.videoStringValue});

  @JsonKey(defaultValue: PleromaApiMediaAttachmentType.videoStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'PleromaApiMediaAttachmentType.video(stringValue: $stringValue)';
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
    required TResult Function(String stringValue) image,
    required TResult Function(String stringValue) gifv,
    required TResult Function(String stringValue) video,
    required TResult Function(String stringValue) audio,
    required TResult Function(String stringValue) unknown,
  }) {
    return video(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? image,
    TResult Function(String stringValue)? gifv,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? audio,
    TResult Function(String stringValue)? unknown,
  }) {
    return video?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? image,
    TResult Function(String stringValue)? gifv,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? audio,
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
    required TResult Function(_Image value) image,
    required TResult Function(_Gifv value) gifv,
    required TResult Function(_Video value) video,
    required TResult Function(_Audio value) audio,
    required TResult Function(_Unknown value) unknown,
  }) {
    return video(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Image value)? image,
    TResult Function(_Gifv value)? gifv,
    TResult Function(_Video value)? video,
    TResult Function(_Audio value)? audio,
    TResult Function(_Unknown value)? unknown,
  }) {
    return video?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Image value)? image,
    TResult Function(_Gifv value)? gifv,
    TResult Function(_Video value)? video,
    TResult Function(_Audio value)? audio,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (video != null) {
      return video(this);
    }
    return orElse();
  }
}

abstract class _Video implements PleromaApiMediaAttachmentType {
  const factory _Video({String stringValue}) = _$_Video;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VideoCopyWith<_Video> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AudioCopyWith<$Res>
    implements $PleromaApiMediaAttachmentTypeCopyWith<$Res> {
  factory _$AudioCopyWith(_Audio value, $Res Function(_Audio) then) =
      __$AudioCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$AudioCopyWithImpl<$Res>
    extends _$PleromaApiMediaAttachmentTypeCopyWithImpl<$Res>
    implements _$AudioCopyWith<$Res> {
  __$AudioCopyWithImpl(_Audio _value, $Res Function(_Audio) _then)
      : super(_value, (v) => _then(v as _Audio));

  @override
  _Audio get _value => super._value as _Audio;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Audio(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Audio implements _Audio {
  const _$_Audio(
      {this.stringValue = PleromaApiMediaAttachmentType.audioStringValue});

  @JsonKey(defaultValue: PleromaApiMediaAttachmentType.audioStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'PleromaApiMediaAttachmentType.audio(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Audio &&
            (identical(other.stringValue, stringValue) ||
                const DeepCollectionEquality()
                    .equals(other.stringValue, stringValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(stringValue);

  @JsonKey(ignore: true)
  @override
  _$AudioCopyWith<_Audio> get copyWith =>
      __$AudioCopyWithImpl<_Audio>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) image,
    required TResult Function(String stringValue) gifv,
    required TResult Function(String stringValue) video,
    required TResult Function(String stringValue) audio,
    required TResult Function(String stringValue) unknown,
  }) {
    return audio(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? image,
    TResult Function(String stringValue)? gifv,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? audio,
    TResult Function(String stringValue)? unknown,
  }) {
    return audio?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? image,
    TResult Function(String stringValue)? gifv,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? audio,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (audio != null) {
      return audio(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Image value) image,
    required TResult Function(_Gifv value) gifv,
    required TResult Function(_Video value) video,
    required TResult Function(_Audio value) audio,
    required TResult Function(_Unknown value) unknown,
  }) {
    return audio(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Image value)? image,
    TResult Function(_Gifv value)? gifv,
    TResult Function(_Video value)? video,
    TResult Function(_Audio value)? audio,
    TResult Function(_Unknown value)? unknown,
  }) {
    return audio?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Image value)? image,
    TResult Function(_Gifv value)? gifv,
    TResult Function(_Video value)? video,
    TResult Function(_Audio value)? audio,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (audio != null) {
      return audio(this);
    }
    return orElse();
  }
}

abstract class _Audio implements PleromaApiMediaAttachmentType {
  const factory _Audio({String stringValue}) = _$_Audio;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AudioCopyWith<_Audio> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UnknownCopyWith<$Res>
    implements $PleromaApiMediaAttachmentTypeCopyWith<$Res> {
  factory _$UnknownCopyWith(_Unknown value, $Res Function(_Unknown) then) =
      __$UnknownCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$UnknownCopyWithImpl<$Res>
    extends _$PleromaApiMediaAttachmentTypeCopyWithImpl<$Res>
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
    return 'PleromaApiMediaAttachmentType.unknown(stringValue: $stringValue)';
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
    required TResult Function(String stringValue) image,
    required TResult Function(String stringValue) gifv,
    required TResult Function(String stringValue) video,
    required TResult Function(String stringValue) audio,
    required TResult Function(String stringValue) unknown,
  }) {
    return unknown(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? image,
    TResult Function(String stringValue)? gifv,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? audio,
    TResult Function(String stringValue)? unknown,
  }) {
    return unknown?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? image,
    TResult Function(String stringValue)? gifv,
    TResult Function(String stringValue)? video,
    TResult Function(String stringValue)? audio,
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
    required TResult Function(_Image value) image,
    required TResult Function(_Gifv value) gifv,
    required TResult Function(_Video value) video,
    required TResult Function(_Audio value) audio,
    required TResult Function(_Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Image value)? image,
    TResult Function(_Gifv value)? gifv,
    TResult Function(_Video value)? video,
    TResult Function(_Audio value)? audio,
    TResult Function(_Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Image value)? image,
    TResult Function(_Gifv value)? gifv,
    TResult Function(_Video value)? video,
    TResult Function(_Audio value)? audio,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown implements PleromaApiMediaAttachmentType {
  const factory _Unknown({required String stringValue}) = _$_Unknown;

  @override
  String get stringValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnknownCopyWith<_Unknown> get copyWith =>
      throw _privateConstructorUsedError;
}
