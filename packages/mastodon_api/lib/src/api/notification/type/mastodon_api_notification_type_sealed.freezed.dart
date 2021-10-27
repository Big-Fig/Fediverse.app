// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_notification_type_sealed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MastodonApiNotificationTypeTearOff {
  const _$MastodonApiNotificationTypeTearOff();

  _Follow follow(
      {String stringValue = MastodonApiNotificationType.followStringValue}) {
    return _Follow(
      stringValue: stringValue,
    );
  }

  _Favourite favourite(
      {String stringValue = MastodonApiNotificationType.favouriteStringValue}) {
    return _Favourite(
      stringValue: stringValue,
    );
  }

  _Reblog reblog(
      {String stringValue = MastodonApiNotificationType.reblogStringValue}) {
    return _Reblog(
      stringValue: stringValue,
    );
  }

  _Mention mention(
      {String stringValue = MastodonApiNotificationType.mentionStringValue}) {
    return _Mention(
      stringValue: stringValue,
    );
  }

  _Poll poll(
      {String stringValue = MastodonApiNotificationType.pollStringValue}) {
    return _Poll(
      stringValue: stringValue,
    );
  }

  _Move move(
      {String stringValue = MastodonApiNotificationType.moveStringValue}) {
    return _Move(
      stringValue: stringValue,
    );
  }

  _followRequest followRequest(
      {String stringValue =
          MastodonApiNotificationType.followRequestStringValue}) {
    return _followRequest(
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
const $MastodonApiNotificationType = _$MastodonApiNotificationTypeTearOff();

/// @nodoc
mixin _$MastodonApiNotificationType {
  String get stringValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) follow,
    required TResult Function(String stringValue) favourite,
    required TResult Function(String stringValue) reblog,
    required TResult Function(String stringValue) mention,
    required TResult Function(String stringValue) poll,
    required TResult Function(String stringValue) move,
    required TResult Function(String stringValue) followRequest,
    required TResult Function(String stringValue) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? follow,
    TResult Function(String stringValue)? favourite,
    TResult Function(String stringValue)? reblog,
    TResult Function(String stringValue)? mention,
    TResult Function(String stringValue)? poll,
    TResult Function(String stringValue)? move,
    TResult Function(String stringValue)? followRequest,
    TResult Function(String stringValue)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? follow,
    TResult Function(String stringValue)? favourite,
    TResult Function(String stringValue)? reblog,
    TResult Function(String stringValue)? mention,
    TResult Function(String stringValue)? poll,
    TResult Function(String stringValue)? move,
    TResult Function(String stringValue)? followRequest,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Follow value) follow,
    required TResult Function(_Favourite value) favourite,
    required TResult Function(_Reblog value) reblog,
    required TResult Function(_Mention value) mention,
    required TResult Function(_Poll value) poll,
    required TResult Function(_Move value) move,
    required TResult Function(_followRequest value) followRequest,
    required TResult Function(_Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Follow value)? follow,
    TResult Function(_Favourite value)? favourite,
    TResult Function(_Reblog value)? reblog,
    TResult Function(_Mention value)? mention,
    TResult Function(_Poll value)? poll,
    TResult Function(_Move value)? move,
    TResult Function(_followRequest value)? followRequest,
    TResult Function(_Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Follow value)? follow,
    TResult Function(_Favourite value)? favourite,
    TResult Function(_Reblog value)? reblog,
    TResult Function(_Mention value)? mention,
    TResult Function(_Poll value)? poll,
    TResult Function(_Move value)? move,
    TResult Function(_followRequest value)? followRequest,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MastodonApiNotificationTypeCopyWith<MastodonApiNotificationType>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiNotificationTypeCopyWith<$Res> {
  factory $MastodonApiNotificationTypeCopyWith(
          MastodonApiNotificationType value,
          $Res Function(MastodonApiNotificationType) then) =
      _$MastodonApiNotificationTypeCopyWithImpl<$Res>;
  $Res call({String stringValue});
}

/// @nodoc
class _$MastodonApiNotificationTypeCopyWithImpl<$Res>
    implements $MastodonApiNotificationTypeCopyWith<$Res> {
  _$MastodonApiNotificationTypeCopyWithImpl(this._value, this._then);

  final MastodonApiNotificationType _value;
  // ignore: unused_field
  final $Res Function(MastodonApiNotificationType) _then;

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
abstract class _$FollowCopyWith<$Res>
    implements $MastodonApiNotificationTypeCopyWith<$Res> {
  factory _$FollowCopyWith(_Follow value, $Res Function(_Follow) then) =
      __$FollowCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$FollowCopyWithImpl<$Res>
    extends _$MastodonApiNotificationTypeCopyWithImpl<$Res>
    implements _$FollowCopyWith<$Res> {
  __$FollowCopyWithImpl(_Follow _value, $Res Function(_Follow) _then)
      : super(_value, (v) => _then(v as _Follow));

  @override
  _Follow get _value => super._value as _Follow;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Follow(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Follow implements _Follow {
  const _$_Follow(
      {this.stringValue = MastodonApiNotificationType.followStringValue});

  @JsonKey(defaultValue: MastodonApiNotificationType.followStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiNotificationType.follow(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Follow &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$FollowCopyWith<_Follow> get copyWith =>
      __$FollowCopyWithImpl<_Follow>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) follow,
    required TResult Function(String stringValue) favourite,
    required TResult Function(String stringValue) reblog,
    required TResult Function(String stringValue) mention,
    required TResult Function(String stringValue) poll,
    required TResult Function(String stringValue) move,
    required TResult Function(String stringValue) followRequest,
    required TResult Function(String stringValue) unknown,
  }) {
    return follow(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? follow,
    TResult Function(String stringValue)? favourite,
    TResult Function(String stringValue)? reblog,
    TResult Function(String stringValue)? mention,
    TResult Function(String stringValue)? poll,
    TResult Function(String stringValue)? move,
    TResult Function(String stringValue)? followRequest,
    TResult Function(String stringValue)? unknown,
  }) {
    return follow?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? follow,
    TResult Function(String stringValue)? favourite,
    TResult Function(String stringValue)? reblog,
    TResult Function(String stringValue)? mention,
    TResult Function(String stringValue)? poll,
    TResult Function(String stringValue)? move,
    TResult Function(String stringValue)? followRequest,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (follow != null) {
      return follow(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Follow value) follow,
    required TResult Function(_Favourite value) favourite,
    required TResult Function(_Reblog value) reblog,
    required TResult Function(_Mention value) mention,
    required TResult Function(_Poll value) poll,
    required TResult Function(_Move value) move,
    required TResult Function(_followRequest value) followRequest,
    required TResult Function(_Unknown value) unknown,
  }) {
    return follow(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Follow value)? follow,
    TResult Function(_Favourite value)? favourite,
    TResult Function(_Reblog value)? reblog,
    TResult Function(_Mention value)? mention,
    TResult Function(_Poll value)? poll,
    TResult Function(_Move value)? move,
    TResult Function(_followRequest value)? followRequest,
    TResult Function(_Unknown value)? unknown,
  }) {
    return follow?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Follow value)? follow,
    TResult Function(_Favourite value)? favourite,
    TResult Function(_Reblog value)? reblog,
    TResult Function(_Mention value)? mention,
    TResult Function(_Poll value)? poll,
    TResult Function(_Move value)? move,
    TResult Function(_followRequest value)? followRequest,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (follow != null) {
      return follow(this);
    }
    return orElse();
  }
}

abstract class _Follow implements MastodonApiNotificationType {
  const factory _Follow({String stringValue}) = _$_Follow;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$FollowCopyWith<_Follow> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FavouriteCopyWith<$Res>
    implements $MastodonApiNotificationTypeCopyWith<$Res> {
  factory _$FavouriteCopyWith(
          _Favourite value, $Res Function(_Favourite) then) =
      __$FavouriteCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$FavouriteCopyWithImpl<$Res>
    extends _$MastodonApiNotificationTypeCopyWithImpl<$Res>
    implements _$FavouriteCopyWith<$Res> {
  __$FavouriteCopyWithImpl(_Favourite _value, $Res Function(_Favourite) _then)
      : super(_value, (v) => _then(v as _Favourite));

  @override
  _Favourite get _value => super._value as _Favourite;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Favourite(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Favourite implements _Favourite {
  const _$_Favourite(
      {this.stringValue = MastodonApiNotificationType.favouriteStringValue});

  @JsonKey(defaultValue: MastodonApiNotificationType.favouriteStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiNotificationType.favourite(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Favourite &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$FavouriteCopyWith<_Favourite> get copyWith =>
      __$FavouriteCopyWithImpl<_Favourite>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) follow,
    required TResult Function(String stringValue) favourite,
    required TResult Function(String stringValue) reblog,
    required TResult Function(String stringValue) mention,
    required TResult Function(String stringValue) poll,
    required TResult Function(String stringValue) move,
    required TResult Function(String stringValue) followRequest,
    required TResult Function(String stringValue) unknown,
  }) {
    return favourite(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? follow,
    TResult Function(String stringValue)? favourite,
    TResult Function(String stringValue)? reblog,
    TResult Function(String stringValue)? mention,
    TResult Function(String stringValue)? poll,
    TResult Function(String stringValue)? move,
    TResult Function(String stringValue)? followRequest,
    TResult Function(String stringValue)? unknown,
  }) {
    return favourite?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? follow,
    TResult Function(String stringValue)? favourite,
    TResult Function(String stringValue)? reblog,
    TResult Function(String stringValue)? mention,
    TResult Function(String stringValue)? poll,
    TResult Function(String stringValue)? move,
    TResult Function(String stringValue)? followRequest,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (favourite != null) {
      return favourite(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Follow value) follow,
    required TResult Function(_Favourite value) favourite,
    required TResult Function(_Reblog value) reblog,
    required TResult Function(_Mention value) mention,
    required TResult Function(_Poll value) poll,
    required TResult Function(_Move value) move,
    required TResult Function(_followRequest value) followRequest,
    required TResult Function(_Unknown value) unknown,
  }) {
    return favourite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Follow value)? follow,
    TResult Function(_Favourite value)? favourite,
    TResult Function(_Reblog value)? reblog,
    TResult Function(_Mention value)? mention,
    TResult Function(_Poll value)? poll,
    TResult Function(_Move value)? move,
    TResult Function(_followRequest value)? followRequest,
    TResult Function(_Unknown value)? unknown,
  }) {
    return favourite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Follow value)? follow,
    TResult Function(_Favourite value)? favourite,
    TResult Function(_Reblog value)? reblog,
    TResult Function(_Mention value)? mention,
    TResult Function(_Poll value)? poll,
    TResult Function(_Move value)? move,
    TResult Function(_followRequest value)? followRequest,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (favourite != null) {
      return favourite(this);
    }
    return orElse();
  }
}

abstract class _Favourite implements MastodonApiNotificationType {
  const factory _Favourite({String stringValue}) = _$_Favourite;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$FavouriteCopyWith<_Favourite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ReblogCopyWith<$Res>
    implements $MastodonApiNotificationTypeCopyWith<$Res> {
  factory _$ReblogCopyWith(_Reblog value, $Res Function(_Reblog) then) =
      __$ReblogCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$ReblogCopyWithImpl<$Res>
    extends _$MastodonApiNotificationTypeCopyWithImpl<$Res>
    implements _$ReblogCopyWith<$Res> {
  __$ReblogCopyWithImpl(_Reblog _value, $Res Function(_Reblog) _then)
      : super(_value, (v) => _then(v as _Reblog));

  @override
  _Reblog get _value => super._value as _Reblog;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Reblog(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Reblog implements _Reblog {
  const _$_Reblog(
      {this.stringValue = MastodonApiNotificationType.reblogStringValue});

  @JsonKey(defaultValue: MastodonApiNotificationType.reblogStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiNotificationType.reblog(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Reblog &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$ReblogCopyWith<_Reblog> get copyWith =>
      __$ReblogCopyWithImpl<_Reblog>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) follow,
    required TResult Function(String stringValue) favourite,
    required TResult Function(String stringValue) reblog,
    required TResult Function(String stringValue) mention,
    required TResult Function(String stringValue) poll,
    required TResult Function(String stringValue) move,
    required TResult Function(String stringValue) followRequest,
    required TResult Function(String stringValue) unknown,
  }) {
    return reblog(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? follow,
    TResult Function(String stringValue)? favourite,
    TResult Function(String stringValue)? reblog,
    TResult Function(String stringValue)? mention,
    TResult Function(String stringValue)? poll,
    TResult Function(String stringValue)? move,
    TResult Function(String stringValue)? followRequest,
    TResult Function(String stringValue)? unknown,
  }) {
    return reblog?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? follow,
    TResult Function(String stringValue)? favourite,
    TResult Function(String stringValue)? reblog,
    TResult Function(String stringValue)? mention,
    TResult Function(String stringValue)? poll,
    TResult Function(String stringValue)? move,
    TResult Function(String stringValue)? followRequest,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (reblog != null) {
      return reblog(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Follow value) follow,
    required TResult Function(_Favourite value) favourite,
    required TResult Function(_Reblog value) reblog,
    required TResult Function(_Mention value) mention,
    required TResult Function(_Poll value) poll,
    required TResult Function(_Move value) move,
    required TResult Function(_followRequest value) followRequest,
    required TResult Function(_Unknown value) unknown,
  }) {
    return reblog(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Follow value)? follow,
    TResult Function(_Favourite value)? favourite,
    TResult Function(_Reblog value)? reblog,
    TResult Function(_Mention value)? mention,
    TResult Function(_Poll value)? poll,
    TResult Function(_Move value)? move,
    TResult Function(_followRequest value)? followRequest,
    TResult Function(_Unknown value)? unknown,
  }) {
    return reblog?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Follow value)? follow,
    TResult Function(_Favourite value)? favourite,
    TResult Function(_Reblog value)? reblog,
    TResult Function(_Mention value)? mention,
    TResult Function(_Poll value)? poll,
    TResult Function(_Move value)? move,
    TResult Function(_followRequest value)? followRequest,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (reblog != null) {
      return reblog(this);
    }
    return orElse();
  }
}

abstract class _Reblog implements MastodonApiNotificationType {
  const factory _Reblog({String stringValue}) = _$_Reblog;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$ReblogCopyWith<_Reblog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$MentionCopyWith<$Res>
    implements $MastodonApiNotificationTypeCopyWith<$Res> {
  factory _$MentionCopyWith(_Mention value, $Res Function(_Mention) then) =
      __$MentionCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$MentionCopyWithImpl<$Res>
    extends _$MastodonApiNotificationTypeCopyWithImpl<$Res>
    implements _$MentionCopyWith<$Res> {
  __$MentionCopyWithImpl(_Mention _value, $Res Function(_Mention) _then)
      : super(_value, (v) => _then(v as _Mention));

  @override
  _Mention get _value => super._value as _Mention;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Mention(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Mention implements _Mention {
  const _$_Mention(
      {this.stringValue = MastodonApiNotificationType.mentionStringValue});

  @JsonKey(defaultValue: MastodonApiNotificationType.mentionStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiNotificationType.mention(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Mention &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$MentionCopyWith<_Mention> get copyWith =>
      __$MentionCopyWithImpl<_Mention>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) follow,
    required TResult Function(String stringValue) favourite,
    required TResult Function(String stringValue) reblog,
    required TResult Function(String stringValue) mention,
    required TResult Function(String stringValue) poll,
    required TResult Function(String stringValue) move,
    required TResult Function(String stringValue) followRequest,
    required TResult Function(String stringValue) unknown,
  }) {
    return mention(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? follow,
    TResult Function(String stringValue)? favourite,
    TResult Function(String stringValue)? reblog,
    TResult Function(String stringValue)? mention,
    TResult Function(String stringValue)? poll,
    TResult Function(String stringValue)? move,
    TResult Function(String stringValue)? followRequest,
    TResult Function(String stringValue)? unknown,
  }) {
    return mention?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? follow,
    TResult Function(String stringValue)? favourite,
    TResult Function(String stringValue)? reblog,
    TResult Function(String stringValue)? mention,
    TResult Function(String stringValue)? poll,
    TResult Function(String stringValue)? move,
    TResult Function(String stringValue)? followRequest,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (mention != null) {
      return mention(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Follow value) follow,
    required TResult Function(_Favourite value) favourite,
    required TResult Function(_Reblog value) reblog,
    required TResult Function(_Mention value) mention,
    required TResult Function(_Poll value) poll,
    required TResult Function(_Move value) move,
    required TResult Function(_followRequest value) followRequest,
    required TResult Function(_Unknown value) unknown,
  }) {
    return mention(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Follow value)? follow,
    TResult Function(_Favourite value)? favourite,
    TResult Function(_Reblog value)? reblog,
    TResult Function(_Mention value)? mention,
    TResult Function(_Poll value)? poll,
    TResult Function(_Move value)? move,
    TResult Function(_followRequest value)? followRequest,
    TResult Function(_Unknown value)? unknown,
  }) {
    return mention?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Follow value)? follow,
    TResult Function(_Favourite value)? favourite,
    TResult Function(_Reblog value)? reblog,
    TResult Function(_Mention value)? mention,
    TResult Function(_Poll value)? poll,
    TResult Function(_Move value)? move,
    TResult Function(_followRequest value)? followRequest,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (mention != null) {
      return mention(this);
    }
    return orElse();
  }
}

abstract class _Mention implements MastodonApiNotificationType {
  const factory _Mention({String stringValue}) = _$_Mention;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$MentionCopyWith<_Mention> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PollCopyWith<$Res>
    implements $MastodonApiNotificationTypeCopyWith<$Res> {
  factory _$PollCopyWith(_Poll value, $Res Function(_Poll) then) =
      __$PollCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$PollCopyWithImpl<$Res>
    extends _$MastodonApiNotificationTypeCopyWithImpl<$Res>
    implements _$PollCopyWith<$Res> {
  __$PollCopyWithImpl(_Poll _value, $Res Function(_Poll) _then)
      : super(_value, (v) => _then(v as _Poll));

  @override
  _Poll get _value => super._value as _Poll;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Poll(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Poll implements _Poll {
  const _$_Poll(
      {this.stringValue = MastodonApiNotificationType.pollStringValue});

  @JsonKey(defaultValue: MastodonApiNotificationType.pollStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiNotificationType.poll(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Poll &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$PollCopyWith<_Poll> get copyWith =>
      __$PollCopyWithImpl<_Poll>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) follow,
    required TResult Function(String stringValue) favourite,
    required TResult Function(String stringValue) reblog,
    required TResult Function(String stringValue) mention,
    required TResult Function(String stringValue) poll,
    required TResult Function(String stringValue) move,
    required TResult Function(String stringValue) followRequest,
    required TResult Function(String stringValue) unknown,
  }) {
    return poll(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? follow,
    TResult Function(String stringValue)? favourite,
    TResult Function(String stringValue)? reblog,
    TResult Function(String stringValue)? mention,
    TResult Function(String stringValue)? poll,
    TResult Function(String stringValue)? move,
    TResult Function(String stringValue)? followRequest,
    TResult Function(String stringValue)? unknown,
  }) {
    return poll?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? follow,
    TResult Function(String stringValue)? favourite,
    TResult Function(String stringValue)? reblog,
    TResult Function(String stringValue)? mention,
    TResult Function(String stringValue)? poll,
    TResult Function(String stringValue)? move,
    TResult Function(String stringValue)? followRequest,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (poll != null) {
      return poll(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Follow value) follow,
    required TResult Function(_Favourite value) favourite,
    required TResult Function(_Reblog value) reblog,
    required TResult Function(_Mention value) mention,
    required TResult Function(_Poll value) poll,
    required TResult Function(_Move value) move,
    required TResult Function(_followRequest value) followRequest,
    required TResult Function(_Unknown value) unknown,
  }) {
    return poll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Follow value)? follow,
    TResult Function(_Favourite value)? favourite,
    TResult Function(_Reblog value)? reblog,
    TResult Function(_Mention value)? mention,
    TResult Function(_Poll value)? poll,
    TResult Function(_Move value)? move,
    TResult Function(_followRequest value)? followRequest,
    TResult Function(_Unknown value)? unknown,
  }) {
    return poll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Follow value)? follow,
    TResult Function(_Favourite value)? favourite,
    TResult Function(_Reblog value)? reblog,
    TResult Function(_Mention value)? mention,
    TResult Function(_Poll value)? poll,
    TResult Function(_Move value)? move,
    TResult Function(_followRequest value)? followRequest,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (poll != null) {
      return poll(this);
    }
    return orElse();
  }
}

abstract class _Poll implements MastodonApiNotificationType {
  const factory _Poll({String stringValue}) = _$_Poll;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$PollCopyWith<_Poll> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$MoveCopyWith<$Res>
    implements $MastodonApiNotificationTypeCopyWith<$Res> {
  factory _$MoveCopyWith(_Move value, $Res Function(_Move) then) =
      __$MoveCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$MoveCopyWithImpl<$Res>
    extends _$MastodonApiNotificationTypeCopyWithImpl<$Res>
    implements _$MoveCopyWith<$Res> {
  __$MoveCopyWithImpl(_Move _value, $Res Function(_Move) _then)
      : super(_value, (v) => _then(v as _Move));

  @override
  _Move get _value => super._value as _Move;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_Move(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Move implements _Move {
  const _$_Move(
      {this.stringValue = MastodonApiNotificationType.moveStringValue});

  @JsonKey(defaultValue: MastodonApiNotificationType.moveStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiNotificationType.move(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Move &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$MoveCopyWith<_Move> get copyWith =>
      __$MoveCopyWithImpl<_Move>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) follow,
    required TResult Function(String stringValue) favourite,
    required TResult Function(String stringValue) reblog,
    required TResult Function(String stringValue) mention,
    required TResult Function(String stringValue) poll,
    required TResult Function(String stringValue) move,
    required TResult Function(String stringValue) followRequest,
    required TResult Function(String stringValue) unknown,
  }) {
    return move(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? follow,
    TResult Function(String stringValue)? favourite,
    TResult Function(String stringValue)? reblog,
    TResult Function(String stringValue)? mention,
    TResult Function(String stringValue)? poll,
    TResult Function(String stringValue)? move,
    TResult Function(String stringValue)? followRequest,
    TResult Function(String stringValue)? unknown,
  }) {
    return move?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? follow,
    TResult Function(String stringValue)? favourite,
    TResult Function(String stringValue)? reblog,
    TResult Function(String stringValue)? mention,
    TResult Function(String stringValue)? poll,
    TResult Function(String stringValue)? move,
    TResult Function(String stringValue)? followRequest,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (move != null) {
      return move(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Follow value) follow,
    required TResult Function(_Favourite value) favourite,
    required TResult Function(_Reblog value) reblog,
    required TResult Function(_Mention value) mention,
    required TResult Function(_Poll value) poll,
    required TResult Function(_Move value) move,
    required TResult Function(_followRequest value) followRequest,
    required TResult Function(_Unknown value) unknown,
  }) {
    return move(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Follow value)? follow,
    TResult Function(_Favourite value)? favourite,
    TResult Function(_Reblog value)? reblog,
    TResult Function(_Mention value)? mention,
    TResult Function(_Poll value)? poll,
    TResult Function(_Move value)? move,
    TResult Function(_followRequest value)? followRequest,
    TResult Function(_Unknown value)? unknown,
  }) {
    return move?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Follow value)? follow,
    TResult Function(_Favourite value)? favourite,
    TResult Function(_Reblog value)? reblog,
    TResult Function(_Mention value)? mention,
    TResult Function(_Poll value)? poll,
    TResult Function(_Move value)? move,
    TResult Function(_followRequest value)? followRequest,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (move != null) {
      return move(this);
    }
    return orElse();
  }
}

abstract class _Move implements MastodonApiNotificationType {
  const factory _Move({String stringValue}) = _$_Move;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$MoveCopyWith<_Move> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$followRequestCopyWith<$Res>
    implements $MastodonApiNotificationTypeCopyWith<$Res> {
  factory _$followRequestCopyWith(
          _followRequest value, $Res Function(_followRequest) then) =
      __$followRequestCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$followRequestCopyWithImpl<$Res>
    extends _$MastodonApiNotificationTypeCopyWithImpl<$Res>
    implements _$followRequestCopyWith<$Res> {
  __$followRequestCopyWithImpl(
      _followRequest _value, $Res Function(_followRequest) _then)
      : super(_value, (v) => _then(v as _followRequest));

  @override
  _followRequest get _value => super._value as _followRequest;

  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_followRequest(
      stringValue: stringValue == freezed
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_followRequest implements _followRequest {
  const _$_followRequest(
      {this.stringValue =
          MastodonApiNotificationType.followRequestStringValue});

  @JsonKey(defaultValue: MastodonApiNotificationType.followRequestStringValue)
  @override
  final String stringValue;

  @override
  String toString() {
    return 'MastodonApiNotificationType.followRequest(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _followRequest &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$followRequestCopyWith<_followRequest> get copyWith =>
      __$followRequestCopyWithImpl<_followRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) follow,
    required TResult Function(String stringValue) favourite,
    required TResult Function(String stringValue) reblog,
    required TResult Function(String stringValue) mention,
    required TResult Function(String stringValue) poll,
    required TResult Function(String stringValue) move,
    required TResult Function(String stringValue) followRequest,
    required TResult Function(String stringValue) unknown,
  }) {
    return followRequest(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? follow,
    TResult Function(String stringValue)? favourite,
    TResult Function(String stringValue)? reblog,
    TResult Function(String stringValue)? mention,
    TResult Function(String stringValue)? poll,
    TResult Function(String stringValue)? move,
    TResult Function(String stringValue)? followRequest,
    TResult Function(String stringValue)? unknown,
  }) {
    return followRequest?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? follow,
    TResult Function(String stringValue)? favourite,
    TResult Function(String stringValue)? reblog,
    TResult Function(String stringValue)? mention,
    TResult Function(String stringValue)? poll,
    TResult Function(String stringValue)? move,
    TResult Function(String stringValue)? followRequest,
    TResult Function(String stringValue)? unknown,
    required TResult orElse(),
  }) {
    if (followRequest != null) {
      return followRequest(stringValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Follow value) follow,
    required TResult Function(_Favourite value) favourite,
    required TResult Function(_Reblog value) reblog,
    required TResult Function(_Mention value) mention,
    required TResult Function(_Poll value) poll,
    required TResult Function(_Move value) move,
    required TResult Function(_followRequest value) followRequest,
    required TResult Function(_Unknown value) unknown,
  }) {
    return followRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Follow value)? follow,
    TResult Function(_Favourite value)? favourite,
    TResult Function(_Reblog value)? reblog,
    TResult Function(_Mention value)? mention,
    TResult Function(_Poll value)? poll,
    TResult Function(_Move value)? move,
    TResult Function(_followRequest value)? followRequest,
    TResult Function(_Unknown value)? unknown,
  }) {
    return followRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Follow value)? follow,
    TResult Function(_Favourite value)? favourite,
    TResult Function(_Reblog value)? reblog,
    TResult Function(_Mention value)? mention,
    TResult Function(_Poll value)? poll,
    TResult Function(_Move value)? move,
    TResult Function(_followRequest value)? followRequest,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (followRequest != null) {
      return followRequest(this);
    }
    return orElse();
  }
}

abstract class _followRequest implements MastodonApiNotificationType {
  const factory _followRequest({String stringValue}) = _$_followRequest;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$followRequestCopyWith<_followRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UnknownCopyWith<$Res>
    implements $MastodonApiNotificationTypeCopyWith<$Res> {
  factory _$UnknownCopyWith(_Unknown value, $Res Function(_Unknown) then) =
      __$UnknownCopyWithImpl<$Res>;
  @override
  $Res call({String stringValue});
}

/// @nodoc
class __$UnknownCopyWithImpl<$Res>
    extends _$MastodonApiNotificationTypeCopyWithImpl<$Res>
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
    return 'MastodonApiNotificationType.unknown(stringValue: $stringValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Unknown &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  _$UnknownCopyWith<_Unknown> get copyWith =>
      __$UnknownCopyWithImpl<_Unknown>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stringValue) follow,
    required TResult Function(String stringValue) favourite,
    required TResult Function(String stringValue) reblog,
    required TResult Function(String stringValue) mention,
    required TResult Function(String stringValue) poll,
    required TResult Function(String stringValue) move,
    required TResult Function(String stringValue) followRequest,
    required TResult Function(String stringValue) unknown,
  }) {
    return unknown(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String stringValue)? follow,
    TResult Function(String stringValue)? favourite,
    TResult Function(String stringValue)? reblog,
    TResult Function(String stringValue)? mention,
    TResult Function(String stringValue)? poll,
    TResult Function(String stringValue)? move,
    TResult Function(String stringValue)? followRequest,
    TResult Function(String stringValue)? unknown,
  }) {
    return unknown?.call(stringValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stringValue)? follow,
    TResult Function(String stringValue)? favourite,
    TResult Function(String stringValue)? reblog,
    TResult Function(String stringValue)? mention,
    TResult Function(String stringValue)? poll,
    TResult Function(String stringValue)? move,
    TResult Function(String stringValue)? followRequest,
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
    required TResult Function(_Follow value) follow,
    required TResult Function(_Favourite value) favourite,
    required TResult Function(_Reblog value) reblog,
    required TResult Function(_Mention value) mention,
    required TResult Function(_Poll value) poll,
    required TResult Function(_Move value) move,
    required TResult Function(_followRequest value) followRequest,
    required TResult Function(_Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Follow value)? follow,
    TResult Function(_Favourite value)? favourite,
    TResult Function(_Reblog value)? reblog,
    TResult Function(_Mention value)? mention,
    TResult Function(_Poll value)? poll,
    TResult Function(_Move value)? move,
    TResult Function(_followRequest value)? followRequest,
    TResult Function(_Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Follow value)? follow,
    TResult Function(_Favourite value)? favourite,
    TResult Function(_Reblog value)? reblog,
    TResult Function(_Mention value)? mention,
    TResult Function(_Poll value)? poll,
    TResult Function(_Move value)? move,
    TResult Function(_followRequest value)? followRequest,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown implements MastodonApiNotificationType {
  const factory _Unknown({required String stringValue}) = _$_Unknown;

  @override
  String get stringValue;
  @override
  @JsonKey(ignore: true)
  _$UnknownCopyWith<_Unknown> get copyWith =>
      throw _privateConstructorUsedError;
}
