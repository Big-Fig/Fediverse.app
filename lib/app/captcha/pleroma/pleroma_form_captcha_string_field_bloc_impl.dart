import 'dart:async';
import 'dart:io';

import 'package:fedi/app/captcha/pleroma/pleroma_form_captcha_string_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:fedi/pleroma/captcha/native/pleroma_native_captcha_image_extension.dart';
import 'package:fedi/pleroma/captcha/pleroma_captcha_model.dart';
import 'package:fedi/pleroma/captcha/pleroma_captcha_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

final checkCaptchaExpiredDuration = Duration(seconds: 5);

final _logger = Logger("pleroma_form_captcha_string_field_bloc_impl.dart");

class PleromaFormCaptchaStringFieldBloc extends StringValueFormFieldBloc
    implements IPleromaFormCaptchaStringFieldBloc {
  final IPleromaCaptchaService pleromaCaptchaService;

  final BehaviorSubject<PleromaCaptcha> captchaSubject;
  final BehaviorSubject<dynamic> errorSubject;

  @override
  bool get isHaveAtLeastOneError => isExist && super.isHaveAtLeastOneError;

  @override
  Stream<bool> get isHaveAtLeastOneErrorStream => Rx.combineLatest2(
        super.isHaveAtLeastOneErrorStream,
        isExistStream,
        (isHaveAtLeastOneError, isExist) =>
            isExist && super.isHaveAtLeastOneError,
      );

  @override
  bool get isSomethingChanged => isExist && super.isSomethingChanged;

  @override
  Stream<bool> get isSomethingChangedStream => Rx.combineLatest2(
        isExistStream,
        super.isSomethingChangedStream,
        (isExist, isSomethingChanged) => isExist && isSomethingChanged,
      );

  @override
  List<ValueFormFieldValidationError> get errors =>
      isExist ? super.errors : null;

  @override
  Stream<List<ValueFormFieldValidationError>> get errorsStream =>
      Rx.combineLatest2(
        isExistStream,
        super.errorsStream,
        (isExist, errors) => isExist ? errors : null,
      );

  @override
  PleromaCaptcha get captcha => captchaSubject.value;

  @override
  Stream<PleromaCaptcha> get captchaStream => captchaSubject.stream;

  final BehaviorSubject<DateTime> captchaLoadedDateTimeSubject;

  @override
  DateTime get captchaLoadedDateTime => captchaLoadedDateTimeSubject.value;

  @override
  Stream<DateTime> get captchaLoadedDateTimeStream =>
      captchaLoadedDateTimeSubject.stream;

  PleromaFormCaptchaStringFieldBloc({
    @required this.pleromaCaptchaService,
    @required String originValue,
    @required List<FormValueFieldValidation<String>> validators,
  })  : captchaSubject = BehaviorSubject(),
        errorSubject = BehaviorSubject(),
        captchaLoadedDateTimeSubject = BehaviorSubject(),
        super(
          originValue: originValue,
          validators: validators,
          maxLength: null,
        ) {
    addDisposable(subject: errorSubject);
    addDisposable(subject: captchaSubject);
    addDisposable(subject: captchaLoadedDateTimeSubject);
    addDisposable(
      timer: Timer.periodic(
        checkCaptchaExpiredDuration,
        (timer) {
          _checkForReload();
        },
      ),
    );

    // init load
    reloadCaptcha();
  }

  void _checkForReload() {
    _logger.finest(() => "_checkForReload isExist $isExist");
    if (isExist) {
      var difference = captchaLoadedDateTime.difference(
        DateTime.now(),
      );
      var differenceAbs = difference.abs();
      var differenceAbsInSeconds = differenceAbs.inSeconds;
      var checkCaptchaExpiredDurationInSeconds =
          checkCaptchaExpiredDuration.inSeconds;
      var totalSeconds =
          differenceAbsInSeconds + checkCaptchaExpiredDurationInSeconds;
      var secondsValid = captcha?.secondsValid;
      var isNeedReload = secondsValid == null || totalSeconds > secondsValid;
      _logger.finest(() => "_checkForReload "
          "isNeedReload $isNeedReload "
          "totalSeconds $totalSeconds "
          "secondsValid $secondsValid");
      if (isNeedReload) {
        reloadCaptcha();
      }
    }
  }

  @override
  Stream<Image> get captchaImageStream => captchaStream.asyncMap(
        (captcha) async {
          switch (captcha?.pleromaType) {
            case PleromaCaptchaType.kocaptcha:
            case PleromaCaptchaType.unknown:
              return Image.network(captcha.url);
              break;
            case PleromaCaptchaType.native:
              return captcha.decodeUrlAsBase64Image();
              break;
            default:
              return null;
          }
        },
      );

  @override
  Future reloadCaptcha() async {
    _logger.finest(() => "reloadCaptcha START");
    captchaSubject.add(null);
    captchaLoadedDateTimeSubject.add(DateTime.now());
    errorSubject.add(null);
    try {
      var captcha = await pleromaCaptchaService.getCaptcha();
      captchaSubject.add(captcha);
      _logger.finest(() => "reloadCaptcha FINISH $captcha");
    } catch (e, stackTrace) {
      _logger.warning(() => "reloadCaptcha ERROR", e, stackTrace);
      errorSubject.add(e);
    }
  }

  @override
  PleromaCaptchaType get captchaType => captcha?.pleromaType;

  @override
  Stream<PleromaCaptchaType> get captchaTypeStream => captchaStream.map(
        (captcha) => captcha?.pleromaType,
      );

  @override
  bool get isExist => _calculateIsExist(captcha, errorSubject.value);

  @override
  Stream<bool> get isExistStream => Rx.combineLatest2(
        captchaStream,
        errorSubject.stream,
        (captcha, error) => _calculateIsExist(
          captcha,
          error,
        ),
      );

  bool _calculateIsExist(PleromaCaptcha captcha, error) {
    var isExist;
    if (captcha != null) {
      if (captcha.pleromaType == PleromaCaptchaType.none) {
        isExist = false;
      } else {
        isExist = true;
      }
    } else {
      if (error != null) {
        if (error is SocketException) {
          isExist = true;
        } else {
          isExist = false;
        }
      } else {
        isExist = true;
      }
    }

    _logger.finest(() => "isExist $isExist captcha $captcha error $error");

    return isExist;
  }
}
