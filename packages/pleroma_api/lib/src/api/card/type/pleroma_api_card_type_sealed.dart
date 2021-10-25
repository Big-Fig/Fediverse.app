import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../pleroma_api_model.dart';

part 'pleroma_api_card_type_sealed.freezed.dart';

@freezed
class PleromaApiCardType with _$PleromaApiCardType implements IPleromaApiUnion {
  static const linkStringValue = MastodonApiCardType.linkStringValue;
  static const photoStringValue = MastodonApiCardType.photoStringValue;
  static const videoStringValue = MastodonApiCardType.videoStringValue;
  static const richStringValue = MastodonApiCardType.richStringValue;

  static const linkValue = PleromaApiCardType.link();
  static const photoValue = PleromaApiCardType.photo();
  static const videoValue = PleromaApiCardType.video();
  static const richValue = PleromaApiCardType.rich();

  static const values = [
    linkValue,
    photoValue,
    videoValue,
    richValue,
  ];

  const factory PleromaApiCardType.link({
    @Default(PleromaApiCardType.linkStringValue) String stringValue,
  }) = _Link;

  const factory PleromaApiCardType.photo({
    @Default(PleromaApiCardType.photoStringValue) String stringValue,
  }) = _Photo;

  const factory PleromaApiCardType.video({
    @Default(PleromaApiCardType.videoStringValue) String stringValue,
  }) = _Video;

  const factory PleromaApiCardType.rich({
    @Default(PleromaApiCardType.richStringValue) String stringValue,
  }) = _Rich;

  const factory PleromaApiCardType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static PleromaApiCardType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) => PleromaApiCardType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension PleromaApiCardTypeStringExtension on String {
  PleromaApiCardType toPleromaApiCardType() =>
      PleromaApiCardType.fromStringValue(this);
}

extension PleromaApiCardTypeStringListExtension on List<String> {
  List<PleromaApiCardType> toPleromaApiCardTypeList() =>
      map((stringValue) => stringValue.toPleromaApiCardType()).toList();
}

extension PleromaApiCardTypeMastodonExtension on PleromaApiCardType {
  MastodonApiCardType toMastodonApiCardType() =>
      MastodonApiCardType.fromStringValue(stringValue);
}

extension PleromaApiCardTypeStringMastodonExtension
    on List<PleromaApiCardType> {
  List<MastodonApiCardType> toMastodonApiCardTypeList() =>
      map((stringValue) => stringValue.toMastodonApiCardType()).toList();
}
