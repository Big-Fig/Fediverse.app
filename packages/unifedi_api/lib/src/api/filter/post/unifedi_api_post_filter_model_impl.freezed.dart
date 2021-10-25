// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_post_filter_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPostFilter _$UnifediApiPostFilterFromJson(Map<String, dynamic> json) {
  return _UnifediApiPostFilter.fromJson(json);
}

/// @nodoc
class _$UnifediApiPostFilterTearOff {
  const _$UnifediApiPostFilterTearOff();

  _UnifediApiPostFilter call(
      {@HiveField(0) required List<String> context,
      @HiveField(1) @JsonKey(name: 'expires_in') required Duration? expiresIn,
      @HiveField(3) required bool irreversible,
      @HiveField(4) required String phrase,
      @HiveField(5) @JsonKey(name: 'whole_word') required bool wholeWord}) {
    return _UnifediApiPostFilter(
      context: context,
      expiresIn: expiresIn,
      irreversible: irreversible,
      phrase: phrase,
      wholeWord: wholeWord,
    );
  }

  UnifediApiPostFilter fromJson(Map<String, Object> json) {
    return UnifediApiPostFilter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPostFilter = _$UnifediApiPostFilterTearOff();

/// @nodoc
mixin _$UnifediApiPostFilter {
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
  $UnifediApiPostFilterCopyWith<UnifediApiPostFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPostFilterCopyWith<$Res> {
  factory $UnifediApiPostFilterCopyWith(UnifediApiPostFilter value,
          $Res Function(UnifediApiPostFilter) then) =
      _$UnifediApiPostFilterCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) List<String> context,
      @HiveField(1) @JsonKey(name: 'expires_in') Duration? expiresIn,
      @HiveField(3) bool irreversible,
      @HiveField(4) String phrase,
      @HiveField(5) @JsonKey(name: 'whole_word') bool wholeWord});
}

/// @nodoc
class _$UnifediApiPostFilterCopyWithImpl<$Res>
    implements $UnifediApiPostFilterCopyWith<$Res> {
  _$UnifediApiPostFilterCopyWithImpl(this._value, this._then);

  final UnifediApiPostFilter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPostFilter) _then;

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
abstract class _$UnifediApiPostFilterCopyWith<$Res>
    implements $UnifediApiPostFilterCopyWith<$Res> {
  factory _$UnifediApiPostFilterCopyWith(_UnifediApiPostFilter value,
          $Res Function(_UnifediApiPostFilter) then) =
      __$UnifediApiPostFilterCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) List<String> context,
      @HiveField(1) @JsonKey(name: 'expires_in') Duration? expiresIn,
      @HiveField(3) bool irreversible,
      @HiveField(4) String phrase,
      @HiveField(5) @JsonKey(name: 'whole_word') bool wholeWord});
}

/// @nodoc
class __$UnifediApiPostFilterCopyWithImpl<$Res>
    extends _$UnifediApiPostFilterCopyWithImpl<$Res>
    implements _$UnifediApiPostFilterCopyWith<$Res> {
  __$UnifediApiPostFilterCopyWithImpl(
      _UnifediApiPostFilter _value, $Res Function(_UnifediApiPostFilter) _then)
      : super(_value, (v) => _then(v as _UnifediApiPostFilter));

  @override
  _UnifediApiPostFilter get _value => super._value as _UnifediApiPostFilter;

  @override
  $Res call({
    Object? context = freezed,
    Object? expiresIn = freezed,
    Object? irreversible = freezed,
    Object? phrase = freezed,
    Object? wholeWord = freezed,
  }) {
    return _then(_UnifediApiPostFilter(
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
class _$_UnifediApiPostFilter implements _UnifediApiPostFilter {
  const _$_UnifediApiPostFilter(
      {@HiveField(0) required this.context,
      @HiveField(1) @JsonKey(name: 'expires_in') required this.expiresIn,
      @HiveField(3) required this.irreversible,
      @HiveField(4) required this.phrase,
      @HiveField(5) @JsonKey(name: 'whole_word') required this.wholeWord});

  factory _$_UnifediApiPostFilter.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiPostFilterFromJson(json);

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
    return 'UnifediApiPostFilter(context: $context, expiresIn: $expiresIn, irreversible: $irreversible, phrase: $phrase, wholeWord: $wholeWord)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiPostFilter &&
            (identical(other.context, context) ||
                const DeepCollectionEquality()
                    .equals(other.context, context)) &&
            (identical(other.expiresIn, expiresIn) ||
                const DeepCollectionEquality()
                    .equals(other.expiresIn, expiresIn)) &&
            (identical(other.irreversible, irreversible) ||
                const DeepCollectionEquality()
                    .equals(other.irreversible, irreversible)) &&
            (identical(other.phrase, phrase) ||
                const DeepCollectionEquality().equals(other.phrase, phrase)) &&
            (identical(other.wholeWord, wholeWord) ||
                const DeepCollectionEquality()
                    .equals(other.wholeWord, wholeWord)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(context) ^
      const DeepCollectionEquality().hash(expiresIn) ^
      const DeepCollectionEquality().hash(irreversible) ^
      const DeepCollectionEquality().hash(phrase) ^
      const DeepCollectionEquality().hash(wholeWord);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPostFilterCopyWith<_UnifediApiPostFilter> get copyWith =>
      __$UnifediApiPostFilterCopyWithImpl<_UnifediApiPostFilter>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPostFilterToJson(this);
  }
}

abstract class _UnifediApiPostFilter implements UnifediApiPostFilter {
  const factory _UnifediApiPostFilter(
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
          required bool wholeWord}) = _$_UnifediApiPostFilter;

  factory _UnifediApiPostFilter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiPostFilter.fromJson;

  @override
  @HiveField(0)
  List<String> get context => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'expires_in')
  Duration? get expiresIn => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  bool get irreversible => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  String get phrase => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  @JsonKey(name: 'whole_word')
  bool get wholeWord => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPostFilterCopyWith<_UnifediApiPostFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
