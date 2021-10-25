// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pleroma_api_frontend_configurations_masto_fe_model_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PleromaApiFrontendConfigurationsMastoFe
    _$PleromaApiFrontendConfigurationsMastoFeFromJson(
        Map<String, dynamic> json) {
  return _PleromaApiFrontendConfigurationsMastoFe.fromJson(json);
}

/// @nodoc
class _$PleromaApiFrontendConfigurationsMastoFeTearOff {
  const _$PleromaApiFrontendConfigurationsMastoFeTearOff();

  _PleromaApiFrontendConfigurationsMastoFe call(
      {@JsonKey(name: 'show_instance_specific_panel')
      @HiveField(0)
          required bool? showInstanceSpecificPanel}) {
    return _PleromaApiFrontendConfigurationsMastoFe(
      showInstanceSpecificPanel: showInstanceSpecificPanel,
    );
  }

  PleromaApiFrontendConfigurationsMastoFe fromJson(Map<String, Object> json) {
    return PleromaApiFrontendConfigurationsMastoFe.fromJson(json);
  }
}

/// @nodoc
const $PleromaApiFrontendConfigurationsMastoFe =
    _$PleromaApiFrontendConfigurationsMastoFeTearOff();

/// @nodoc
mixin _$PleromaApiFrontendConfigurationsMastoFe {
  @JsonKey(name: 'show_instance_specific_panel')
  @HiveField(0)
  bool? get showInstanceSpecificPanel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PleromaApiFrontendConfigurationsMastoFeCopyWith<
          PleromaApiFrontendConfigurationsMastoFe>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PleromaApiFrontendConfigurationsMastoFeCopyWith<$Res> {
  factory $PleromaApiFrontendConfigurationsMastoFeCopyWith(
          PleromaApiFrontendConfigurationsMastoFe value,
          $Res Function(PleromaApiFrontendConfigurationsMastoFe) then) =
      _$PleromaApiFrontendConfigurationsMastoFeCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'show_instance_specific_panel')
      @HiveField(0)
          bool? showInstanceSpecificPanel});
}

/// @nodoc
class _$PleromaApiFrontendConfigurationsMastoFeCopyWithImpl<$Res>
    implements $PleromaApiFrontendConfigurationsMastoFeCopyWith<$Res> {
  _$PleromaApiFrontendConfigurationsMastoFeCopyWithImpl(
      this._value, this._then);

  final PleromaApiFrontendConfigurationsMastoFe _value;
  // ignore: unused_field
  final $Res Function(PleromaApiFrontendConfigurationsMastoFe) _then;

  @override
  $Res call({
    Object? showInstanceSpecificPanel = freezed,
  }) {
    return _then(_value.copyWith(
      showInstanceSpecificPanel: showInstanceSpecificPanel == freezed
          ? _value.showInstanceSpecificPanel
          : showInstanceSpecificPanel // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$PleromaApiFrontendConfigurationsMastoFeCopyWith<$Res>
    implements $PleromaApiFrontendConfigurationsMastoFeCopyWith<$Res> {
  factory _$PleromaApiFrontendConfigurationsMastoFeCopyWith(
          _PleromaApiFrontendConfigurationsMastoFe value,
          $Res Function(_PleromaApiFrontendConfigurationsMastoFe) then) =
      __$PleromaApiFrontendConfigurationsMastoFeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'show_instance_specific_panel')
      @HiveField(0)
          bool? showInstanceSpecificPanel});
}

/// @nodoc
class __$PleromaApiFrontendConfigurationsMastoFeCopyWithImpl<$Res>
    extends _$PleromaApiFrontendConfigurationsMastoFeCopyWithImpl<$Res>
    implements _$PleromaApiFrontendConfigurationsMastoFeCopyWith<$Res> {
  __$PleromaApiFrontendConfigurationsMastoFeCopyWithImpl(
      _PleromaApiFrontendConfigurationsMastoFe _value,
      $Res Function(_PleromaApiFrontendConfigurationsMastoFe) _then)
      : super(_value,
            (v) => _then(v as _PleromaApiFrontendConfigurationsMastoFe));

  @override
  _PleromaApiFrontendConfigurationsMastoFe get _value =>
      super._value as _PleromaApiFrontendConfigurationsMastoFe;

  @override
  $Res call({
    Object? showInstanceSpecificPanel = freezed,
  }) {
    return _then(_PleromaApiFrontendConfigurationsMastoFe(
      showInstanceSpecificPanel: showInstanceSpecificPanel == freezed
          ? _value.showInstanceSpecificPanel
          : showInstanceSpecificPanel // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PleromaApiFrontendConfigurationsMastoFe
    implements _PleromaApiFrontendConfigurationsMastoFe {
  const _$_PleromaApiFrontendConfigurationsMastoFe(
      {@JsonKey(name: 'show_instance_specific_panel')
      @HiveField(0)
          required this.showInstanceSpecificPanel});

  factory _$_PleromaApiFrontendConfigurationsMastoFe.fromJson(
          Map<String, dynamic> json) =>
      _$$_PleromaApiFrontendConfigurationsMastoFeFromJson(json);

  @override
  @JsonKey(name: 'show_instance_specific_panel')
  @HiveField(0)
  final bool? showInstanceSpecificPanel;

  @override
  String toString() {
    return 'PleromaApiFrontendConfigurationsMastoFe(showInstanceSpecificPanel: $showInstanceSpecificPanel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PleromaApiFrontendConfigurationsMastoFe &&
            (identical(other.showInstanceSpecificPanel,
                    showInstanceSpecificPanel) ||
                const DeepCollectionEquality().equals(
                    other.showInstanceSpecificPanel,
                    showInstanceSpecificPanel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(showInstanceSpecificPanel);

  @JsonKey(ignore: true)
  @override
  _$PleromaApiFrontendConfigurationsMastoFeCopyWith<
          _PleromaApiFrontendConfigurationsMastoFe>
      get copyWith => __$PleromaApiFrontendConfigurationsMastoFeCopyWithImpl<
          _PleromaApiFrontendConfigurationsMastoFe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PleromaApiFrontendConfigurationsMastoFeToJson(this);
  }
}

abstract class _PleromaApiFrontendConfigurationsMastoFe
    implements PleromaApiFrontendConfigurationsMastoFe {
  const factory _PleromaApiFrontendConfigurationsMastoFe(
          {@JsonKey(name: 'show_instance_specific_panel')
          @HiveField(0)
              required bool? showInstanceSpecificPanel}) =
      _$_PleromaApiFrontendConfigurationsMastoFe;

  factory _PleromaApiFrontendConfigurationsMastoFe.fromJson(
          Map<String, dynamic> json) =
      _$_PleromaApiFrontendConfigurationsMastoFe.fromJson;

  @override
  @JsonKey(name: 'show_instance_specific_panel')
  @HiveField(0)
  bool? get showInstanceSpecificPanel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PleromaApiFrontendConfigurationsMastoFeCopyWith<
          _PleromaApiFrontendConfigurationsMastoFe>
      get copyWith => throw _privateConstructorUsedError;
}
