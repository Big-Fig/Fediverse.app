// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_post_filter_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiPostFilter _$PleromaApiPostFilterFromJson(Map<String, dynamic> json) {
  return _PleromaApiPostFilter.fromJson(json);
}

/// @nodoc
class _$PleromaApiPostFilterTearOff {
  const _$PleromaApiPostFilterTearOff();

  _PleromaApiPostFilter call(
      {@HiveField(0) required List<String> context,
      @HiveField(1) @JsonKey(name: 'expires_in') required Duration? expiresIn,
      @HiveField(3) required bool irreversible,
      @HiveField(4) required String phrase,
      @HiveField(5) @JsonKey(name: 'whole_word') required bool wholeWord}) {
    return _PleromaApiPostFilter(
      context: context,
      expiresIn: expiresIn,
      irreversible: irreversible,
      phrase: phrase,
      wholeWord: wholeWord,
    );
  }

  PleromaApiPostFilter fromJson(Map<String, Object> json) {
    return PleromaApiPostFilter.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiPostFilter = _$PleromaApiPostFilterTearOff();

/// @nodoc
mixin _$PleromaApiPostFilter {
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
  $PleromaApiPostFilterCopyWith<PleromaApiPostFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiPostFilterCopyWith<$Res> {
  factory $PleromaApiPostFilterCopyWith(PleromaApiPostFilter value,
          $Res Function(PleromaApiPostFilter) then) =
      _$PleromaApiPostFilterCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) List<String> context,
      @HiveField(1) @JsonKey(name: 'expires_in') Duration? expiresIn,
      @HiveField(3) bool irreversible,
      @HiveField(4) String phrase,
      @HiveField(5) @JsonKey(name: 'whole_word') bool wholeWord});
}

/// @nodoc
class _$PleromaApiPostFilterCopyWithImpl<$Res>
    implements $PleromaApiPostFilterCopyWith<$Res> {
  _$PleromaApiPostFilterCopyWithImpl(this._value, this._then);

  final PleromaApiPostFilter _value;
  // ignore: unused_field
  final $Res Function(PleromaApiPostFilter) _then;

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
abstract class _$PleromaApiPostFilterCopyWith<$Res>
    implements $PleromaApiPostFilterCopyWith<$Res> {
  factory _$PleromaApiPostFilterCopyWith(_PleromaApiPostFilter value,
          $Res Function(_PleromaApiPostFilter) then) =
      __$PleromaApiPostFilterCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) List<String> context,
      @HiveField(1) @JsonKey(name: 'expires_in') Duration? expiresIn,
      @HiveField(3) bool irreversible,
      @HiveField(4) String phrase,
      @HiveField(5) @JsonKey(name: 'whole_word') bool wholeWord});
}

/// @nodoc
class __$PleromaApiPostFilterCopyWithImpl<$Res>
    extends _$PleromaApiPostFilterCopyWithImpl<$Res>
    implements _$PleromaApiPostFilterCopyWith<$Res> {
  __$PleromaApiPostFilterCopyWithImpl(
      _PleromaApiPostFilter _value, $Res Function(_PleromaApiPostFilter) _then)
      : super(_value, (v) => _then(v as _PleromaApiPostFilter));

  @override
  _PleromaApiPostFilter get _value => super._value as _PleromaApiPostFilter;

  @override
  $Res call({
    Object? context = freezed,
    Object? expiresIn = freezed,
    Object? irreversible = freezed,
    Object? phrase = freezed,
    Object? wholeWord = freezed,
  }) {
    return _then(_PleromaApiPostFilter(
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
class _$_PleromaApiPostFilter implements _PleromaApiPostFilter {
  const _$_PleromaApiPostFilter(
      {@HiveField(0) required this.context,
      @HiveField(1) @JsonKey(name: 'expires_in') required this.expiresIn,
      @HiveField(3) required this.irreversible,
      @HiveField(4) required this.phrase,
      @HiveField(5) @JsonKey(name: 'whole_word') required this.wholeWord});

  factory _$_PleromaApiPostFilter.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiPostFilterFromJson(json);

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
    return 'PleromaApiPostFilter(context: $context, expiresIn: $expiresIn, irreversible: $irreversible, phrase: $phrase, wholeWord: $wholeWord)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiPostFilter &&
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
  _$PleromaApiPostFilterCopyWith<_PleromaApiPostFilter> get copyWith =>
      __$PleromaApiPostFilterCopyWithImpl<_PleromaApiPostFilter>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiPostFilterToJson(this);
  }
}

abstract class _PleromaApiPostFilter implements PleromaApiPostFilter {
  const factory _PleromaApiPostFilter(
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
          required bool wholeWord}) = _$_PleromaApiPostFilter;

  factory _PleromaApiPostFilter.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiPostFilter.fromJson;

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
  _$PleromaApiPostFilterCopyWith<_PleromaApiPostFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
