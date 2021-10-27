// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mastodon_api_post_filter_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MastodonApiPostFilter _$MastodonApiPostFilterFromJson(
    Map<String, dynamic> json) {
  return _MastodonApiPostFilter.fromJson(json);
}

/// @nodoc
class _$MastodonApiPostFilterTearOff {
  const _$MastodonApiPostFilterTearOff();

  _MastodonApiPostFilter call(
      {@HiveField(0) required List<String> context,
      @HiveField(1) @JsonKey(name: 'expires_in') required Duration? expiresIn,
      @HiveField(3) required bool irreversible,
      @HiveField(4) required String phrase,
      @HiveField(5) @JsonKey(name: 'whole_word') required bool wholeWord}) {
    return _MastodonApiPostFilter(
      context: context,
      expiresIn: expiresIn,
      irreversible: irreversible,
      phrase: phrase,
      wholeWord: wholeWord,
    );
  }

  MastodonApiPostFilter fromJson(Map<String, Object?> json) {
    return MastodonApiPostFilter.fromJson(json);
  }
}

/// @nodoc
const $MastodonApiPostFilter = _$MastodonApiPostFilterTearOff();

/// @nodoc
mixin _$MastodonApiPostFilter {
  @HiveField(0)
  List<String> get context => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'expires_in')
  Duration? get expiresIn => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get irreversible => throw _privateConstructorUsedError;
  @HiveField(4)
  String get phrase => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'whole_word')
  bool get wholeWord => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastodonApiPostFilterCopyWith<MastodonApiPostFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MastodonApiPostFilterCopyWith<$Res> {
  factory $MastodonApiPostFilterCopyWith(MastodonApiPostFilter value,
          $Res Function(MastodonApiPostFilter) then) =
      _$MastodonApiPostFilterCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) List<String> context,
      @HiveField(1) @JsonKey(name: 'expires_in') Duration? expiresIn,
      @HiveField(3) bool irreversible,
      @HiveField(4) String phrase,
      @HiveField(5) @JsonKey(name: 'whole_word') bool wholeWord});
}

/// @nodoc
class _$MastodonApiPostFilterCopyWithImpl<$Res>
    implements $MastodonApiPostFilterCopyWith<$Res> {
  _$MastodonApiPostFilterCopyWithImpl(this._value, this._then);

  final MastodonApiPostFilter _value;
  // ignore: unused_field
  final $Res Function(MastodonApiPostFilter) _then;

  @override
  $Res call({
    Object? context = freezed,
    Object? expiresIn = freezed,
    Object? irreversible = freezed,
    Object? phrase = freezed,
    Object? wholeWord = freezed,
  }) {
    return _then(_value.copyWith(
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as List<String>,
      expiresIn: expiresIn == freezed
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as Duration?,
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
abstract class _$MastodonApiPostFilterCopyWith<$Res>
    implements $MastodonApiPostFilterCopyWith<$Res> {
  factory _$MastodonApiPostFilterCopyWith(_MastodonApiPostFilter value,
          $Res Function(_MastodonApiPostFilter) then) =
      __$MastodonApiPostFilterCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) List<String> context,
      @HiveField(1) @JsonKey(name: 'expires_in') Duration? expiresIn,
      @HiveField(3) bool irreversible,
      @HiveField(4) String phrase,
      @HiveField(5) @JsonKey(name: 'whole_word') bool wholeWord});
}

/// @nodoc
class __$MastodonApiPostFilterCopyWithImpl<$Res>
    extends _$MastodonApiPostFilterCopyWithImpl<$Res>
    implements _$MastodonApiPostFilterCopyWith<$Res> {
  __$MastodonApiPostFilterCopyWithImpl(_MastodonApiPostFilter _value,
      $Res Function(_MastodonApiPostFilter) _then)
      : super(_value, (v) => _then(v as _MastodonApiPostFilter));

  @override
  _MastodonApiPostFilter get _value => super._value as _MastodonApiPostFilter;

  @override
  $Res call({
    Object? context = freezed,
    Object? expiresIn = freezed,
    Object? irreversible = freezed,
    Object? phrase = freezed,
    Object? wholeWord = freezed,
  }) {
    return _then(_MastodonApiPostFilter(
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as List<String>,
      expiresIn: expiresIn == freezed
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as Duration?,
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
class _$_MastodonApiPostFilter implements _MastodonApiPostFilter {
  const _$_MastodonApiPostFilter(
      {@HiveField(0) required this.context,
      @HiveField(1) @JsonKey(name: 'expires_in') required this.expiresIn,
      @HiveField(3) required this.irreversible,
      @HiveField(4) required this.phrase,
      @HiveField(5) @JsonKey(name: 'whole_word') required this.wholeWord});

  factory _$_MastodonApiPostFilter.fromJson(Map<String, dynamic> json) =>
      _$$_MastodonApiPostFilterFromJson(json);

  @override
  @HiveField(0)
  final List<String> context;
  @override
  @HiveField(1)
  @JsonKey(name: 'expires_in')
  final Duration? expiresIn;
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
    return 'MastodonApiPostFilter(context: $context, expiresIn: $expiresIn, irreversible: $irreversible, phrase: $phrase, wholeWord: $wholeWord)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MastodonApiPostFilter &&
            const DeepCollectionEquality().equals(other.context, context) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
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
      expiresIn,
      irreversible,
      phrase,
      wholeWord);

  @JsonKey(ignore: true)
  @override
  _$MastodonApiPostFilterCopyWith<_MastodonApiPostFilter> get copyWith =>
      __$MastodonApiPostFilterCopyWithImpl<_MastodonApiPostFilter>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MastodonApiPostFilterToJson(this);
  }
}

abstract class _MastodonApiPostFilter implements MastodonApiPostFilter {
  const factory _MastodonApiPostFilter(
      {@HiveField(0)
          required List<String> context,
      @HiveField(1)
      @JsonKey(name: 'expires_in')
          required Duration? expiresIn,
      @HiveField(3)
          required bool irreversible,
      @HiveField(4)
          required String phrase,
      @HiveField(5)
      @JsonKey(name: 'whole_word')
          required bool wholeWord}) = _$_MastodonApiPostFilter;

  factory _MastodonApiPostFilter.fromJson(Map<String, dynamic> json) =
      _$_MastodonApiPostFilter.fromJson;

  @override
  @HiveField(0)
  List<String> get context;
  @override
  @HiveField(1)
  @JsonKey(name: 'expires_in')
  Duration? get expiresIn;
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
  _$MastodonApiPostFilterCopyWith<_MastodonApiPostFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
