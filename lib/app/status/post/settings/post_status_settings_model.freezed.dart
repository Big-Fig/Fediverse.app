// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_status_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostStatusSettings _$PostStatusSettingsFromJson(Map<String, dynamic> json) {
  return _PostStatusSettings.fromJson(json);
}

/// @nodoc
class _$PostStatusSettingsTearOff {
  const _$PostStatusSettingsTearOff();

  _PostStatusSettings call(
      {@HiveField(0)
      @JsonKey(name: 'mark_media_as_nsfw_on_attach')
          required bool markMediaAsNsfwOnAttach,
      @HiveField(1)
      @JsonKey(name: 'default_visibility')
          required String defaultVisibilityString,
      @HiveField(2)
      @JsonKey(name: 'default_status_locale')
          required LocalizationLocale? defaultStatusLocale,
      @HiveField(3)
      @JsonKey(name: 'dont_upload_media_during_editing_on_attach')
          required bool dontUploadMediaDuringEditing}) {
    return _PostStatusSettings(
      markMediaAsNsfwOnAttach: markMediaAsNsfwOnAttach,
      defaultVisibilityString: defaultVisibilityString,
      defaultStatusLocale: defaultStatusLocale,
      dontUploadMediaDuringEditing: dontUploadMediaDuringEditing,
    );
  }

  PostStatusSettings fromJson(Map<String, Object> json) {
    return PostStatusSettings.fromJson(json);
  }
}

/// @nodoc
const $PostStatusSettings = _$PostStatusSettingsTearOff();

/// @nodoc
mixin _$PostStatusSettings {
  @HiveField(0)
  @JsonKey(name: 'mark_media_as_nsfw_on_attach')
  bool get markMediaAsNsfwOnAttach => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'default_visibility')
  String get defaultVisibilityString => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'default_status_locale')
  LocalizationLocale? get defaultStatusLocale =>
      throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'dont_upload_media_during_editing_on_attach')
  bool get dontUploadMediaDuringEditing => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostStatusSettingsCopyWith<PostStatusSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostStatusSettingsCopyWith<$Res> {
  factory $PostStatusSettingsCopyWith(
          PostStatusSettings value, $Res Function(PostStatusSettings) then) =
      _$PostStatusSettingsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'mark_media_as_nsfw_on_attach')
          bool markMediaAsNsfwOnAttach,
      @HiveField(1)
      @JsonKey(name: 'default_visibility')
          String defaultVisibilityString,
      @HiveField(2)
      @JsonKey(name: 'default_status_locale')
          LocalizationLocale? defaultStatusLocale,
      @HiveField(3)
      @JsonKey(name: 'dont_upload_media_during_editing_on_attach')
          bool dontUploadMediaDuringEditing});

  $LocalizationLocaleCopyWith<$Res>? get defaultStatusLocale;
}

/// @nodoc
class _$PostStatusSettingsCopyWithImpl<$Res>
    implements $PostStatusSettingsCopyWith<$Res> {
  _$PostStatusSettingsCopyWithImpl(this._value, this._then);

  final PostStatusSettings _value;
  // ignore: unused_field
  final $Res Function(PostStatusSettings) _then;

  @override
  $Res call({
    Object? markMediaAsNsfwOnAttach = freezed,
    Object? defaultVisibilityString = freezed,
    Object? defaultStatusLocale = freezed,
    Object? dontUploadMediaDuringEditing = freezed,
  }) {
    return _then(_value.copyWith(
      markMediaAsNsfwOnAttach: markMediaAsNsfwOnAttach == freezed
          ? _value.markMediaAsNsfwOnAttach
          : markMediaAsNsfwOnAttach // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultVisibilityString: defaultVisibilityString == freezed
          ? _value.defaultVisibilityString
          : defaultVisibilityString // ignore: cast_nullable_to_non_nullable
              as String,
      defaultStatusLocale: defaultStatusLocale == freezed
          ? _value.defaultStatusLocale
          : defaultStatusLocale // ignore: cast_nullable_to_non_nullable
              as LocalizationLocale?,
      dontUploadMediaDuringEditing: dontUploadMediaDuringEditing == freezed
          ? _value.dontUploadMediaDuringEditing
          : dontUploadMediaDuringEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $LocalizationLocaleCopyWith<$Res>? get defaultStatusLocale {
    if (_value.defaultStatusLocale == null) {
      return null;
    }

    return $LocalizationLocaleCopyWith<$Res>(_value.defaultStatusLocale!,
        (value) {
      return _then(_value.copyWith(defaultStatusLocale: value));
    });
  }
}

/// @nodoc
abstract class _$PostStatusSettingsCopyWith<$Res>
    implements $PostStatusSettingsCopyWith<$Res> {
  factory _$PostStatusSettingsCopyWith(
          _PostStatusSettings value, $Res Function(_PostStatusSettings) then) =
      __$PostStatusSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
      @JsonKey(name: 'mark_media_as_nsfw_on_attach')
          bool markMediaAsNsfwOnAttach,
      @HiveField(1)
      @JsonKey(name: 'default_visibility')
          String defaultVisibilityString,
      @HiveField(2)
      @JsonKey(name: 'default_status_locale')
          LocalizationLocale? defaultStatusLocale,
      @HiveField(3)
      @JsonKey(name: 'dont_upload_media_during_editing_on_attach')
          bool dontUploadMediaDuringEditing});

  @override
  $LocalizationLocaleCopyWith<$Res>? get defaultStatusLocale;
}

/// @nodoc
class __$PostStatusSettingsCopyWithImpl<$Res>
    extends _$PostStatusSettingsCopyWithImpl<$Res>
    implements _$PostStatusSettingsCopyWith<$Res> {
  __$PostStatusSettingsCopyWithImpl(
      _PostStatusSettings _value, $Res Function(_PostStatusSettings) _then)
      : super(_value, (v) => _then(v as _PostStatusSettings));

  @override
  _PostStatusSettings get _value => super._value as _PostStatusSettings;

  @override
  $Res call({
    Object? markMediaAsNsfwOnAttach = freezed,
    Object? defaultVisibilityString = freezed,
    Object? defaultStatusLocale = freezed,
    Object? dontUploadMediaDuringEditing = freezed,
  }) {
    return _then(_PostStatusSettings(
      markMediaAsNsfwOnAttach: markMediaAsNsfwOnAttach == freezed
          ? _value.markMediaAsNsfwOnAttach
          : markMediaAsNsfwOnAttach // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultVisibilityString: defaultVisibilityString == freezed
          ? _value.defaultVisibilityString
          : defaultVisibilityString // ignore: cast_nullable_to_non_nullable
              as String,
      defaultStatusLocale: defaultStatusLocale == freezed
          ? _value.defaultStatusLocale
          : defaultStatusLocale // ignore: cast_nullable_to_non_nullable
              as LocalizationLocale?,
      dontUploadMediaDuringEditing: dontUploadMediaDuringEditing == freezed
          ? _value.dontUploadMediaDuringEditing
          : dontUploadMediaDuringEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostStatusSettings extends _PostStatusSettings {
  const _$_PostStatusSettings(
      {@HiveField(0)
      @JsonKey(name: 'mark_media_as_nsfw_on_attach')
          required this.markMediaAsNsfwOnAttach,
      @HiveField(1)
      @JsonKey(name: 'default_visibility')
          required this.defaultVisibilityString,
      @HiveField(2)
      @JsonKey(name: 'default_status_locale')
          required this.defaultStatusLocale,
      @HiveField(3)
      @JsonKey(name: 'dont_upload_media_during_editing_on_attach')
          required this.dontUploadMediaDuringEditing})
      : super._();

  factory _$_PostStatusSettings.fromJson(Map<String, dynamic> json) =>
      _$$_PostStatusSettingsFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'mark_media_as_nsfw_on_attach')
  final bool markMediaAsNsfwOnAttach;
  @override
  @HiveField(1)
  @JsonKey(name: 'default_visibility')
  final String defaultVisibilityString;
  @override
  @HiveField(2)
  @JsonKey(name: 'default_status_locale')
  final LocalizationLocale? defaultStatusLocale;
  @override
  @HiveField(3)
  @JsonKey(name: 'dont_upload_media_during_editing_on_attach')
  final bool dontUploadMediaDuringEditing;

  @override
  String toString() {
    return 'PostStatusSettings(markMediaAsNsfwOnAttach: $markMediaAsNsfwOnAttach, defaultVisibilityString: $defaultVisibilityString, defaultStatusLocale: $defaultStatusLocale, dontUploadMediaDuringEditing: $dontUploadMediaDuringEditing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PostStatusSettings &&
            (identical(
                    other.markMediaAsNsfwOnAttach, markMediaAsNsfwOnAttach) ||
                const DeepCollectionEquality().equals(
                    other.markMediaAsNsfwOnAttach, markMediaAsNsfwOnAttach)) &&
            (identical(
                    other.defaultVisibilityString, defaultVisibilityString) ||
                const DeepCollectionEquality().equals(
                    other.defaultVisibilityString, defaultVisibilityString)) &&
            (identical(other.defaultStatusLocale, defaultStatusLocale) ||
                const DeepCollectionEquality()
                    .equals(other.defaultStatusLocale, defaultStatusLocale)) &&
            (identical(other.dontUploadMediaDuringEditing,
                    dontUploadMediaDuringEditing) ||
                const DeepCollectionEquality().equals(
                    other.dontUploadMediaDuringEditing,
                    dontUploadMediaDuringEditing)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(markMediaAsNsfwOnAttach) ^
      const DeepCollectionEquality().hash(defaultVisibilityString) ^
      const DeepCollectionEquality().hash(defaultStatusLocale) ^
      const DeepCollectionEquality().hash(dontUploadMediaDuringEditing);

  @JsonKey(ignore: true)
  @override
  _$PostStatusSettingsCopyWith<_PostStatusSettings> get copyWith =>
      __$PostStatusSettingsCopyWithImpl<_PostStatusSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostStatusSettingsToJson(this);
  }
}

abstract class _PostStatusSettings extends PostStatusSettings {
  const factory _PostStatusSettings(
      {@HiveField(0)
      @JsonKey(name: 'mark_media_as_nsfw_on_attach')
          required bool markMediaAsNsfwOnAttach,
      @HiveField(1)
      @JsonKey(name: 'default_visibility')
          required String defaultVisibilityString,
      @HiveField(2)
      @JsonKey(name: 'default_status_locale')
          required LocalizationLocale? defaultStatusLocale,
      @HiveField(3)
      @JsonKey(name: 'dont_upload_media_during_editing_on_attach')
          required bool dontUploadMediaDuringEditing}) = _$_PostStatusSettings;
  const _PostStatusSettings._() : super._();

  factory _PostStatusSettings.fromJson(Map<String, dynamic> json) =
      _$_PostStatusSettings.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'mark_media_as_nsfw_on_attach')
  bool get markMediaAsNsfwOnAttach => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'default_visibility')
  String get defaultVisibilityString => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  @JsonKey(name: 'default_status_locale')
  LocalizationLocale? get defaultStatusLocale =>
      throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  @JsonKey(name: 'dont_upload_media_during_editing_on_attach')
  bool get dontUploadMediaDuringEditing => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PostStatusSettingsCopyWith<_PostStatusSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
