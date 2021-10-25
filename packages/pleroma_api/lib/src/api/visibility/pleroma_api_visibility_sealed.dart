import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../pleroma_api_model.dart';

part 'pleroma_api_visibility_sealed.freezed.dart';

@freezed
class PleromaApiVisibility
    with _$PleromaApiVisibility
    implements IPleromaApiUnion {
  static const publicStringValue = MastodonApiVisibility.publicStringValue;
  static const unlistedStringValue = MastodonApiVisibility.unlistedStringValue;
  static const directStringValue = MastodonApiVisibility.directStringValue;
  static const privateStringValue = MastodonApiVisibility.privateStringValue;
  static const listStringValue = 'list';
  static const localStringValue = 'local';

  static const publicValue = PleromaApiVisibility.public();
  static const unlistedValue = PleromaApiVisibility.unlisted();
  static const directValue = PleromaApiVisibility.direct();
  static const privateValue = PleromaApiVisibility.private();
  static const listValue = PleromaApiVisibility.list();
  static const localValue = PleromaApiVisibility.local();

  static const values = [
    publicValue,
    unlistedValue,
    directValue,
    privateValue,
    listValue,
    localValue,
  ];

  const factory PleromaApiVisibility.public({
    @Default(PleromaApiVisibility.publicStringValue) String stringValue,
  }) = _Public;

  const factory PleromaApiVisibility.unlisted({
    @Default(PleromaApiVisibility.unlistedStringValue) String stringValue,
  }) = _Unlisted;

  const factory PleromaApiVisibility.direct({
    @Default(PleromaApiVisibility.directStringValue) String stringValue,
  }) = _Direct;

  const factory PleromaApiVisibility.private({
    @Default(PleromaApiVisibility.privateStringValue) String stringValue,
  }) = _Private;

  const factory PleromaApiVisibility.list({
    @Default(PleromaApiVisibility.listStringValue) String stringValue,
  }) = _List;

  const factory PleromaApiVisibility.local({
    @Default(PleromaApiVisibility.localStringValue) String stringValue,
  }) = _Local;

  const factory PleromaApiVisibility.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static PleromaApiVisibility fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) => PleromaApiVisibility.unknown(
          stringValue: stringValue,
        ),
      );

  static List<PleromaApiVisibility>
      calculatePossibleExcludeVisibilitiesValues() => [
            PleromaApiVisibility.publicValue,
            PleromaApiVisibility.unlistedValue,
            PleromaApiVisibility.privateValue,
            PleromaApiVisibility.directValue,
          ];
}

extension PleromaApiVisibilityStringExtension on String {
  PleromaApiVisibility toPleromaApiVisibility() =>
      PleromaApiVisibility.fromStringValue(this);
}

extension PleromaApiVisibilityStringListExtension on List<String> {
  List<PleromaApiVisibility> toPleromaApiVisibilityList() =>
      map((stringValue) => stringValue.toPleromaApiVisibility()).toList();
}
