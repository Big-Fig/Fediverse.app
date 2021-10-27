// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_filter_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiFilter _$PleromaApiFilterFromJson(Map<String, dynamic> json) {
  return _PleromaApiFilter.fromJson(json);
}

/// @nodoc
class _$PleromaApiFilterTearOff {
  const _$PleromaApiFilterTearOff();

  _PleromaApiFilter call(
      {@HiveField(0) required List<String> context,
      @HiveField(1) @JsonKey(name: 'expires_at') required DateTime? expiresAt,
      @HiveField(2) required String id,
      @HiveField(3) required bool irreversible,
      @HiveField(4) required String phrase,
      @HiveField(5) @JsonKey(name: 'whole_word') required bool wholeWord}) {
    return _PleromaApiFilter(
      context: context,
      expiresAt: expiresAt,
      id: id,
      irreversible: irreversible,
      phrase: phrase,
      wholeWord: wholeWord,
    );
  }

  PleromaApiFilter fromJson(Map<String, Object?> json) {
    return PleromaApiFilter.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiFilter = _$PleromaApiFilterTearOff();

/// @nodoc
mixin _$PleromaApiFilter {
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
  $PleromaApiFilterCopyWith<PleromaApiFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiFilterCopyWith<$Res> {
  factory $PleromaApiFilterCopyWith(
          PleromaApiFilter value, $Res Function(PleromaApiFilter) then) =
      _$PleromaApiFilterCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) List<String> context,
      @HiveField(1) @JsonKey(name: 'expires_at') DateTime? expiresAt,
      @HiveField(2) String id,
      @HiveField(3) bool irreversible,
      @HiveField(4) String phrase,
      @HiveField(5) @JsonKey(name: 'whole_word') bool wholeWord});
}

/// @nodoc
class _$PleromaApiFilterCopyWithImpl<$Res>
    implements $PleromaApiFilterCopyWith<$Res> {
  _$PleromaApiFilterCopyWithImpl(this._value, this._then);

  final PleromaApiFilter _value;
  // ignore: unused_field
  final $Res Function(PleromaApiFilter) _then;

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
abstract class _$PleromaApiFilterCopyWith<$Res>
    implements $PleromaApiFilterCopyWith<$Res> {
  factory _$PleromaApiFilterCopyWith(
          _PleromaApiFilter value, $Res Function(_PleromaApiFilter) then) =
      __$PleromaApiFilterCopyWithImpl<$Res>;
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
class __$PleromaApiFilterCopyWithImpl<$Res>
    extends _$PleromaApiFilterCopyWithImpl<$Res>
    implements _$PleromaApiFilterCopyWith<$Res> {
  __$PleromaApiFilterCopyWithImpl(
      _PleromaApiFilter _value, $Res Function(_PleromaApiFilter) _then)
      : super(_value, (v) => _then(v as _PleromaApiFilter));

  @override
  _PleromaApiFilter get _value => super._value as _PleromaApiFilter;

  @override
  $Res call({
    Object? context = freezed,
    Object? expiresAt = freezed,
    Object? id = freezed,
    Object? irreversible = freezed,
    Object? phrase = freezed,
    Object? wholeWord = freezed,
  }) {
    return _then(_PleromaApiFilter(
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
class _$_PleromaApiFilter implements _PleromaApiFilter {
  const _$_PleromaApiFilter(
      {@HiveField(0) required this.context,
      @HiveField(1) @JsonKey(name: 'expires_at') required this.expiresAt,
      @HiveField(2) required this.id,
      @HiveField(3) required this.irreversible,
      @HiveField(4) required this.phrase,
      @HiveField(5) @JsonKey(name: 'whole_word') required this.wholeWord});

  factory _$_PleromaApiFilter.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiFilterFromJson(json);

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
    return 'PleromaApiFilter(context: $context, expiresAt: $expiresAt, id: $id, irreversible: $irreversible, phrase: $phrase, wholeWord: $wholeWord)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiFilter &&
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
  _$PleromaApiFilterCopyWith<_PleromaApiFilter> get copyWith =>
      __$PleromaApiFilterCopyWithImpl<_PleromaApiFilter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiFilterToJson(this);
  }
}

abstract class _PleromaApiFilter implements PleromaApiFilter {
  const factory _PleromaApiFilter(
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
          required bool wholeWord}) = _$_PleromaApiFilter;

  factory _PleromaApiFilter.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiFilter.fromJson;

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
  _$PleromaApiFilterCopyWith<_PleromaApiFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
