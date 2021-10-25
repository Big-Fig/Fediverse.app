import 'package:pleroma_api/pleroma_api.dart';
import '../../../api/captcha/type/unifedi_api_captcha_type_sealed.dart';
import '../../../converter/sealed_converter.dart';

const _converter = UnifediApiCaptchaTypePleromaConverter();

class UnifediApiCaptchaTypePleromaConverter
    implements SealedConverter<UnifediApiCaptchaType, PleromaApiCaptchaType> {
  const UnifediApiCaptchaTypePleromaConverter();

  @override
  UnifediApiCaptchaType convertFrom(
    PleromaApiCaptchaType item,
  ) =>
      item.map(
        native: (_) => UnifediApiCaptchaType.nativeValue,
        kocaptcha: (_) => UnifediApiCaptchaType.kocaptchaValue,
        none: (_) => UnifediApiCaptchaType.noneValue,
        unknown: (value) => UnifediApiCaptchaType.unknown(
          stringValue: value.stringValue,
        ),
      );

  @override
  PleromaApiCaptchaType convertTo(
    UnifediApiCaptchaType item,
  ) =>
      item.map(
        native: (_) => PleromaApiCaptchaType.nativeValue,
        kocaptcha: (_) => PleromaApiCaptchaType.kocaptchaValue,
        none: (_) => PleromaApiCaptchaType.noneValue,
        unknown: (value) => PleromaApiCaptchaType.unknown(
          stringValue: value.stringValue,
        ),
      );
}

extension PleromaApiCaptchaTypeUnifediExtension on PleromaApiCaptchaType {
  UnifediApiCaptchaType toUnifediApiCaptchaType() =>
      _converter.convertFrom(this);
}

extension UnifediApiCaptchaTypePleromaExtension on UnifediApiCaptchaType {
  PleromaApiCaptchaType toPleromaApiCaptchaType() => _converter.convertTo(this);
}
