import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

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

  UnifediApiCaptcha? get captcha;

  Stream<UnifediApiCaptcha?> get captchaStream;

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

  UnifediApiCaptchaType? get captchaType => captcha?.typeAsUnifediApi;

  Stream<UnifediApiCaptchaType?> get captchaTypeStream => captchaStream.map(
        (captcha) => captcha?.typeAsUnifediApi,
      );

  Stream<Image?> get captchaImageStream => captchaStream.asyncMap(
        (captcha) async => captcha?.typeAsUnifediApi.map(
          native: (_) => Image.memory(captcha.decodeUrlAsBase64ImageBytes()),
          kocaptcha: (_) => Image.network(captcha.url!),
          none: (_) => null,
          // ignore: no-equal-arguments
          unknown: (_) => Image.network(captcha.url!),
        ),
      );
}
