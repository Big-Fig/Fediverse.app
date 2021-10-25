// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'push_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PushSettings _$PushSettingsFromJson(Map<String, dynamic> json) {
  return _PushSettings.fromJson(json);
}

/// @nodoc
class _$PushSettingsTearOff {
  const _$PushSettingsTearOff();

  _PushSettings call(
      {@HiveField(1) required bool? favourite,
      @HiveField(2) required bool? follow,
      @HiveField(3) required bool? mention,
      @HiveField(4) required bool? reblog,
      @HiveField(5) required bool? poll,
      @HiveField(6) required bool? chatMention,
      @HiveField(7) required bool? emojiReaction}) {
    return _PushSettings(
      favourite: favourite,
      follow: follow,
      mention: mention,
      reblog: reblog,
      poll: poll,
      chatMention: chatMention,
      emojiReaction: emojiReaction,
    );
  }

  PushSettings fromJson(Map<String, Object> json) {
    return PushSettings.fromJson(json);
  }
}

/// @nodoc
const $PushSettings = _$PushSettingsTearOff();

/// @nodoc
mixin _$PushSettings {
  @HiveField(1)
  bool? get favourite => throw _privateConstructorUsedError;
  @HiveField(2)
  bool? get follow => throw _privateConstructorUsedError;
  @HiveField(3)
  bool? get mention => throw _privateConstructorUsedError;
  @HiveField(4)
  bool? get reblog => throw _privateConstructorUsedError;
  @HiveField(5)
  bool? get poll => throw _privateConstructorUsedError;
  @HiveField(6)
  bool? get chatMention => throw _privateConstructorUsedError;
  @HiveField(7)
  bool? get emojiReaction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PushSettingsCopyWith<PushSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushSettingsCopyWith<$Res> {
  factory $PushSettingsCopyWith(
          PushSettings value, $Res Function(PushSettings) then) =
      _$PushSettingsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(1) bool? favourite,
      @HiveField(2) bool? follow,
      @HiveField(3) bool? mention,
      @HiveField(4) bool? reblog,
      @HiveField(5) bool? poll,
      @HiveField(6) bool? chatMention,
      @HiveField(7) bool? emojiReaction});
}

/// @nodoc
class _$PushSettingsCopyWithImpl<$Res> implements $PushSettingsCopyWith<$Res> {
  _$PushSettingsCopyWithImpl(this._value, this._then);

  final PushSettings _value;
  // ignore: unused_field
  final $Res Function(PushSettings) _then;

  @override
  $Res call({
    Object? favourite = freezed,
    Object? follow = freezed,
    Object? mention = freezed,
    Object? reblog = freezed,
    Object? poll = freezed,
    Object? chatMention = freezed,
    Object? emojiReaction = freezed,
  }) {
    return _then(_value.copyWith(
      favourite: favourite == freezed
          ? _value.favourite
          : favourite // ignore: cast_nullable_to_non_nullable
              as bool?,
      follow: follow == freezed
          ? _value.follow
          : follow // ignore: cast_nullable_to_non_nullable
              as bool?,
      mention: mention == freezed
          ? _value.mention
          : mention // ignore: cast_nullable_to_non_nullable
              as bool?,
      reblog: reblog == freezed
          ? _value.reblog
          : reblog // ignore: cast_nullable_to_non_nullable
              as bool?,
      poll: poll == freezed
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as bool?,
      chatMention: chatMention == freezed
          ? _value.chatMention
          : chatMention // ignore: cast_nullable_to_non_nullable
              as bool?,
      emojiReaction: emojiReaction == freezed
          ? _value.emojiReaction
          : emojiReaction // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$PushSettingsCopyWith<$Res>
    implements $PushSettingsCopyWith<$Res> {
  factory _$PushSettingsCopyWith(
          _PushSettings value, $Res Function(_PushSettings) then) =
      __$PushSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(1) bool? favourite,
      @HiveField(2) bool? follow,
      @HiveField(3) bool? mention,
      @HiveField(4) bool? reblog,
      @HiveField(5) bool? poll,
      @HiveField(6) bool? chatMention,
      @HiveField(7) bool? emojiReaction});
}

/// @nodoc
class __$PushSettingsCopyWithImpl<$Res> extends _$PushSettingsCopyWithImpl<$Res>
    implements _$PushSettingsCopyWith<$Res> {
  __$PushSettingsCopyWithImpl(
      _PushSettings _value, $Res Function(_PushSettings) _then)
      : super(_value, (v) => _then(v as _PushSettings));

  @override
  _PushSettings get _value => super._value as _PushSettings;

  @override
  $Res call({
    Object? favourite = freezed,
    Object? follow = freezed,
    Object? mention = freezed,
    Object? reblog = freezed,
    Object? poll = freezed,
    Object? chatMention = freezed,
    Object? emojiReaction = freezed,
  }) {
    return _then(_PushSettings(
      favourite: favourite == freezed
          ? _value.favourite
          : favourite // ignore: cast_nullable_to_non_nullable
              as bool?,
      follow: follow == freezed
          ? _value.follow
          : follow // ignore: cast_nullable_to_non_nullable
              as bool?,
      mention: mention == freezed
          ? _value.mention
          : mention // ignore: cast_nullable_to_non_nullable
              as bool?,
      reblog: reblog == freezed
          ? _value.reblog
          : reblog // ignore: cast_nullable_to_non_nullable
              as bool?,
      poll: poll == freezed
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as bool?,
      chatMention: chatMention == freezed
          ? _value.chatMention
          : chatMention // ignore: cast_nullable_to_non_nullable
              as bool?,
      emojiReaction: emojiReaction == freezed
          ? _value.emojiReaction
          : emojiReaction // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PushSettings extends _PushSettings {
  const _$_PushSettings(
      {@HiveField(1) required this.favourite,
      @HiveField(2) required this.follow,
      @HiveField(3) required this.mention,
      @HiveField(4) required this.reblog,
      @HiveField(5) required this.poll,
      @HiveField(6) required this.chatMention,
      @HiveField(7) required this.emojiReaction})
      : super._();

  factory _$_PushSettings.fromJson(Map<String, dynamic> json) =>
      _$$_PushSettingsFromJson(json);

  @override
  @HiveField(1)
  final bool? favourite;
  @override
  @HiveField(2)
  final bool? follow;
  @override
  @HiveField(3)
  final bool? mention;
  @override
  @HiveField(4)
  final bool? reblog;
  @override
  @HiveField(5)
  final bool? poll;
  @override
  @HiveField(6)
  final bool? chatMention;
  @override
  @HiveField(7)
  final bool? emojiReaction;

  @override
  String toString() {
    return 'PushSettings(favourite: $favourite, follow: $follow, mention: $mention, reblog: $reblog, poll: $poll, chatMention: $chatMention, emojiReaction: $emojiReaction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PushSettings &&
            (identical(other.favourite, favourite) ||
                const DeepCollectionEquality()
                    .equals(other.favourite, favourite)) &&
            (identical(other.follow, follow) ||
                const DeepCollectionEquality().equals(other.follow, follow)) &&
            (identical(other.mention, mention) ||
                const DeepCollectionEquality()
                    .equals(other.mention, mention)) &&
            (identical(other.reblog, reblog) ||
                const DeepCollectionEquality().equals(other.reblog, reblog)) &&
            (identical(other.poll, poll) ||
                const DeepCollectionEquality().equals(other.poll, poll)) &&
            (identical(other.chatMention, chatMention) ||
                const DeepCollectionEquality()
                    .equals(other.chatMention, chatMention)) &&
            (identical(other.emojiReaction, emojiReaction) ||
                const DeepCollectionEquality()
                    .equals(other.emojiReaction, emojiReaction)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(favourite) ^
      const DeepCollectionEquality().hash(follow) ^
      const DeepCollectionEquality().hash(mention) ^
      const DeepCollectionEquality().hash(reblog) ^
      const DeepCollectionEquality().hash(poll) ^
      const DeepCollectionEquality().hash(chatMention) ^
      const DeepCollectionEquality().hash(emojiReaction);

  @JsonKey(ignore: true)
  @override
  _$PushSettingsCopyWith<_PushSettings> get copyWith =>
      __$PushSettingsCopyWithImpl<_PushSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PushSettingsToJson(this);
  }
}

abstract class _PushSettings extends PushSettings {
  const factory _PushSettings(
      {@HiveField(1) required bool? favourite,
      @HiveField(2) required bool? follow,
      @HiveField(3) required bool? mention,
      @HiveField(4) required bool? reblog,
      @HiveField(5) required bool? poll,
      @HiveField(6) required bool? chatMention,
      @HiveField(7) required bool? emojiReaction}) = _$_PushSettings;
  const _PushSettings._() : super._();

  factory _PushSettings.fromJson(Map<String, dynamic> json) =
      _$_PushSettings.fromJson;

  @override
  @HiveField(1)
  bool? get favourite => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  bool? get follow => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  bool? get mention => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  bool? get reblog => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  bool? get poll => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  bool? get chatMention => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  bool? get emojiReaction => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PushSettingsCopyWith<_PushSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
