import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/pleroma/api/captcha/native/pleroma_api_native_captcha_image_extension.dart';
import 'package:fedi/pleroma/api/captcha/pleroma_api_captcha_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICaptchaStringValueFormFieldBloc
    extends IStringValueFormFieldBloc {
  static ICaptchaStringValueFormFieldBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ICaptchaStringValueFormFieldBloc>(context, listen: listen);

  bool get isLoading;

  Stream<bool> get isLoadingStream;

  bool? get isDisabledOnServerSide;

  Stream<bool?> get isDisabledOnServerSideStream;

  dynamic get captchaLoadingError;

  Stream<dynamic> get captchaLoadingErrorStream;

  PleromaApiCaptcha? get captcha;

  Stream<PleromaApiCaptcha?> get captchaStream;

  Future reloadCaptcha();

  DateTime? get captchaLoadedDateTime;

  Stream<DateTime?> get captchaLoadedDateTimeStream;
}

extension ICaptchaStringValueFormFieldBlocExtension
    on ICaptchaStringValueFormFieldBloc {
  bool get isHaveCaptchaLoadingError => captchaLoadingError != null;

  Stream<bool> get isHaveCaptchaLoadingErrorStream =>
      captchaLoadingErrorStream.map(
        (captchaLoadingError) => captchaLoadingError != null,
      );

  PleromaApiCaptchaType? get captchaType => captcha?.typeAsPleromaApi;

  Stream<PleromaApiCaptchaType?> get captchaTypeStream => captchaStream.map(
        (captcha) => captcha?.typeAsPleromaApi,
      );

  Stream<Image?> get captchaImageStream => captchaStream.asyncMap(
        (captcha) async {
          switch (captcha?.typeAsPleromaApi) {
            case PleromaApiCaptchaType.kocaptcha:
            case PleromaApiCaptchaType.unknown:
              return Image.network(captcha!.url!);
            case PleromaApiCaptchaType.native:
              return captcha!.decodeUrlAsBase64Image();
            default:
              return null;
          }
        },
      );
}
