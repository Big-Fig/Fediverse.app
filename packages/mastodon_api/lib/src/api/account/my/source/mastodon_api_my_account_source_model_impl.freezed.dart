// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_my_account_source_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiMyAccountSource _$MastodonApiMyAccountSourceFromJson(
    Map<String, dynamic> json) {
  return _mastodonApiMyAccountSource.fromJson(json);
}

/// @nodoc
class _$MastodonApiMyAccountSourceTearOff {
  const _$MastodonApiMyAccountSourceTearOff();

  _mastodonApiMyAccountSource call(
      {@HiveField(1)
          required String? privacy,
      @HiveField(2)
          required bool? sensitive,
      @HiveField(3)
          required String? language,
      @HiveField(4)
          required String? note,
      @HiveField(5)
          required List<MastodonApiField>? fields,
      @HiveField(6)
      @JsonKey(name: 'follow_requests_count')
          required int? followRequestsCount}) {
    return _mastodonApiMyAccountSource(
      privacy: privacy,
      sensitive: sensitive,
      language: language,
      note: note,
      fields: fields,
      followRequestsCount: followRequestsCount,
    );
  }

  MastodonApiMyAccountSource fromJson(Map<String, Object?> json) {
    return MastodonApiMyAccountSource.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiMyAccountSource = _$MastodonApiMyAccountSourceTearOff();

/// @nodoc
mixin _$MastodonApiMyAccountSource {
  @HiveField(1)
  String? get privacy => throw _privateConstructorUsedError;
  @HiveField(2)
  bool? get sensitive => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get language => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get note => throw _privateConstructorUsedError;
  @HiveField(5)
  List<MastodonApiField>? get fields => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'follow_requests_count')
  int? get followRequestsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiMyAccountSourceCopyWith<MastodonApiMyAccountSource>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiMyAccountSourceCopyWith<$Res> {
  factory $MastodonApiMyAccountSourceCopyWith(MastodonApiMyAccountSource value,
          $Res Function(MastodonApiMyAccountSource) then) =
      _$MastodonApiMyAccountSourceCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(1)
          String? privacy,
      @HiveField(2)
          bool? sensitive,
      @HiveField(3)
          String? language,
      @HiveField(4)
          String? note,
      @HiveField(5)
          List<MastodonApiField>? fields,
      @HiveField(6)
      @JsonKey(name: 'follow_requests_count')
          int? followRequestsCount});
}

/// @nodoc
class _$MastodonApiMyAccountSourceCopyWithImpl<$Res>
    implements $MastodonApiMyAccountSourceCopyWith<$Res> {
  _$MastodonApiMyAccountSourceCopyWithImpl(this._value, this._then);

  final MastodonApiMyAccountSource _value;
  // ignore: unused_field
  final $Res Function(MastodonApiMyAccountSource) _then;

  @override
  $Res call({
    Object? privacy = freezed,
    Object? sensitive = freezed,
    Object? language = freezed,
    Object? note = freezed,
    Object? fields = freezed,
    Object? followRequestsCount = freezed,
  }) {
    return _then(_value.copyWith(
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
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      fields: fields == freezed
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiField>?,
      followRequestsCount: followRequestsCount == freezed
          ? _value.followRequestsCount
          : followRequestsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$mastodonApiMyAccountSourceCopyWith<$Res>
    implements $MastodonApiMyAccountSourceCopyWith<$Res> {
  factory _$mastodonApiMyAccountSourceCopyWith(
          _mastodonApiMyAccountSource value,
          $Res Function(_mastodonApiMyAccountSource) then) =
      __$mastodonApiMyAccountSourceCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(1)
          String? privacy,
      @HiveField(2)
          bool? sensitive,
      @HiveField(3)
          String? language,
      @HiveField(4)
          String? note,
      @HiveField(5)
          List<MastodonApiField>? fields,
      @HiveField(6)
      @JsonKey(name: 'follow_requests_count')
          int? followRequestsCount});
}

/// @nodoc
class __$mastodonApiMyAccountSourceCopyWithImpl<$Res>
    extends _$MastodonApiMyAccountSourceCopyWithImpl<$Res>
    implements _$mastodonApiMyAccountSourceCopyWith<$Res> {
  __$mastodonApiMyAccountSourceCopyWithImpl(_mastodonApiMyAccountSource _value,
      $Res Function(_mastodonApiMyAccountSource) _then)
      : super(_value, (v) => _then(v as _mastodonApiMyAccountSource));

  @override
  _mastodonApiMyAccountSource get _value =>
      super._value as _mastodonApiMyAccountSource;

  @override
  $Res call({
    Object? privacy = freezed,
    Object? sensitive = freezed,
    Object? language = freezed,
    Object? note = freezed,
    Object? fields = freezed,
    Object? followRequestsCount = freezed,
  }) {
    return _then(_mastodonApiMyAccountSource(
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
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      fields: fields == freezed
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<MastodonApiField>?,
      followRequestsCount: followRequestsCount == freezed
          ? _value.followRequestsCount
          : followRequestsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_mastodonApiMyAccountSource implements _mastodonApiMyAccountSource {
  const _$_mastodonApiMyAccountSource(
      {@HiveField(1)
          required this.privacy,
      @HiveField(2)
          required this.sensitive,
      @HiveField(3)
          required this.language,
      @HiveField(4)
          required this.note,
      @HiveField(5)
          required this.fields,
      @HiveField(6)
      @JsonKey(name: 'follow_requests_count')
          required this.followRequestsCount});

  factory _$_mastodonApiMyAccountSource.fromJson(Map<String, dynamic> json) =>
      _$$_mastodonApiMyAccountSourceFromJson(json);

  @override
  @HiveField(1)
  final String? privacy;
  @override
  @HiveField(2)
  final bool? sensitive;
  @override
  @HiveField(3)
  final String? language;
  @override
  @HiveField(4)
  final String? note;
  @override
  @HiveField(5)
  final List<MastodonApiField>? fields;
  @override
  @HiveField(6)
  @JsonKey(name: 'follow_requests_count')
  final int? followRequestsCount;

  @override
  String toString() {
    return 'MastodonApiMyAccountSource(privacy: $privacy, sensitive: $sensitive, language: $language, note: $note, fields: $fields, followRequestsCount: $followRequestsCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _mastodonApiMyAccountSource &&
            (identical(other.privacy, privacy) || other.privacy == privacy) &&
            (identical(other.sensitive, sensitive) ||
                other.sensitive == sensitive) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.note, note) || other.note == note) &&
            const DeepCollectionEquality().equals(other.fields, fields) &&
            (identical(other.followRequestsCount, followRequestsCount) ||
                other.followRequestsCount == followRequestsCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, privacy, sensitive, language,
      note, const DeepCollectionEquality().hash(fields), followRequestsCount);

  @JsonKey(ignore: true)
  @override
  _$mastodonApiMyAccountSourceCopyWith<_mastodonApiMyAccountSource>
      get copyWith => __$mastodonApiMyAccountSourceCopyWithImpl<
          _mastodonApiMyAccountSource>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_mastodonApiMyAccountSourceToJson(this);
  }
}

abstract class _mastodonApiMyAccountSource
    implements MastodonApiMyAccountSource {
  const factory _mastodonApiMyAccountSource(
      {@HiveField(1)
          required String? privacy,
      @HiveField(2)
          required bool? sensitive,
      @HiveField(3)
          required String? language,
      @HiveField(4)
          required String? note,
      @HiveField(5)
          required List<MastodonApiField>? fields,
      @HiveField(6)
      @JsonKey(name: 'follow_requests_count')
          required int? followRequestsCount}) = _$_mastodonApiMyAccountSource;

  factory _mastodonApiMyAccountSource.fromJson(Map<String, dynamic> json) =
      _$_mastodonApiMyAccountSource.fromJson;

  @override
  @HiveField(1)
  String? get privacy;
  @override
  @HiveField(2)
  bool? get sensitive;
  @override
  @HiveField(3)
  String? get language;
  @override
  @HiveField(4)
  String? get note;
  @override
  @HiveField(5)
  List<MastodonApiField>? get fields;
  @override
  @HiveField(6)
  @JsonKey(name: 'follow_requests_count')
  int? get followRequestsCount;
  @override
  @JsonKey(ignore: true)
  _$mastodonApiMyAccountSourceCopyWith<_mastodonApiMyAccountSource>
      get copyWith => throw _privateConstructorUsedError;
}
