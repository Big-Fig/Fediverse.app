import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../mastodon_api_model.dart';

part 'mastodon_api_media_attachment_type_sealed.freezed.dart';

@freezed
class MastodonApiMediaAttachmentType
    with _$MastodonApiMediaAttachmentType
    implements IMastodonApiUnion {
  static const imageStringValue = 'image';
  static const gifvStringValue = 'gifv';
  static const videoStringValue = 'video';
  static const audioStringValue = 'audio';

  static const imageValue = MastodonApiMediaAttachmentType.image();
  static const gifvValue = MastodonApiMediaAttachmentType.gifv();
  static const videoValue = MastodonApiMediaAttachmentType.video();
  static const audioValue = MastodonApiMediaAttachmentType.audio();

  static const values = [
    imageValue,
    gifvValue,
    videoValue,
    audioValue,
  ];

  const factory MastodonApiMediaAttachmentType.image({
    @Default(MastodonApiMediaAttachmentType.imageStringValue)
        String stringValue,
  }) = _Image;

  const factory MastodonApiMediaAttachmentType.gifv({
    @Default(MastodonApiMediaAttachmentType.gifvStringValue) String stringValue,
  }) = _Gifv;

  const factory MastodonApiMediaAttachmentType.video({
    @Default(MastodonApiMediaAttachmentType.videoStringValue)
        String stringValue,
  }) = _Video;

  const factory MastodonApiMediaAttachmentType.audio({
    @Default(MastodonApiMediaAttachmentType.audioStringValue)
        String stringValue,
  }) = _Audio;

  const factory MastodonApiMediaAttachmentType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static MastodonApiMediaAttachmentType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) =>
            MastodonApiMediaAttachmentType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension MastodonApiMediaAttachmentTypeStringExtension on String {
  MastodonApiMediaAttachmentType toMastodonApiMediaAttachmentType() =>
      MastodonApiMediaAttachmentType.fromStringValue(this);
}

extension MastodonApiMediaAttachmentTypeStringListExtension on List<String> {
  List<MastodonApiMediaAttachmentType> toMastodonApiMediaAttachmentTypeList() =>
      map((stringValue) => stringValue.toMastodonApiMediaAttachmentType())
          .toList();
}

extension MastodonApiMediaAttachmentTypeHelperExtension
    on MastodonApiMediaAttachmentType {
  bool get isImage => this == MastodonApiMediaAttachmentType.imageValue;

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
