// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_filter_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiFilter _$MastodonApiFilterFromJson(Map<String, dynamic> json) {
  return _MastodonApiFilter.fromJson(json);
}

/// @nodoc
class _$MastodonApiFilterTearOff {
  const _$MastodonApiFilterTearOff();

  _MastodonApiFilter call(
      {@HiveField(0) required List<String> context,
      @HiveField(1) @JsonKey(name: 'expires_at') required DateTime? expiresAt,
      @HiveField(2) required String id,
      @HiveField(3) required bool irreversible,
      @HiveField(4) required String phrase,
      @HiveField(5) @JsonKey(name: 'whole_word') required bool wholeWord}) {
    return _MastodonApiFilter(
      context: context,
      expiresAt: expiresAt,
      id: id,
      irreversible: irreversible,
      phrase: phrase,
      wholeWord: wholeWord,
    );
  }

  MastodonApiFilter fromJson(Map<String, Object?> json) {
    return MastodonApiFilter.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiFilter = _$MastodonApiFilterTearOff();

/// @nodoc
mixin _$MastodonApiFilter {
  @HiveField(0)
  List<String> get context => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  @HiveField(2)
  String get id => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get irreversible => throw _privateConstructorUsedError;
  @HiveField(4)
  String get phrase => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'whole_word')
  bool get wholeWord => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiFilterCopyWith<MastodonApiFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiFilterCopyWith<$Res> {
  factory $MastodonApiFilterCopyWith(
          MastodonApiFilter value, $Res Function(MastodonApiFilter) then) =
      _$MastodonApiFilterCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) List<String> context,
      @HiveField(1) @JsonKey(name: 'expires_at') DateTime? expiresAt,
      @HiveField(2) String id,
      @HiveField(3) bool irreversible,
      @HiveField(4) String phrase,
      @HiveField(5) @JsonKey(name: 'whole_word') bool wholeWord});
}

/// @nodoc
class _$MastodonApiFilterCopyWithImpl<$Res>
    implements $MastodonApiFilterCopyWith<$Res> {
  _$MastodonApiFilterCopyWithImpl(this._value, this._then);

  final MastodonApiFilter _value;
  // ignore: unused_field
  final $Res Function(MastodonApiFilter) _then;

  @override
  $Res call({
    Object? context = freezed,
    Object? expiresAt = freezed,
    Object? id = freezed,
    Object? irreversible = freezed,
    Object? phrase = freezed,
    Object? wholeWord = freezed,
  }) {
    return _then(_value.copyWith(
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as List<String>,
      expiresAt: expiresAt == freezed
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      irreversible: irreversible == freezed
          ? _value.irreversible
          : irreversible // ignore: cast_nullable_to_non_nullable
              as bool,
      phrase: phrase == freezed
          ? _value.phrase
          : phrase // ignore: cast_nullable_to_non_nullable
              as String,
      wholeWord: wholeWord == freezed
          ? _value.wholeWord
          : wholeWord // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$MastodonApiFilterCopyWith<$Res>
    implements $MastodonApiFilterCopyWith<$Res> {
  factory _$MastodonApiFilterCopyWith(
          _MastodonApiFilter value, $Res Function(_MastodonApiFilter) then) =
      __$MastodonApiFilterCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) List<String> context,
      @HiveField(1) @JsonKey(name: 'expires_at') DateTime? expiresAt,
      @HiveField(2) String id,
      @HiveField(3) bool irreversible,
      @HiveField(4) String phrase,
      @HiveField(5) @JsonKey(name: 'whole_word') bool wholeWord});
}

/// @nodoc
class __$MastodonApiFilterCopyWithImpl<$Res>
    extends _$MastodonApiFilterCopyWithImpl<$Res>
    implements _$MastodonApiFilterCopyWith<$Res> {
  __$MastodonApiFilterCopyWithImpl(
      _MastodonApiFilter _value, $Res Function(_MastodonApiFilter) _then)
      : super(_value, (v) => _then(v as _MastodonApiFilter));

  @override
  _MastodonApiFilter get _value => super._value as _MastodonApiFilter;

  @override
  $Res call({
    Object? context = freezed,
    Object? expiresAt = freezed,
    Object? id = freezed,
    Object? irreversible = freezed,
    Object? phrase = freezed,
    Object? wholeWord = freezed,
  }) {
    return _then(_MastodonApiFilter(
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as List<String>,
      expiresAt: expiresAt == freezed
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      irreversible: irreversible == freezed
          ? _value.irreversible
          : irreversible // ignore: cast_nullable_to_non_nullable
              as bool,
      phrase: phrase == freezed
          ? _value.phrase
          : phrase // ignore: cast_nullable_to_non_nullable
              as String,
      wholeWord: wholeWord == freezed
          ? _value.wholeWord
          : wholeWord // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MastodonApiFilter implements _MastodonApiFilter {
  const _$_MastodonApiFilter(
      {@HiveField(0) required this.context,
      @HiveField(1) @JsonKey(name: 'expires_at') required this.expiresAt,
      @HiveField(2) required this.id,
      @HiveField(3) required this.irreversible,
      @HiveField(4) required this.phrase,
      @HiveField(5) @JsonKey(name: 'whole_word') required this.wholeWord});

  factory _$_MastodonApiFilter.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiFilterFromJson(json);

  @override
  @HiveField(0)
  final List<String> context;
  @override
  @HiveField(1)
  @JsonKey(name: 'expires_at')
  final DateTime? expiresAt;
  @override
  @HiveField(2)
  final String id;
  @override
  @HiveField(3)
  final bool irreversible;
  @override
  @HiveField(4)
  final String phrase;
  @override
  @HiveField(5)
  @JsonKey(name: 'whole_word')
  final bool wholeWord;

  @override
  String toString() {
    return 'MastodonApiFilter(context: $context, expiresAt: $expiresAt, id: $id, irreversible: $irreversible, phrase: $phrase, wholeWord: $wholeWord)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiFilter &&
            const DeepCollectionEquality().equals(other.context, context) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.irreversible, irreversible) ||
                other.irreversible == irreversible) &&
            (identical(other.phrase, phrase) || other.phrase == phrase) &&
            (identical(other.wholeWord, wholeWord) ||
                other.wholeWord == wholeWord));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      expiresAt,
      id,
      irreversible,
      phrase,
      wholeWord);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiFilterCopyWith<_MastodonApiFilter> get copyWith =>
      __$MastodonApiFilterCopyWithImpl<_MastodonApiFilter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiFilterToJson(this);
  }
}

abstract class _MastodonApiFilter implements MastodonApiFilter {
  const factory _MastodonApiFilter(
      {@HiveField(0)
          required List<String> context,
      @HiveField(1)
      @JsonKey(name: 'expires_at')
          required DateTime? expiresAt,
      @HiveField(2)
          required String id,
      @HiveField(3)
          required bool irreversible,
      @HiveField(4)
          required String phrase,
      @HiveField(5)
      @JsonKey(name: 'whole_word')
          required bool wholeWord}) = _$_MastodonApiFilter;

  factory _MastodonApiFilter.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiFilter.fromJson;

  @override
  @HiveField(0)
  List<String> get context;
  @override
  @HiveField(1)
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt;
  @override
  @HiveField(2)
  String get id;
  @override
  @HiveField(3)
  bool get irreversible;
  @override
  @HiveField(4)
  String get phrase;
  @override
  @HiveField(5)
  @JsonKey(name: 'whole_word')
  bool get wholeWord;
  @override
  @JsonKey(ignore: true)
  _$MastodonApiFilterCopyWith<_MastodonApiFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
