import 'package:pleroma_api/pleroma_api.dart';
import '../../../api/card/type/unifedi_api_card_type_sealed.dart';
import '../../../converter/sealed_converter.dart';

const _converter = UnifediApiCardTypePleromaConverter();

class UnifediApiCardTypePleromaConverter
    implements SealedConverter<UnifediApiCardType, PleromaApiCardType> {
  const UnifediApiCardTypePleromaConverter();

  @override
  UnifediApiCardType convertFrom(
    PleromaApiCardType item,
  ) =>
      item.map(
        link: (_) => UnifediApiCardType.linkValue,
        photo: (_) => UnifediApiCardType.photoValue,
        video: (_) => UnifediApiCardType.videoValue,
        rich: (_) => UnifediApiCardType.richValue,
        unknown: (value) => UnifediApiCardType.unknown(
          stringValue: value.stringValue,
        ),
      );

  @override
  PleromaApiCardType convertTo(
    UnifediApiCardType item,
  ) =>
      item.map(
        link: (_) => PleromaApiCardType.linkValue,
        photo: (_) => PleromaApiCardType.photoValue,
        video: (_) => PleromaApiCardType.videoValue,
        rich: (_) => PleromaApiCardType.richValue,
        unknown: (value) => PleromaApiCardType.unknown(
          stringValue: value.stringValue,
        ),
      );
}

extension PleromaApiCardTypeUnifediExtension on PleromaApiCardType {
  UnifediApiCardType toUnifediApiCardType() => _converter.convertFrom(this);
}

extension UnifediApiCardTypePleromaExtension on UnifediApiCardType {
  PleromaApiCardType toPleromaApiCardType() => _converter.convertTo(this);
}
