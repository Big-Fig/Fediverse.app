import 'package:fediverse_api/fediverse_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../pleroma_api_model.dart';

part 'pleroma_api_media_attachment_type_sealed.freezed.dart';

@freezed
class PleromaApiMediaAttachmentType
    with _$PleromaApiMediaAttachmentType
    implements IPleromaApiUnion {
  static const imageStringValue =
      MastodonApiMediaAttachmentType.imageStringValue;
  static const gifvStringValue = MastodonApiMediaAttachmentType.gifvStringValue;
  static const videoStringValue =
      MastodonApiMediaAttachmentType.videoStringValue;
  static const audioStringValue =
      MastodonApiMediaAttachmentType.audioStringValue;

  static const imageValue = PleromaApiMediaAttachmentType.image();
  static const gifvValue = PleromaApiMediaAttachmentType.gifv();
  static const videoValue = PleromaApiMediaAttachmentType.video();
  static const audioValue = PleromaApiMediaAttachmentType.audio();

  static const values = [
    imageValue,
    gifvValue,
    videoValue,
    audioValue,
  ];

  const factory PleromaApiMediaAttachmentType.image({
    @Default(PleromaApiMediaAttachmentType.imageStringValue) String stringValue,
  }) = _Image;

  const factory PleromaApiMediaAttachmentType.gifv({
    @Default(PleromaApiMediaAttachmentType.gifvStringValue) String stringValue,
  }) = _Gifv;

  const factory PleromaApiMediaAttachmentType.video({
    @Default(PleromaApiMediaAttachmentType.videoStringValue) String stringValue,
  }) = _Video;

  const factory PleromaApiMediaAttachmentType.audio({
    @Default(PleromaApiMediaAttachmentType.audioStringValue) String stringValue,
  }) = _Audio;

  const factory PleromaApiMediaAttachmentType.unknown({
    required String stringValue,
  }) = _Unknown;

  static final stringValuesMap =
      IFediverseApiUnionHelper.calculateStringValuesMap(values);

  static PleromaApiMediaAttachmentType fromStringValue(
    String stringValue,
  ) =>
      IFediverseApiUnionHelper.findByStringValue(
        stringValuesMap,
        stringValue,
        defaultValueCreator: (stringValue) =>
            PleromaApiMediaAttachmentType.unknown(
          stringValue: stringValue,
        ),
      );
}

extension PleromaApiMediaAttachmentTypeStringExtension on String {
  PleromaApiMediaAttachmentType toPleromaApiMediaAttachmentType() =>
      PleromaApiMediaAttachmentType.fromStringValue(this);
}

extension PleromaApiMediaAttachmentTypeStringListExtension on List<String> {
  List<PleromaApiMediaAttachmentType> toPleromaApiMediaAttachmentTypeList() =>
      map((stringValue) => stringValue.toPleromaApiMediaAttachmentType())
          .toList();
}

extension PleromaApiMediaAttachmentTypeHelperExtension
    on PleromaApiMediaAttachmentType {
  bool get isImage => this == PleromaApiMediaAttachmentType.imageValue;

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

extension PleromaApiMediaAttachmentTypePleromaExtension
    on PleromaApiMediaAttachmentType {
  PleromaApiMediaAttachmentType toPleromaApiMediaAttachmentType() =>
      PleromaApiMediaAttachmentType.fromStringValue(stringValue);
}

extension PleromaApiMediaAttachmentTypeStringPleromaExtension
    on List<PleromaApiMediaAttachmentType> {
  List<PleromaApiMediaAttachmentType> toPleromaApiMediaAttachmentTypeList() =>
      map((stringValue) => stringValue.toPleromaApiMediaAttachmentType())
          .toList();
}
