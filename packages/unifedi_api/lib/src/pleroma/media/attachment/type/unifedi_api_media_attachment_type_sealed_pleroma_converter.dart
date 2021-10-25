import 'package:pleroma_api/pleroma_api.dart';
import '../../../../api/media/attachment/type/unifedi_api_media_attachment_type_sealed.dart';
import '../../../../converter/sealed_converter.dart';

const _converter = UnifediApiMediaAttachmentTypePleromaConverter();

class UnifediApiMediaAttachmentTypePleromaConverter
    implements
        SealedConverter<UnifediApiMediaAttachmentType,
            PleromaApiMediaAttachmentType> {
  const UnifediApiMediaAttachmentTypePleromaConverter();

  @override
  UnifediApiMediaAttachmentType convertFrom(
    PleromaApiMediaAttachmentType item,
  ) =>
      item.map(
        image: (_) => UnifediApiMediaAttachmentType.imageValue,
        gifv: (_) => UnifediApiMediaAttachmentType.gifvValue,
        video: (_) => UnifediApiMediaAttachmentType.videoValue,
        audio: (_) => UnifediApiMediaAttachmentType.audioValue,
        unknown: (value) => UnifediApiMediaAttachmentType.unknown(
          stringValue: value.stringValue,
        ),
      );

  @override
  PleromaApiMediaAttachmentType convertTo(
    UnifediApiMediaAttachmentType item,
  ) =>
      item.map(
        image: (_) => PleromaApiMediaAttachmentType.imageValue,
        gifv: (_) => PleromaApiMediaAttachmentType.gifvValue,
        video: (_) => PleromaApiMediaAttachmentType.videoValue,
        audio: (_) => PleromaApiMediaAttachmentType.audioValue,
        unknown: (value) => PleromaApiMediaAttachmentType.unknown(
          stringValue: value.stringValue,
        ),
      );
}

extension PleromaApiMediaAttachmentTypeUnifediExtension
    on PleromaApiMediaAttachmentType {
  UnifediApiMediaAttachmentType toUnifediApiMediaAttachmentType() =>
      _converter.convertFrom(this);
}

extension UnifediApiMediaAttachmentTypePleromaExtension
    on UnifediApiMediaAttachmentType {
  PleromaApiMediaAttachmentType toPleromaApiMediaAttachmentType() =>
      _converter.convertTo(this);
}
