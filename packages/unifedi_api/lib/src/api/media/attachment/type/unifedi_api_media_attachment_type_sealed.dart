import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../unifedi_api_model.dart';

part 'unifedi_api_media_attachment_type_sealed.freezed.dart';

@freezed
class UnifediApiMediaAttachmentType
    with _$UnifediApiMediaAttachmentType
    implements IUnifediApiUnion {
  static const imageStringValue = 'image';
  static const gifvStringValue = 'gifv';
  static const videoStringValue = 'video';
  static const audioStringValue = 'audio';

  static const imageValue = UnifediApiMediaAttachmentType.image();
  static const gifvValue = UnifediApiMediaAttachmentType.gifv();
  static const videoValue = UnifediApiMediaAttachmentType.video();
  static const audioValue = UnifediApiMediaAttachmentType.audio();

  static const values = [
    imageValue,
    gifvValue,
    videoValue,
    audioValue,
  ];

  const factory UnifediApiMediaAttachmentType.image({
    @Default(UnifediApiMediaAttachmentType.imageStringValue) String stringValue,
  }) = _Image;

  const factory UnifediApiMediaAttachmentType.gifv({
    @Default(UnifediApiMediaAttachmentType.gifvStringValue) String stringValue,
  }) = _Gifv;

  const factory UnifediApiMediaAttachmentType.video({
    @Default(UnifediApiMediaAttachmentType.videoStringValue) String stringValue,
  }) = _Video;

  const factory UnifediApiMediaAttachmentType.audio({
    @Default(UnifediApiMediaAttachmentType.audioStringValue) String stringValue,
  }) = _Audio;

  const factory UnifediApiMediaAttachmentType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static UnifediApiMediaAttachmentType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) =>
            UnifediApiMediaAttachmentType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension UnifediApiMediaAttachmentTypeStringExtension on String {
  UnifediApiMediaAttachmentType toUnifediApiMediaAttachmentType() =>
      UnifediApiMediaAttachmentType.fromStringValue(this);
}

extension UnifediApiMediaAttachmentTypeStringListExtension on List<String> {
  List<UnifediApiMediaAttachmentType> toUnifediApiMediaAttachmentTypeList() =>
      map((stringValue) => stringValue.toUnifediApiMediaAttachmentType())
          .toList();
}

extension UnifediApiMediaAttachmentTypeHelperExtension
    on UnifediApiMediaAttachmentType {
  bool get isImage => this == UnifediApiMediaAttachmentType.imageValue;

  bool get isMedia => map(
        // ignore: no-equal-arguments
        image: (_) => true,
        // ignore: no-equal-arguments
        gifv: (_) => true,
        // ignore: no-equal-arguments
        video: (_) => true,
        // ignore: no-equal-arguments
        audio: (_) => true,
        // ignore: no-equal-arguments
        unknown: (_) => false,
      );

  bool get isImageOrGif => map(
        // ignore: no-equal-arguments
        image: (_) => true,
        // ignore: no-equal-arguments
        gifv: (_) => true,
        // ignore: no-equal-arguments
        video: (_) => false,
        // ignore: no-equal-arguments
        audio: (_) => false,
        // ignore: no-equal-arguments
        unknown: (_) => false,
      );
}

extension UnifediApiMediaAttachmentTypeMastodonExtension
    on UnifediApiMediaAttachmentType {
  MastodonApiMediaAttachmentType toMastodonApiMediaAttachmentType() =>
      MastodonApiMediaAttachmentType.fromStringValue(stringValue);
}

extension UnifediApiMediaAttachmentTypeStringMastodonExtension
    on List<UnifediApiMediaAttachmentType> {
  List<MastodonApiMediaAttachmentType> toMastodonApiMediaAttachmentTypeList() =>
      map((stringValue) => stringValue.toMastodonApiMediaAttachmentType())
          .toList();
}
