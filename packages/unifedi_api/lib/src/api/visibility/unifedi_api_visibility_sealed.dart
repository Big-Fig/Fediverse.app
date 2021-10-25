import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../unifedi_api_model.dart';

part 'unifedi_api_visibility_sealed.freezed.dart';

@freezed
class UnifediApiVisibility
    with _$UnifediApiVisibility
    implements IUnifediApiUnion {
  static const publicStringValue = 'public';
  static const unlistedStringValue = 'unlisted';
  static const directStringValue = 'direct';
  static const privateStringValue = 'private';
  static const listStringValue = 'list';
  static const localStringValue = 'local';

  static const publicValue = UnifediApiVisibility.public();
  static const unlistedValue = UnifediApiVisibility.unlisted();
  static const directValue = UnifediApiVisibility.direct();
  static const privateValue = UnifediApiVisibility.private();
  static const listValue = UnifediApiVisibility.list();
  static const localValue = UnifediApiVisibility.local();

  static const values = [
    publicValue,
    unlistedValue,
    directValue,
    privateValue,
    listValue,
    localValue,
  ];

  const factory UnifediApiVisibility.public({
    @Default(UnifediApiVisibility.publicStringValue) String stringValue,
  }) = _Public;

  const factory UnifediApiVisibility.unlisted({
    @Default(UnifediApiVisibility.unlistedStringValue) String stringValue,
  }) = _Unlisted;

  const factory UnifediApiVisibility.direct({
    @Default(UnifediApiVisibility.directStringValue) String stringValue,
  }) = _Direct;

  const factory UnifediApiVisibility.private({
    @Default(UnifediApiVisibility.privateStringValue) String stringValue,
  }) = _Private;

  const factory UnifediApiVisibility.list({
    @Default(UnifediApiVisibility.listStringValue) String stringValue,
  }) = _List;

  const factory UnifediApiVisibility.local({
    @Default(UnifediApiVisibility.localStringValue) String stringValue,
  }) = _Local;

  const factory UnifediApiVisibility.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static UnifediApiVisibility fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) => UnifediApiVisibility.unknown(
          stringValue: stringValue,
        ),
      );
}

extension UnifediApiVisibilityStringExtension on String {
  UnifediApiVisibility toUnifediApiVisibility() =>
      UnifediApiVisibility.fromStringValue(this);
}

extension UnifediApiVisibilityStringListExtension on List<String> {
  List<UnifediApiVisibility> toUnifediApiVisibilityList() =>
      map((stringValue) => stringValue.toUnifediApiVisibility()).toList();
}
