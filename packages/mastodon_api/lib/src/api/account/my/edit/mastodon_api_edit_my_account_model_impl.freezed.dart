// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_edit_my_account_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiEditMyAccount _$MastodonApiEditMyAccountFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiEditMyAccount.fromJson(json);
}

/// @nodoc
class _$MastodonApiEditMyAccountTearOff {
  const _$MastodonApiEditMyAccountTearOff();

  _MastodonApiEditMyAccount call(
      {@JsonKey(name: 'fields_attributes')
      @HiveField(1)
          required List<MastodonApiField>? fieldsAttributes,
      @HiveField(2)
          required bool? discoverable,
      @HiveField(3)
          required bool? bot,
      @JsonKey(name: 'display_name')
      @HiveField(4)
          required String? displayName,
      @HiveField(5)
          required String? note,
      @HiveField(6)
          required bool? locked,
      @HiveField(7)
          required String? privacy,
      @HiveField(8)
          required bool? sensitive,
      @HiveField(9)
          required String? language,
      @JsonKey(name: 'avatar_local_file_path')
      @HiveField(10)
          required String? avatarLocalFilePath,
      @JsonKey(name: 'delete_avatar')
      @HiveField(11)
          required bool? deleteAvatar,
      @JsonKey(name: 'header_local_file_path')
      @HiveField(12)
          required String? headerLocalFilePath,
      @JsonKey(name: 'delete_header')
      @HiveField(13)
          required bool? deleteHeader}) {
    return _MastodonApiEditMyAccount(
      fieldsAttributes: fieldsAttributes,
      discoverable: discoverable,
      bot: bot,
      displayName: displayName,
      note: note,
      locked: locked,
      privacy: privacy,
      sensitive: sensitive,
      language: language,
      avatarLocalFilePath: avatarLocalFilePath,
      deleteAvatar: deleteAvatar,
      headerLocalFilePath: headerLocalFilePath,
      deleteHeader: deleteHeader,
    );
  }

  MastodonApiEditMyAccount fromJson(Map<String, Object?> json) {
    return MastodonApiEditMyAccount.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiEditMyAccount = _$MastodonApiEditMyAccountTearOff();

/// @nodoc
mixin _$MastodonApiEditMyAccount {
  @JsonKey(name: 'fields_attributes')
  @HiveField(1)
  List<MastodonApiField>? get fieldsAttributes =>
      throw _privateConstructorUsedError;
  @HiveField(2)
  bool? get discoverable => throw _privateConstructorUsedError;
  @HiveField(3)
  bool? get bot => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name')
  @HiveField(4)
  String? get displayName => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get note => throw _privateConstructorUsedError;
  @HiveField(6)
  bool? get locked => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get privacy => throw _privateConstructorUsedError;
  @HiveField(8)
  bool? get sensitive => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_local_file_path')
  @HiveField(10)
  String? get avatarLocalFilePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'delete_avatar')
  @HiveField(11)
  bool? get deleteAvatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'header_local_file_path')
  @HiveField(12)
  String? get headerLocalFilePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'delete_header')
  @HiveField(13)
  bool? get deleteHeader => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiEditMyAccountCopyWith<MastodonApiEditMyAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiEditMyAccountCopyWith<$Res> {
  factory $MastodonApiEditMyAccountCopyWith(MastodonApiEditMyAccount value,
          $Res Function(MastodonApiEditMyAccount) then) =
      _$MastodonApiEditMyAccountCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'fields_attributes')
      @HiveField(1)
          List<MastodonApiField>? fieldsAttributes,
      @HiveField(2)
          bool? discoverable,
      @HiveField(3)
          bool? bot,
      @JsonKey(name: 'display_name')
      @HiveField(4)
          String? displayName,
      @HiveField(5)
          String? note,
      @HiveField(6)
          bool? locked,
      @HiveField(7)
          String? privacy,
      @HiveField(8)
          bool? sensitive,
      @HiveField(9)
          String? language,
      @JsonKey(name: 'avatar_local_file_path')
      @HiveField(10)
          String? avatarLocalFilePath,
      @JsonKey(name: 'delete_avatar')
      @HiveField(11)
          bool? deleteAvatar,
      @JsonKey(name: 'header_local_file_path')
      @HiveField(12)
          String? headerLocalFilePath,
      @JsonKey(name: 'delete_header')
      @HiveField(13)
          bool? deleteHeader});
}

/// @nodoc
class _$MastodonApiEditMyAccountCopyWithImpl<$Res>
    implements $MastodonApiEditMyAccountCopyWith<$Res> {
  _$MastodonApiEditMyAccountCopyWithImpl(this._value, this._then);

  final MastodonApiEditMyAccount _value;
  // ignore: unused_field
  final $Res Function(MastodonApiEditMyAccount) _then;

  @override
  $Res call({
    Object? fieldsAttributes = freezed,
    Object? discoverable = freezed,
    Object? bot = freezed,
    Object? displayName = freezed,
    Object? note = freezed,
    Object? locked = freezed,
    Object? privacy = freezed,
    Object? sensitive = freezed,
    Object? language = freezed,
    Object? avatarLocalFilePath = freezed,
    Object? deleteAvatar = freezed,
    Object? headerLocalFilePath = freezed,
    Object? deleteHeader = freezed,
  }) {
    return _then(_value.copyWith(
      fieldsAttributes: fieldsAttributes == freezed
          ? _value.fieldsAttributes
          : fieldsAttributes // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiField>?,
      discoverable: discoverable == freezed
          ? _value.discoverable
          : discoverable // ignore: cast_nullable_to_non_nullable
              as bool?,
      bot: bot == freezed
          ? _value.bot
          : bot // ignore: cast_nullable_to_non_nullable
              as bool?,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      locked: locked == freezed
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as bool?,
      privacy: privacy == freezed
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as String?,
      sensitive: sensitive == freezed
          ? _value.sensitive
          : sensitive // ignore: cast_nullable_to_non_nullable
              as bool?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarLocalFilePath: avatarLocalFilePath == freezed
          ? _value.avatarLocalFilePath
          : avatarLocalFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      deleteAvatar: deleteAvatar == freezed
          ? _value.deleteAvatar
          : deleteAvatar // ignore: cast_nullable_to_non_nullable
              as bool?,
      headerLocalFilePath: headerLocalFilePath == freezed
          ? _value.headerLocalFilePath
          : headerLocalFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      deleteHeader: deleteHeader == freezed
          ? _value.deleteHeader
          : deleteHeader // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiEditMyAccountCopyWith<$Res>
    implements $MastodonApiEditMyAccountCopyWith<$Res> {
  factory _$MastodonApiEditMyAccountCopyWith(_MastodonApiEditMyAccount value,
          $Res Function(_MastodonApiEditMyAccount) then) =
      __$MastodonApiEditMyAccountCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'fields_attributes')
      @HiveField(1)
          List<MastodonApiField>? fieldsAttributes,
      @HiveField(2)
          bool? discoverable,
      @HiveField(3)
          bool? bot,
      @JsonKey(name: 'display_name')
      @HiveField(4)
          String? displayName,
      @HiveField(5)
          String? note,
      @HiveField(6)
          bool? locked,
      @HiveField(7)
          String? privacy,
      @HiveField(8)
          bool? sensitive,
      @HiveField(9)
          String? language,
      @JsonKey(name: 'avatar_local_file_path')
      @HiveField(10)
          String? avatarLocalFilePath,
      @JsonKey(name: 'delete_avatar')
      @HiveField(11)
          bool? deleteAvatar,
      @JsonKey(name: 'header_local_file_path')
      @HiveField(12)
          String? headerLocalFilePath,
      @JsonKey(name: 'delete_header')
      @HiveField(13)
          bool? deleteHeader});
}

/// @nodoc
class __$MastodonApiEditMyAccountCopyWithImpl<$Res>
    extends _$MastodonApiEditMyAccountCopyWithImpl<$Res>
    implements _$MastodonApiEditMyAccountCopyWith<$Res> {
  __$MastodonApiEditMyAccountCopyWithImpl(_MastodonApiEditMyAccount _value,
      $Res Function(_MastodonApiEditMyAccount) _then)
      : super(_value, (v) => _then(v as _MastodonApiEditMyAccount));

  @override
  _MastodonApiEditMyAccount get _value =>
      super._value as _MastodonApiEditMyAccount;

  @override
  $Res call({
    Object? fieldsAttributes = freezed,
    Object? discoverable = freezed,
    Object? bot = freezed,
    Object? displayName = freezed,
    Object? note = freezed,
    Object? locked = freezed,
    Object? privacy = freezed,
    Object? sensitive = freezed,
    Object? language = freezed,
    Object? avatarLocalFilePath = freezed,
    Object? deleteAvatar = freezed,
    Object? headerLocalFilePath = freezed,
    Object? deleteHeader = freezed,
  }) {
    return _then(_MastodonApiEditMyAccount(
      fieldsAttributes: fieldsAttributes == freezed
          ? _value.fieldsAttributes
          : fieldsAttributes // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiField>?,
      discoverable: discoverable == freezed
          ? _value.discoverable
          : discoverable // ignore: cast_nullable_to_non_nullable
              as bool?,
      bot: bot == freezed
          ? _value.bot
          : bot // ignore: cast_nullable_to_non_nullable
              as bool?,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      locked: locked == freezed
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as bool?,
      privacy: privacy == freezed
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as String?,
      sensitive: sensitive == freezed
          ? _value.sensitive
          : sensitive // ignore: cast_nullable_to_non_nullable
              as bool?,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarLocalFilePath: avatarLocalFilePath == freezed
          ? _value.avatarLocalFilePath
          : avatarLocalFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      deleteAvatar: deleteAvatar == freezed
          ? _value.deleteAvatar
          : deleteAvatar // ignore: cast_nullable_to_non_nullable
              as bool?,
      headerLocalFilePath: headerLocalFilePath == freezed
          ? _value.headerLocalFilePath
          : headerLocalFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      deleteHeader: deleteHeader == freezed
          ? _value.deleteHeader
          : deleteHeader // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiEditMyAccount implements _MastodonApiEditMyAccount {
  const _$_MastodonApiEditMyAccount(
      {@JsonKey(name: 'fields_attributes')
      @HiveField(1)
          required this.fieldsAttributes,
      @HiveField(2)
          required this.discoverable,
      @HiveField(3)
          required this.bot,
      @JsonKey(name: 'display_name')
      @HiveField(4)
          required this.displayName,
      @HiveField(5)
          required this.note,
      @HiveField(6)
          required this.locked,
      @HiveField(7)
          required this.privacy,
      @HiveField(8)
          required this.sensitive,
      @HiveField(9)
          required this.language,
      @JsonKey(name: 'avatar_local_file_path')
      @HiveField(10)
          required this.avatarLocalFilePath,
      @JsonKey(name: 'delete_avatar')
      @HiveField(11)
          required this.deleteAvatar,
      @JsonKey(name: 'header_local_file_path')
      @HiveField(12)
          required this.headerLocalFilePath,
      @JsonKey(name: 'delete_header')
      @HiveField(13)
          required this.deleteHeader});

  factory _$_MastodonApiEditMyAccount.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiEditMyAccountFromJson(json);

  @override
  @JsonKey(name: 'fields_attributes')
  @HiveField(1)
  final List<MastodonApiField>? fieldsAttributes;
  @override
  @HiveField(2)
  final bool? discoverable;
  @override
  @HiveField(3)
  final bool? bot;
  @override
  @JsonKey(name: 'display_name')
  @HiveField(4)
  final String? displayName;
  @override
  @HiveField(5)
  final String? note;
  @override
  @HiveField(6)
  final bool? locked;
  @override
  @HiveField(7)
  final String? privacy;
  @override
  @HiveField(8)
  final bool? sensitive;
  @override
  @HiveField(9)
  final String? language;
  @override
  @JsonKey(name: 'avatar_local_file_path')
  @HiveField(10)
  final String? avatarLocalFilePath;
  @override
  @JsonKey(name: 'delete_avatar')
  @HiveField(11)
  final bool? deleteAvatar;
  @override
  @JsonKey(name: 'header_local_file_path')
  @HiveField(12)
  final String? headerLocalFilePath;
  @override
  @JsonKey(name: 'delete_header')
  @HiveField(13)
  final bool? deleteHeader;

  @override
  String toString() {
    return 'MastodonApiEditMyAccount(fieldsAttributes: $fieldsAttributes, discoverable: $discoverable, bot: $bot, displayName: $displayName, note: $note, locked: $locked, privacy: $privacy, sensitive: $sensitive, language: $language, avatarLocalFilePath: $avatarLocalFilePath, deleteAvatar: $deleteAvatar, headerLocalFilePath: $headerLocalFilePath, deleteHeader: $deleteHeader)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiEditMyAccount &&
            const DeepCollectionEquality()
                .equals(other.fieldsAttributes, fieldsAttributes) &&
            (identical(other.discoverable, discoverable) ||
                other.discoverable == discoverable) &&
            (identical(other.bot, bot) || other.bot == bot) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.locked, locked) || other.locked == locked) &&
            (identical(other.privacy, privacy) || other.privacy == privacy) &&
            (identical(other.sensitive, sensitive) ||
                other.sensitive == sensitive) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.avatarLocalFilePath, avatarLocalFilePath) ||
                other.avatarLocalFilePath == avatarLocalFilePath) &&
            (identical(other.deleteAvatar, deleteAvatar) ||
                other.deleteAvatar == deleteAvatar) &&
            (identical(other.headerLocalFilePath, headerLocalFilePath) ||
                other.headerLocalFilePath == headerLocalFilePath) &&
            (identical(other.deleteHeader, deleteHeader) ||
                other.deleteHeader == deleteHeader));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(fieldsAttributes),
      discoverable,
      bot,
      displayName,
      note,
      locked,
      privacy,
      sensitive,
      language,
      avatarLocalFilePath,
      deleteAvatar,
      headerLocalFilePath,
      deleteHeader);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiEditMyAccountCopyWith<_MastodonApiEditMyAccount> get copyWith =>
      __$MastodonApiEditMyAccountCopyWithImpl<_MastodonApiEditMyAccount>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiEditMyAccountToJson(this);
  }
}

abstract class _MastodonApiEditMyAccount implements MastodonApiEditMyAccount {
  const factory _MastodonApiEditMyAccount(
      {@JsonKey(name: 'fields_attributes')
      @HiveField(1)
          required List<MastodonApiField>? fieldsAttributes,
      @HiveField(2)
          required bool? discoverable,
      @HiveField(3)
          required bool? bot,
      @JsonKey(name: 'display_name')
      @HiveField(4)
          required String? displayName,
      @HiveField(5)
          required String? note,
      @HiveField(6)
          required bool? locked,
      @HiveField(7)
          required String? privacy,
      @HiveField(8)
          required bool? sensitive,
      @HiveField(9)
          required String? language,
      @JsonKey(name: 'avatar_local_file_path')
      @HiveField(10)
          required String? avatarLocalFilePath,
      @JsonKey(name: 'delete_avatar')
      @HiveField(11)
          required bool? deleteAvatar,
      @JsonKey(name: 'header_local_file_path')
      @HiveField(12)
          required String? headerLocalFilePath,
      @JsonKey(name: 'delete_header')
      @HiveField(13)
          required bool? deleteHeader}) = _$_MastodonApiEditMyAccount;

  factory _MastodonApiEditMyAccount.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiEditMyAccount.fromJson;

  @override
  @JsonKey(name: 'fields_attributes')
  @HiveField(1)
  List<MastodonApiField>? get fieldsAttributes;
  @override
  @HiveField(2)
  bool? get discoverable;
  @override
  @HiveField(3)
  bool? get bot;
  @override
  @JsonKey(name: 'display_name')
  @HiveField(4)
  String? get displayName;
  @override
  @HiveField(5)
  String? get note;
  @override
  @HiveField(6)
  bool? get locked;
  @override
  @HiveField(7)
  String? get privacy;
  @override
  @HiveField(8)
  bool? get sensitive;
  @override
  @HiveField(9)
  String? get language;
  @override
  @JsonKey(name: 'avatar_local_file_path')
  @HiveField(10)
  String? get avatarLocalFilePath;
  @override
  @JsonKey(name: 'delete_avatar')
  @HiveField(11)
  bool? get deleteAvatar;
  @override
  @JsonKey(name: 'header_local_file_path')
  @HiveField(12)
  String? get headerLocalFilePath;
  @override
  @JsonKey(name: 'delete_header')
  @HiveField(13)
  bool? get deleteHeader;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiEditMyAccountCopyWith<_MastodonApiEditMyAccount> get copyWith =>
      throw _privateConstructorUsedError;
}
