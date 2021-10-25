// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unifedi_api_poll_option_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnifediApiPollOption _$UnifediApiPollOptionFromJson(Map<String, dynamic> json) {
  return _UnifediApiPollOption.fromJson(json);
}

/// @nodoc
class _$UnifediApiPollOptionTearOff {
  const _$UnifediApiPollOptionTearOff();

  _UnifediApiPollOption call(
      {@HiveField(0) required String title,
      @HiveField(1) @JsonKey(name: 'votes_count') required int? votesCount}) {
    return _UnifediApiPollOption(
      title: title,
      votesCount: votesCount,
    );
  }

  UnifediApiPollOption fromJson(Map<String, Object> json) {
    return UnifediApiPollOption.fromJson(json);
  }
}

/// @nodoc
const $UnifediApiPollOption = _$UnifediApiPollOptionTearOff();

/// @nodoc
mixin _$UnifediApiPollOption {
  @HiveField(0)
  String get title => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'votes_count')
  int? get votesCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnifediApiPollOptionCopyWith<UnifediApiPollOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnifediApiPollOptionCopyWith<$Res> {
  factory $UnifediApiPollOptionCopyWith(UnifediApiPollOption value,
          $Res Function(UnifediApiPollOption) then) =
      _$UnifediApiPollOptionCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String title,
      @HiveField(1) @JsonKey(name: 'votes_count') int? votesCount});
}

/// @nodoc
class _$UnifediApiPollOptionCopyWithImpl<$Res>
    implements $UnifediApiPollOptionCopyWith<$Res> {
  _$UnifediApiPollOptionCopyWithImpl(this._value, this._then);

  final UnifediApiPollOption _value;
  // ignore: unused_field
  final $Res Function(UnifediApiPollOption) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? votesCount = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      votesCount: votesCount == freezed
          ? _value.votesCount
          : votesCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$UnifediApiPollOptionCopyWith<$Res>
    implements $UnifediApiPollOptionCopyWith<$Res> {
  factory _$UnifediApiPollOptionCopyWith(_UnifediApiPollOption value,
          $Res Function(_UnifediApiPollOption) then) =
      __$UnifediApiPollOptionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String title,
      @HiveField(1) @JsonKey(name: 'votes_count') int? votesCount});
}

/// @nodoc
class __$UnifediApiPollOptionCopyWithImpl<$Res>
    extends _$UnifediApiPollOptionCopyWithImpl<$Res>
    implements _$UnifediApiPollOptionCopyWith<$Res> {
  __$UnifediApiPollOptionCopyWithImpl(
      _UnifediApiPollOption _value, $Res Function(_UnifediApiPollOption) _then)
      : super(_value, (v) => _then(v as _UnifediApiPollOption));

  @override
  _UnifediApiPollOption get _value => super._value as _UnifediApiPollOption;

  @override
  $Res call({
    Object? title = freezed,
    Object? votesCount = freezed,
  }) {
    return _then(_UnifediApiPollOption(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      votesCount: votesCount == freezed
          ? _value.votesCount
          : votesCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnifediApiPollOption implements _UnifediApiPollOption {
  const _$_UnifediApiPollOption(
      {@HiveField(0) required this.title,
      @HiveField(1) @JsonKey(name: 'votes_count') required this.votesCount});

  factory _$_UnifediApiPollOption.fromJson(Map<String, dynamic> json) =>
      _$$_UnifediApiPollOptionFromJson(json);

  @override
  @HiveField(0)
  final String title;
  @override
  @HiveField(1)
  @JsonKey(name: 'votes_count')
  final int? votesCount;

  @override
  String toString() {
    return 'UnifediApiPollOption(title: $title, votesCount: $votesCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UnifediApiPollOption &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.votesCount, votesCount) ||
                const DeepCollectionEquality()
                    .equals(other.votesCount, votesCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(votesCount);

  @JsonKey(ignore: true)
  @override
  _$UnifediApiPollOptionCopyWith<_UnifediApiPollOption> get copyWith =>
      __$UnifediApiPollOptionCopyWithImpl<_UnifediApiPollOption>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnifediApiPollOptionToJson(this);
  }
}

abstract class _UnifediApiPollOption implements UnifediApiPollOption {
  const factory _UnifediApiPollOption(
      {@HiveField(0)
          required String title,
      @HiveField(1)
      @JsonKey(name: 'votes_count')
          required int? votesCount}) = _$_UnifediApiPollOption;

  factory _UnifediApiPollOption.fromJson(Map<String, dynamic> json) =
      _$_UnifediApiPollOption.fromJson;

  @override
  @HiveField(0)
  String get title => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  @JsonKey(name: 'votes_count')
  int? get votesCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UnifediApiPollOptionCopyWith<_UnifediApiPollOption> get copyWith =>
      throw _privateConstructorUsedError;
}
