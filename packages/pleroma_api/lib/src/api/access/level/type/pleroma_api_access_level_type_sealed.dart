import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../pleroma_api_model.dart';

part 'pleroma_api_access_level_type_sealed.freezed.dart';

// ignore_for_file: no-magic-number
@freezed
class PleromaApiAccessLevelType
    with _$PleromaApiAccessLevelType
    implements IPleromaApiUnion {
  static const publicLevelIntValue =
      FediverseApiAccessLevelType.publicLevelIntValue;
  static const applicationLevelIntValue =
      FediverseApiAccessLevelType.applicationLevelIntValue;
  static const userLevelIntValue =
      FediverseApiAccessLevelType.userLevelIntValue;

  static const publicLevelStringValue =
      FediverseApiAccessLevelType.publicLevelStringValue;
  static const applicationLevelStringValue =
      FediverseApiAccessLevelType.applicationLevelStringValue;
  static const userLevelStringValue =
      FediverseApiAccessLevelType.userLevelStringValue;

  static const publicValue = PleromaApiAccessLevelType.public();
  static const applicationValue = PleromaApiAccessLevelType.application();
  static const userValue = PleromaApiAccessLevelType.user();

  static const values = [
    publicValue,
    applicationValue,
    userValue,
  ];

  const factory PleromaApiAccessLevelType.public({
    @Default(PleromaApiAccessLevelType.publicLevelIntValue) int level,
    @Default(PleromaApiAccessLevelType.publicLevelStringValue)
        String stringValue,
  }) = _Public;

  const factory PleromaApiAccessLevelType.application({
    @Default(PleromaApiAccessLevelType.applicationLevelIntValue) int level,
    @Default(PleromaApiAccessLevelType.applicationLevelStringValue)
        String stringValue,
  }) = _Application;

  const factory PleromaApiAccessLevelType.user({
    @Default(PleromaApiAccessLevelType.userLevelIntValue) int level,
    @Default(PleromaApiAccessLevelType.userLevelStringValue) String stringValue,
  }) = _Valid;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static PleromaApiAccessLevelType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: null,
      );
}

extension PleromaApiAccessLevelTypeStringExtension on String {
  PleromaApiAccessLevelType toPleromaApiAccessLevelType() =>
      PleromaApiAccessLevelType.fromStringValue(this);
}
