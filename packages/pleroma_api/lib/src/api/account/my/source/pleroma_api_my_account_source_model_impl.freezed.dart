// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_my_account_source_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiMyAccountSource _$PleromaApiMyAccountSourceFromJson(
    Map<String, dynamic> json) {
  return _PleromaApiMyAccountSource.fromJson(json);
}

/// @nodoc
class _$PleromaApiMyAccountSourceTearOff {
  const _$PleromaApiMyAccountSourceTearOff();

  _PleromaApiMyAccountSource call(
      {@HiveField(1)
          required String? privacy,
      @HiveField(2)
          required bool? sensitive,
      @HiveField(3)
          required String? language,
      @HiveField(4)
          required String? note,
      @HiveField(5)
          required List<PleromaApiField>? fields,
      @HiveField(6)
      @JsonKey(name: 'follow_requests_count')
          required int? followRequestsCount,
      @HiveField(7)
          required PleromaApiMyAccountSourcePleromaPart? pleroma}) {
    return _PleromaApiMyAccountSource(
      privacy: privacy,
      sensitive: sensitive,
      language: language,
      note: note,
      fields: fields,
      followRequestsCount: followRequestsCount,
      pleroma: pleroma,
    );
  }

  PleromaApiMyAccountSource fromJson(Map<String, Object?> json) {
    return PleromaApiMyAccountSource.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiMyAccountSource = _$PleromaApiMyAccountSourceTearOff();

/// @nodoc
mixin _$PleromaApiMyAccountSource {
  @HiveField(1)
  String? get privacy => throw _privateConstructorUsedError;
  @HiveField(2)
  bool? get sensitive => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get language => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get note => throw _privateConstructorUsedError;
  @HiveField(5)
  List<PleromaApiField>? get fields => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'follow_requests_count')
  int? get followRequestsCount => throw _privateConstructorUsedError;
  @HiveField(7)
  PleromaApiMyAccountSourcePleromaPart? get pleroma =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiMyAccountSourceCopyWith<PleromaApiMyAccountSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiMyAccountSourceCopyWith<$Res> {
  factory $PleromaApiMyAccountSourceCopyWith(PleromaApiMyAccountSource value,
          $Res Function(PleromaApiMyAccountSource) then) =
      _$PleromaApiMyAccountSourceCopyWithImpl<$Res>;
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
          List<PleromaApiField>? fields,
      @HiveField(6)
      @JsonKey(name: 'follow_requests_count')
          int? followRequestsCount,
      @HiveField(7)
          PleromaApiMyAccountSourcePleromaPart? pleroma});

  $PleromaApiMyAccountSourcePleromaPartCopyWith<$Res>? get pleroma;
}

/// @nodoc
class _$PleromaApiMyAccountSourceCopyWithImpl<$Res>
    implements $PleromaApiMyAccountSourceCopyWith<$Res> {
  _$PleromaApiMyAccountSourceCopyWithImpl(this._value, this._then);

  final PleromaApiMyAccountSource _value;
  // ignore: unused_field
  final $Res Function(PleromaApiMyAccountSource) _then;

  @override
  $Res call({
    Object? privacy = freezed,
    Object? sensitive = freezed,
    Object? language = freezed,
    Object? note = freezed,
    Object? fields = freezed,
    Object? followRequestsCount = freezed,
    Object? pleroma = freezed,
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
              as List<PleromaApiField>?,
      followRequestsCount: followRequestsCount == freezed
          ? _value.followRequestsCount
          : followRequestsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      pleroma: pleroma == freezed
          ? _value.pleroma
          : pleroma // ignore: cast_nullable_to_non_nullable
              as PleromaApiMyAccountSourcePleromaPart?,
    ));
  }

  @override
  $PleromaApiMyAccountSourcePleromaPartCopyWith<$Res>? get pleroma {
    if (_value.pleroma == null) {
      return null;
    }

    return $PleromaApiMyAccountSourcePleromaPartCopyWith<$Res>(_value.pleroma!,
        (value) {
      return _then(_value.copyWith(pleroma: value));
    });
  }
}

/// @nodoc
abstract class _$PleromaApiMyAccountSourceCopyWith<$Res>
    implements $PleromaApiMyAccountSourceCopyWith<$Res> {
  factory _$PleromaApiMyAccountSourceCopyWith(_PleromaApiMyAccountSource value,
          $Res Function(_PleromaApiMyAccountSource) then) =
      __$PleromaApiMyAccountSourceCopyWithImpl<$Res>;
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
          List<PleromaApiField>? fields,
      @HiveField(6)
      @JsonKey(name: 'follow_requests_count')
          int? followRequestsCount,
      @HiveField(7)
          PleromaApiMyAccountSourcePleromaPart? pleroma});

  @override
  $PleromaApiMyAccountSourcePleromaPartCopyWith<$Res>? get pleroma;
}

/// @nodoc
class __$PleromaApiMyAccountSourceCopyWithImpl<$Res>
    extends _$PleromaApiMyAccountSourceCopyWithImpl<$Res>
    implements _$PleromaApiMyAccountSourceCopyWith<$Res> {
  __$PleromaApiMyAccountSourceCopyWithImpl(_PleromaApiMyAccountSource _value,
      $Res Function(_PleromaApiMyAccountSource) _then)
      : super(_value, (v) => _then(v as _PleromaApiMyAccountSource));

  @override
  _PleromaApiMyAccountSource get _value =>
      super._value as _PleromaApiMyAccountSource;

  @override
  $Res call({
    Object? privacy = freezed,
    Object? sensitive = freezed,
    Object? language = freezed,
    Object? note = freezed,
    Object? fields = freezed,
    Object? followRequestsCount = freezed,
    Object? pleroma = freezed,
  }) {
    return _then(_PleromaApiMyAccountSource(
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
              as List<PleromaApiField>?,
      followRequestsCount: followRequestsCount == freezed
          ? _value.followRequestsCount
          : followRequestsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      pleroma: pleroma == freezed
          ? _value.pleroma
          : pleroma // ignore: cast_nullable_to_non_nullable
              as PleromaApiMyAccountSourcePleromaPart?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiMyAccountSource implements _PleromaApiMyAccountSource {
  const _$_PleromaApiMyAccountSource(
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
          required this.followRequestsCount,
      @HiveField(7)
          required this.pleroma});

  factory _$_PleromaApiMyAccountSource.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiMyAccountSourceFromJson(json);

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
  final List<PleromaApiField>? fields;
  @override
  @HiveField(6)
  @JsonKey(name: 'follow_requests_count')
  final int? followRequestsCount;
  @override
  @HiveField(7)
  final PleromaApiMyAccountSourcePleromaPart? pleroma;

  @override
  String toString() {
    return 'PleromaApiMyAccountSource(privacy: $privacy, sensitive: $sensitive, language: $language, note: $note, fields: $fields, followRequestsCount: $followRequestsCount, pleroma: $pleroma)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiMyAccountSource &&
            (identical(other.privacy, privacy) || other.privacy == privacy) &&
            (identical(other.sensitive, sensitive) ||
                other.sensitive == sensitive) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.note, note) || other.note == note) &&
            const DeepCollectionEquality().equals(other.fields, fields) &&
            (identical(other.followRequestsCount, followRequestsCount) ||
                other.followRequestsCount == followRequestsCount) &&
            (identical(other.pleroma, pleroma) || other.pleroma == pleroma));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      privacy,
      sensitive,
      language,
      note,
      const DeepCollectionEquality().hash(fields),
      followRequestsCount,
      pleroma);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiMyAccountSourceCopyWith<_PleromaApiMyAccountSource>
      get copyWith =>
          __$PleromaApiMyAccountSourceCopyWithImpl<_PleromaApiMyAccountSource>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiMyAccountSourceToJson(this);
  }
}

abstract class _PleromaApiMyAccountSource implements PleromaApiMyAccountSource {
  const factory _PleromaApiMyAccountSource(
          {@HiveField(1)
              required String? privacy,
          @HiveField(2)
              required bool? sensitive,
          @HiveField(3)
              required String? language,
          @HiveField(4)
              required String? note,
          @HiveField(5)
              required List<PleromaApiField>? fields,
          @HiveField(6)
          @JsonKey(name: 'follow_requests_count')
              required int? followRequestsCount,
          @HiveField(7)
              required PleromaApiMyAccountSourcePleromaPart? pleroma}) =
      _$_PleromaApiMyAccountSource;

  factory _PleromaApiMyAccountSource.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiMyAccountSource.fromJson;

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
  List<PleromaApiField>? get fields;
  @override
  @HiveField(6)
  @JsonKey(name: 'follow_requests_count')
  int? get followRequestsCount;
  @override
  @HiveField(7)
  PleromaApiMyAccountSourcePleromaPart? get pleroma;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiMyAccountSourceCopyWith<_PleromaApiMyAccountSource>
      get copyWith => throw _privateConstructorUsedError;
}

PleromaApiMyAccountSourcePleromaPart
    _$PleromaApiMyAccountSourcePleromaPartFromJson(Map<String, dynamic> json) {
  return _PleromaApiMyAccountSourcePleromaPart.fromJson(json);
}

/// @nodoc
class _$PleromaApiMyAccountSourcePleromaPartTearOff {
  const _$PleromaApiMyAccountSourcePleromaPartTearOff();

  _PleromaApiMyAccountSourcePleromaPart call(
      {@HiveField(1) @JsonKey(name: 'show_role') required bool? showRole,
      @HiveField(2) @JsonKey(name: 'no_rich_text') required bool? noRichText,
      @HiveField(3) required bool? discoverable,
      @HiveField(4) @JsonKey(name: 'actor_type') required String? actorType}) {
    return _PleromaApiMyAccountSourcePleromaPart(
      showRole: showRole,
      noRichText: noRichText,
      discoverable: discoverable,
      actorType: actorType,
    );
  }

  PleromaApiMyAccountSourcePleromaPart fromJson(Map<String, Object?> json) {
    return PleromaApiMyAccountSourcePleromaPart.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiMyAccountSourcePleromaPart =
    _$PleromaApiMyAccountSourcePleromaPartTearOff();

/// @nodoc
mixin _$PleromaApiMyAccountSourcePleromaPart {
  @HiveField(1)
  @JsonKey(name: 'show_role')
  bool? get showRole => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'no_rich_text')
  bool? get noRichText => throw _privateConstructorUsedError;
  @HiveField(3)
  bool? get discoverable => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'actor_type')
  String? get actorType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiMyAccountSourcePleromaPartCopyWith<
          PleromaApiMyAccountSourcePleromaPart>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiMyAccountSourcePleromaPartCopyWith<$Res> {
  factory $PleromaApiMyAccountSourcePleromaPartCopyWith(
          PleromaApiMyAccountSourcePleromaPart value,
          $Res Function(PleromaApiMyAccountSourcePleromaPart) then) =
      _$PleromaApiMyAccountSourcePleromaPartCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(1) @JsonKey(name: 'show_role') bool? showRole,
      @HiveField(2) @JsonKey(name: 'no_rich_text') bool? noRichText,
      @HiveField(3) bool? discoverable,
      @HiveField(4) @JsonKey(name: 'actor_type') String? actorType});
}

/// @nodoc
class _$PleromaApiMyAccountSourcePleromaPartCopyWithImpl<$Res>
    implements $PleromaApiMyAccountSourcePleromaPartCopyWith<$Res> {
  _$PleromaApiMyAccountSourcePleromaPartCopyWithImpl(this._value, this._then);

  final PleromaApiMyAccountSourcePleromaPart _value;
  // ignore: unused_field
  final $Res Function(PleromaApiMyAccountSourcePleromaPart) _then;

  @override
  $Res call({
    Object? showRole = freezed,
    Object? noRichText = freezed,
    Object? discoverable = freezed,
    Object? actorType = freezed,
  }) {
    return _then(_value.copyWith(
      showRole: showRole == freezed
          ? _value.showRole
          : showRole // ignore: cast_nullable_to_non_nullable
              as bool?,
      noRichText: noRichText == freezed
          ? _value.noRichText
          : noRichText // ignore: cast_nullable_to_non_nullable
              as bool?,
      discoverable: discoverable == freezed
          ? _value.discoverable
          : discoverable // ignore: cast_nullable_to_non_nullable
              as bool?,
      actorType: actorType == freezed
          ? _value.actorType
          : actorType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiMyAccountSourcePleromaPartCopyWith<$Res>
    implements $PleromaApiMyAccountSourcePleromaPartCopyWith<$Res> {
  factory _$PleromaApiMyAccountSourcePleromaPartCopyWith(
          _PleromaApiMyAccountSourcePleromaPart value,
          $Res Function(_PleromaApiMyAccountSourcePleromaPart) then) =
      __$PleromaApiMyAccountSourcePleromaPartCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(1) @JsonKey(name: 'show_role') bool? showRole,
      @HiveField(2) @JsonKey(name: 'no_rich_text') bool? noRichText,
      @HiveField(3) bool? discoverable,
      @HiveField(4) @JsonKey(name: 'actor_type') String? actorType});
}

/// @nodoc
class __$PleromaApiMyAccountSourcePleromaPartCopyWithImpl<$Res>
    extends _$PleromaApiMyAccountSourcePleromaPartCopyWithImpl<$Res>
    implements _$PleromaApiMyAccountSourcePleromaPartCopyWith<$Res> {
  __$PleromaApiMyAccountSourcePleromaPartCopyWithImpl(
      _PleromaApiMyAccountSourcePleromaPart _value,
      $Res Function(_PleromaApiMyAccountSourcePleromaPart) _then)
      : super(_value, (v) => _then(v as _PleromaApiMyAccountSourcePleromaPart));

  @override
  _PleromaApiMyAccountSourcePleromaPart get _value =>
      super._value as _PleromaApiMyAccountSourcePleromaPart;

  @override
  $Res call({
    Object? showRole = freezed,
    Object? noRichText = freezed,
    Object? discoverable = freezed,
    Object? actorType = freezed,
  }) {
    return _then(_PleromaApiMyAccountSourcePleromaPart(
      showRole: showRole == freezed
          ? _value.showRole
          : showRole // ignore: cast_nullable_to_non_nullable
              as bool?,
      noRichText: noRichText == freezed
          ? _value.noRichText
          : noRichText // ignore: cast_nullable_to_non_nullable
              as bool?,
      discoverable: discoverable == freezed
          ? _value.discoverable
          : discoverable // ignore: cast_nullable_to_non_nullable
              as bool?,
      actorType: actorType == freezed
          ? _value.actorType
          : actorType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiMyAccountSourcePleromaPart
    implements _PleromaApiMyAccountSourcePleromaPart {
  const _$_PleromaApiMyAccountSourcePleromaPart(
      {@HiveField(1) @JsonKey(name: 'show_role') required this.showRole,
      @HiveField(2) @JsonKey(name: 'no_rich_text') required this.noRichText,
      @HiveField(3) required this.discoverable,
      @HiveField(4) @JsonKey(name: 'actor_type') required this.actorType});

  factory _$_PleromaApiMyAccountSourcePleromaPart.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiMyAccountSourcePleromaPartFromJson(json);

  @override
  @HiveField(1)
  @JsonKey(name: 'show_role')
  final bool? showRole;
  @override
  @HiveField(2)
  @JsonKey(name: 'no_rich_text')
  final bool? noRichText;
  @override
  @HiveField(3)
  final bool? discoverable;
  @override
  @HiveField(4)
  @JsonKey(name: 'actor_type')
  final String? actorType;

  @override
  String toString() {
    return 'PleromaApiMyAccountSourcePleromaPart(showRole: $showRole, noRichText: $noRichText, discoverable: $discoverable, actorType: $actorType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiMyAccountSourcePleromaPart &&
            (identical(other.showRole, showRole) ||
                other.showRole == showRole) &&
            (identical(other.noRichText, noRichText) ||
                other.noRichText == noRichText) &&
            (identical(other.discoverable, discoverable) ||
                other.discoverable == discoverable) &&
            (identical(other.actorType, actorType) ||
                other.actorType == actorType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, showRole, noRichText, discoverable, actorType);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiMyAccountSourcePleromaPartCopyWith<
          _PleromaApiMyAccountSourcePleromaPart>
      get copyWith => __$PleromaApiMyAccountSourcePleromaPartCopyWithImpl<
          _PleromaApiMyAccountSourcePleromaPart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiMyAccountSourcePleromaPartToJson(this);
  }
}

abstract class _PleromaApiMyAccountSourcePleromaPart
    implements PleromaApiMyAccountSourcePleromaPart {
  const factory _PleromaApiMyAccountSourcePleromaPart(
          {@HiveField(1)
          @JsonKey(name: 'show_role')
              required bool? showRole,
          @HiveField(2)
          @JsonKey(name: 'no_rich_text')
              required bool? noRichText,
          @HiveField(3)
              required bool? discoverable,
          @HiveField(4)
          @JsonKey(name: 'actor_type')
              required String? actorType}) =
      _$_PleromaApiMyAccountSourcePleromaPart;

  factory _PleromaApiMyAccountSourcePleromaPart.fromJson(
          Map<String, dynamic> json) =
      _$_PleromaApiMyAccountSourcePleromaPart.fromJson;

  @override
  @HiveField(1)
  @JsonKey(name: 'show_role')
  bool? get showRole;
  @override
  @HiveField(2)
  @JsonKey(name: 'no_rich_text')
  bool? get noRichText;
  @override
  @HiveField(3)
  bool? get discoverable;
  @override
  @HiveField(4)
  @JsonKey(name: 'actor_type')
  String? get actorType;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiMyAccountSourcePleromaPartCopyWith<
          _PleromaApiMyAccountSourcePleromaPart>
      get copyWith => throw _privateConstructorUsedError;
}
