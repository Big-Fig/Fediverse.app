// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_poll_option_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiPollOption _$PleromaApiPollOptionFromJson(Map<String, dynamic> json) {
  return _PleromaApiPollOption.fromJson(json);
}

/// @nodoc
class _$PleromaApiPollOptionTearOff {
  const _$PleromaApiPollOptionTearOff();

  _PleromaApiPollOption call(
      {@HiveField(0) required String title,
      @HiveField(1) @JsonKey(name: 'votes_count') required int? votesCount}) {
    return _PleromaApiPollOption(
      title: title,
      votesCount: votesCount,
    );
  }

  PleromaApiPollOption fromJson(Map<String, Object?> json) {
    return PleromaApiPollOption.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiPollOption = _$PleromaApiPollOptionTearOff();

/// @nodoc
mixin _$PleromaApiPollOption {
  @HiveField(0)
  String get title => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'votes_count')
  int? get votesCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiPollOptionCopyWith<PleromaApiPollOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiPollOptionCopyWith<$Res> {
  factory $PleromaApiPollOptionCopyWith(PleromaApiPollOption value,
          $Res Function(PleromaApiPollOption) then) =
      _$PleromaApiPollOptionCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String title,
      @HiveField(1) @JsonKey(name: 'votes_count') int? votesCount});
}

/// @nodoc
class _$PleromaApiPollOptionCopyWithImpl<$Res>
    implements $PleromaApiPollOptionCopyWith<$Res> {
  _$PleromaApiPollOptionCopyWithImpl(this._value, this._then);

  final PleromaApiPollOption _value;
  // ignore: unused_field
  final $Res Function(PleromaApiPollOption) _then;

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
abstract class _$PleromaApiPollOptionCopyWith<$Res>
    implements $PleromaApiPollOptionCopyWith<$Res> {
  factory _$PleromaApiPollOptionCopyWith(_PleromaApiPollOption value,
          $Res Function(_PleromaApiPollOption) then) =
      __$PleromaApiPollOptionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String title,
      @HiveField(1) @JsonKey(name: 'votes_count') int? votesCount});
}

/// @nodoc
class __$PleromaApiPollOptionCopyWithImpl<$Res>
    extends _$PleromaApiPollOptionCopyWithImpl<$Res>
    implements _$PleromaApiPollOptionCopyWith<$Res> {
  __$PleromaApiPollOptionCopyWithImpl(
      _PleromaApiPollOption _value, $Res Function(_PleromaApiPollOption) _then)
      : super(_value, (v) => _then(v as _PleromaApiPollOption));

  @override
  _PleromaApiPollOption get _value => super._value as _PleromaApiPollOption;

  @override
  $Res call({
    Object? title = freezed,
    Object? votesCount = freezed,
  }) {
    return _then(_PleromaApiPollOption(
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
class _$_PleromaApiPollOption implements _PleromaApiPollOption {
  const _$_PleromaApiPollOption(
      {@HiveField(0) required this.title,
      @HiveField(1) @JsonKey(name: 'votes_count') required this.votesCount});

  factory _$_PleromaApiPollOption.fromJson(Map<String, dynamic> json) =>
      _$$_PleromaApiPollOptionFromJson(json);

  @override
  @HiveField(0)
  final String title;
  @override
  @HiveField(1)
  @JsonKey(name: 'votes_count')
  final int? votesCount;

  @override
  String toString() {
    return 'PleromaApiPollOption(title: $title, votesCount: $votesCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PleromaApiPollOption &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.votesCount, votesCount) ||
                other.votesCount == votesCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, votesCount);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiPollOptionCopyWith<_PleromaApiPollOption> get copyWith =>
      __$PleromaApiPollOptionCopyWithImpl<_PleromaApiPollOption>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiPollOptionToJson(this);
  }
}

abstract class _PleromaApiPollOption implements PleromaApiPollOption {
  const factory _PleromaApiPollOption(
      {@HiveField(0)
          required String title,
      @HiveField(1)
      @JsonKey(name: 'votes_count')
          required int? votesCount}) = _$_PleromaApiPollOption;

  factory _PleromaApiPollOption.fromJson(Map<String, dynamic> json) =
      _$_PleromaApiPollOption.fromJson;

  @override
  @HiveField(0)
  String get title;
  @override
  @HiveField(1)
  @JsonKey(name: 'votes_count')
  int? get votesCount;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiPollOptionCopyWith<_PleromaApiPollOption> get copyWith =>
      throw _privateConstructorUsedError;
}
