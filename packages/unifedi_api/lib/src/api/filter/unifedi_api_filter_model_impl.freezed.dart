// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_filter_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiFilter _$UnifediApiFilterFromJson(Map<String, dynamic> json) {
  return _UnifediApiFilter.fromJson(json);
}

/// @nodoc
class _$UnifediApiFilterTearOff {
  const _$UnifediApiFilterTearOff();

  _UnifediApiFilter call(
      {@HiveField(0) required List<String> context,
      @HiveField(1) @JsonKey(name: 'expires_at') required DateTime? expiresAt,
      @HiveField(2) required String id,
      @HiveField(3) required bool irreversible,
      @HiveField(4) required String phrase,
      @HiveField(5) @JsonKey(name: 'whole_word') required bool wholeWord}) {
    return _UnifediApiFilter(
      context: context,
      expiresAt: expiresAt,
      id: id,
      irreversible: irreversible,
      phrase: phrase,
      wholeWord: wholeWord,
    );
  }

  UnifediApiFilter fromJson(Map<String, Object> json) {
    return UnifediApiFilter.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiFilter = _$UnifediApiFilterTearOff();

/// @nodoc
mixin _$UnifediApiFilter {
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
  $UnifediApiFilterCopyWith<UnifediApiFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiFilterCopyWith<$Res> {
  factory $UnifediApiFilterCopyWith(
          UnifediApiFilter value, $Res Function(UnifediApiFilter) then) =
      _$UnifediApiFilterCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) List<String> context,
      @HiveField(1) @JsonKey(name: 'expires_at') DateTime? expiresAt,
      @HiveField(2) String id,
      @HiveField(3) bool irreversible,
      @HiveField(4) String phrase,
      @HiveField(5) @JsonKey(name: 'whole_word') bool wholeWord});
}

/// @nodoc
class _$UnifediApiFilterCopyWithImpl<$Res>
    implements $UnifediApiFilterCopyWith<$Res> {
  _$UnifediApiFilterCopyWithImpl(this._value, this._then);

  final UnifediApiFilter _value;
  // ignore: unused_field
  final $Res Function(UnifediApiFilter) _then;

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
abstract class _$UnifediApiFilterCopyWith<$Res>
    implements $UnifediApiFilterCopyWith<$Res> {
  factory _$UnifediApiFilterCopyWith(
          _UnifediApiFilter value, $Res Function(_UnifediApiFilter) then) =
      __$UnifediApiFilterCopyWithImpl<$Res>;
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
class __$UnifediApiFilterCopyWithImpl<$Res>
    extends _$UnifediApiFilterCopyWithImpl<$Res>
    implements _$UnifediApiFilterCopyWith<$Res> {
  __$UnifediApiFilterCopyWithImpl(
      _UnifediApiFilter _value, $Res Function(_UnifediApiFilter) _then)
      : super(_value, (v) => _then(v as _UnifediApiFilter));

  @override
  _UnifediApiFilter get _value => super._value as _UnifediApiFilter;

  @override
  $Res call({
    Object? context = freezed,
    Object? expiresAt = freezed,
    Object? id = freezed,
    Object? irreversible = freezed,
    Object? phrase = freezed,
    Object? wholeWord = freezed,
  }) {
    return _then(_UnifediApiFilter(
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
class _$_UnifediApiFilter implements _UnifediApiFilter {
  const _$_UnifediApiFilter(
      {@HiveField(0) required this.context,
      @HiveField(1) @JsonKey(name: 'expires_at') required this.expiresAt,
      @HiveField(2) required this.id,
      @HiveField(3) required this.irreversible,
      @HiveField(4) required this.phrase,
      @HiveField(5) @JsonKey(name: 'whole_word') required this.wholeWord});

  factory _$_UnifediApiFilter.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiFilterFromJson(json);

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
    return 'UnifediApiFilter(context: $context, expiresAt: $expiresAt, id: $id, irreversible: $irreversible, phrase: $phrase, wholeWord: $wholeWord)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiFilter &&
            (identical(other.context, context) ||
                const DeepCollectionEquality()
                    .equals(other.context, context)) &&
            (identical(other.expiresAt, expiresAt) ||
                const DeepCollectionEquality()
                    .equals(other.expiresAt, expiresAt)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
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
      const DeepCollectionEquality().hash(expiresAt) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(irreversible) ^
      const DeepCollectionEquality().hash(phrase) ^
      const DeepCollectionEquality().hash(wholeWord);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiFilterCopyWith<_UnifediApiFilter> get copyWith =>
      __$UnifediApiFilterCopyWithImpl<_UnifediApiFilter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiFilterToJson(this);
  }
}

abstract class _UnifediApiFilter implements UnifediApiFilter {
  const factory _UnifediApiFilter(
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
          required bool wholeWord}) = _$_UnifediApiFilter;

  factory _UnifediApiFilter.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiFilter.fromJson;

  @override
  @HiveField(0)
  List<String> get context => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get id => throw _privateConstructorUsedError;
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
  _$UnifediApiFilterCopyWith<_UnifediApiFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
