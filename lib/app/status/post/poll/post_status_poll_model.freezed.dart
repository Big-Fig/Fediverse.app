// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_status_poll_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostStatusPoll _$PostStatusPollFromJson(Map<String, dynamic> json) {
  return _PostStatusPoll.fromJson(json);
}

/// @nodoc
class _$PostStatusPollTearOff {
  const _$PostStatusPollTearOff();

  _PostStatusPoll call(
      {@JsonKey(name: 'duration_length') required Duration? durationLength,
      @JsonKey(name: 'hide_totals') required bool hideTotals,
      required bool multiple,
      required List<String> options}) {
    return _PostStatusPoll(
      durationLength: durationLength,
      hideTotals: hideTotals,
      multiple: multiple,
      options: options,
    );
  }

  PostStatusPoll fromJson(Map<String, Object> json) {
    return PostStatusPoll.fromJson(json);
  }
}

/// @nodoc
const $PostStatusPoll = _$PostStatusPollTearOff();

/// @nodoc
mixin _$PostStatusPoll {
  @JsonKey(name: 'duration_length')
  Duration? get durationLength => throw _privateConstructorUsedError;
  @JsonKey(name: 'hide_totals')
  bool get hideTotals => throw _privateConstructorUsedError;
  bool get multiple => throw _privateConstructorUsedError;
  List<String> get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostStatusPollCopyWith<PostStatusPoll> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostStatusPollCopyWith<$Res> {
  factory $PostStatusPollCopyWith(
          PostStatusPoll value, $Res Function(PostStatusPoll) then) =
      _$PostStatusPollCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'duration_length') Duration? durationLength,
      @JsonKey(name: 'hide_totals') bool hideTotals,
      bool multiple,
      List<String> options});
}

/// @nodoc
class _$PostStatusPollCopyWithImpl<$Res>
    implements $PostStatusPollCopyWith<$Res> {
  _$PostStatusPollCopyWithImpl(this._value, this._then);

  final PostStatusPoll _value;
  // ignore: unused_field
  final $Res Function(PostStatusPoll) _then;

  @override
  $Res call({
    Object? durationLength = freezed,
    Object? hideTotals = freezed,
    Object? multiple = freezed,
    Object? options = freezed,
  }) {
    return _then(_value.copyWith(
      durationLength: durationLength == freezed
          ? _value.durationLength
          : durationLength // ignore: cast_nullable_to_non_nullable
              as Duration?,
      hideTotals: hideTotals == freezed
          ? _value.hideTotals
          : hideTotals // ignore: cast_nullable_to_non_nullable
              as bool,
      multiple: multiple == freezed
          ? _value.multiple
          : multiple // ignore: cast_nullable_to_non_nullable
              as bool,
      options: options == freezed
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$PostStatusPollCopyWith<$Res>
    implements $PostStatusPollCopyWith<$Res> {
  factory _$PostStatusPollCopyWith(
          _PostStatusPoll value, $Res Function(_PostStatusPoll) then) =
      __$PostStatusPollCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'duration_length') Duration? durationLength,
      @JsonKey(name: 'hide_totals') bool hideTotals,
      bool multiple,
      List<String> options});
}

/// @nodoc
class __$PostStatusPollCopyWithImpl<$Res>
    extends _$PostStatusPollCopyWithImpl<$Res>
    implements _$PostStatusPollCopyWith<$Res> {
  __$PostStatusPollCopyWithImpl(
      _PostStatusPoll _value, $Res Function(_PostStatusPoll) _then)
      : super(_value, (v) => _then(v as _PostStatusPoll));

  @override
  _PostStatusPoll get _value => super._value as _PostStatusPoll;

  @override
  $Res call({
    Object? durationLength = freezed,
    Object? hideTotals = freezed,
    Object? multiple = freezed,
    Object? options = freezed,
  }) {
    return _then(_PostStatusPoll(
      durationLength: durationLength == freezed
          ? _value.durationLength
          : durationLength // ignore: cast_nullable_to_non_nullable
              as Duration?,
      hideTotals: hideTotals == freezed
          ? _value.hideTotals
          : hideTotals // ignore: cast_nullable_to_non_nullable
              as bool,
      multiple: multiple == freezed
          ? _value.multiple
          : multiple // ignore: cast_nullable_to_non_nullable
              as bool,
      options: options == freezed
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostStatusPoll
    with DiagnosticableTreeMixin
    implements _PostStatusPoll {
  const _$_PostStatusPoll(
      {@JsonKey(name: 'duration_length') required this.durationLength,
      @JsonKey(name: 'hide_totals') required this.hideTotals,
      required this.multiple,
      required this.options});

  factory _$_PostStatusPoll.fromJson(Map<String, dynamic> json) =>
      _$$_PostStatusPollFromJson(json);

  @override
  @JsonKey(name: 'duration_length')
  final Duration? durationLength;
  @override
  @JsonKey(name: 'hide_totals')
  final bool hideTotals;
  @override
  final bool multiple;
  @override
  final List<String> options;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostStatusPoll(durationLength: $durationLength, hideTotals: $hideTotals, multiple: $multiple, options: $options)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostStatusPoll'))
      ..add(DiagnosticsProperty('durationLength', durationLength))
      ..add(DiagnosticsProperty('hideTotals', hideTotals))
      ..add(DiagnosticsProperty('multiple', multiple))
      ..add(DiagnosticsProperty('options', options));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PostStatusPoll &&
            (identical(other.durationLength, durationLength) ||
                const DeepCollectionEquality()
                    .equals(other.durationLength, durationLength)) &&
            (identical(other.hideTotals, hideTotals) ||
                const DeepCollectionEquality()
                    .equals(other.hideTotals, hideTotals)) &&
            (identical(other.multiple, multiple) ||
                const DeepCollectionEquality()
                    .equals(other.multiple, multiple)) &&
            (identical(other.options, options) ||
                const DeepCollectionEquality().equals(other.options, options)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(durationLength) ^
      const DeepCollectionEquality().hash(hideTotals) ^
      const DeepCollectionEquality().hash(multiple) ^
      const DeepCollectionEquality().hash(options);

  @JsonKey(ignore: true)
  @override
  _$PostStatusPollCopyWith<_PostStatusPoll> get copyWith =>
      __$PostStatusPollCopyWithImpl<_PostStatusPoll>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostStatusPollToJson(this);
  }
}

abstract class _PostStatusPoll implements PostStatusPoll {
  const factory _PostStatusPoll(
      {@JsonKey(name: 'duration_length') required Duration? durationLength,
      @JsonKey(name: 'hide_totals') required bool hideTotals,
      required bool multiple,
      required List<String> options}) = _$_PostStatusPoll;

  factory _PostStatusPoll.fromJson(Map<String, dynamic> json) =
      _$_PostStatusPoll.fromJson;

  @override
  @JsonKey(name: 'duration_length')
  Duration? get durationLength => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'hide_totals')
  bool get hideTotals => throw _privateConstructorUsedError;
  @override
  bool get multiple => throw _privateConstructorUsedError;
  @override
  List<String> get options => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PostStatusPollCopyWith<_PostStatusPoll> get copyWith =>
      throw _privateConstructorUsedError;
}
