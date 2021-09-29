import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/captcha/captcha_string_value_form_field_bloc.dart';
import 'package:fedi/app/captcha/pleroma/pleroma_form_captcha_string_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

// ignore: no-magic-number
const checkCaptchaExpiredDuration = Duration(seconds: 5);

final _logger = Logger('pleroma_form_captcha_string_field_bloc_impl.dart');

class PleromaFormCaptchaStringFieldBloc extends StringValueFormFieldBloc
    implements IPleromaFormCaptchaStringFieldBloc {
  final IUnifediApiInstanceService pleromaCaptchaService;

  final BehaviorSubject<bool> isLoadingSubject = BehaviorSubject.seeded(false);
  final BehaviorSubject<UnifediApiCaptcha?> captchaSubject = BehaviorSubject();
  final BehaviorSubject<dynamic> captchaLoadingErrorSubject = BehaviorSubject();
  final BehaviorSubject<DateTime?> captchaLoadedDateTimeSubject =
      BehaviorSubject();

  @override
  bool get isHaveAtLeastOneError => _calculateIsHaveAtLeastOneError(
        isLoading: isLoading,
        isHaveCaptchaLoadingError: isHaveCaptchaLoadingError,
        isDisabledOnServerSide: isDisabledOnServerSide,
        superIsHaveAtLeastOneError: super.isHaveAtLeastOneError,
      );

  @override
  Stream<bool> get isHaveAtLeastOneErrorStream => Rx.combineLatest4(
        super.isHaveAtLeastOneErrorStream,
        isLoadingStream,
        isHaveCaptchaLoadingErrorStream,
        isDisabledOnServerSideStream,
        (
          dynamic superIsHaveAtLeastOneError,
          dynamic isLoading,
          dynamic isHaveCaptchaLoadingError,
          dynamic isDisabledOnServerSide,
        ) =>
            _calculateIsHaveAtLeastOneError(
          isLoading: isLoading,
          isHaveCaptchaLoadingError: isHaveCaptchaLoadingError,
          isDisabledOnServerSide: isDisabledOnServerSide,
          superIsHaveAtLeastOneError: superIsHaveAtLeastOneError,
        ),
      );

  static bool _calculateIsHaveAtLeastOneError({
    required bool isLoading,
    required bool isHaveCaptchaLoadingError,
    required bool? isDisabledOnServerSide,
    required bool superIsHaveAtLeastOneError,
  }) {
    if (isLoading) {
      return true;
    }

    if (isHaveCaptchaLoadingError) {
      return true;
    }

    if (isDisabledOnServerSide!) {
      return false;
    }

    return superIsHaveAtLeastOneError;
  }

  @override
  List<ValueFormFieldValidationError> get errors => _calculateErrors(
        isDisabledOnServerSide: isDisabledOnServerSide,
        superErrors: super.errors,
      );

  @override
  Stream<List<ValueFormFieldValidationError>> get errorsStream =>
      Rx.combineLatest2(
        isDisabledOnServerSideStream,
        super.errorsStream,
        (
          bool? isDisabledOnServerSide,
          List<ValueFormFieldValidationError> superErrors,
        ) =>
            _calculateErrors(
          isDisabledOnServerSide: isDisabledOnServerSide,
          superErrors: super.errors,
        ),
      );

  static List<ValueFormFieldValidationError> _calculateErrors({
    required bool? isDisabledOnServerSide,
    required List<ValueFormFieldValidationError> superErrors,
  }) =>
      isDisabledOnServerSide == true ? [] : superErrors;

  @override
  UnifediApiCaptcha? get captcha => captchaSubject.value;

  @override
  Stream<UnifediApiCaptcha?> get captchaStream => captchaSubject.stream;

  @override
  DateTime? get captchaLoadedDateTime => captchaLoadedDateTimeSubject.value;

  @override
  Stream<DateTime?> get captchaLoadedDateTimeStream =>
      captchaLoadedDateTimeSubject.stream;

  @override
  bool get isLoading => isLoadingSubject.value;

  @override
  Stream<bool> get isLoadingStream => isLoadingSubject.stream;

  @override
  dynamic get captchaLoadingError => captchaLoadingErrorSubject.valueOrNull;

  @override
  Stream<dynamic> get captchaLoadingErrorStream =>
      captchaLoadingErrorSubject.stream;

  @override
  bool? get isDisabledOnServerSide => _calculateIsDisabledOnServerSide(captcha);

  @override
  Stream<bool?> get isDisabledOnServerSideStream =>
      captchaStream.map(_calculateIsDisabledOnServerSide);

  static bool _calculateIsDisabledOnServerSide(UnifediApiCaptcha? captcha) =>
      captcha?.typeAsUnifediApi == UnifediApiCaptchaType.noneValue;

  PleromaFormCaptchaStringFieldBloc({
    required this.pleromaCaptchaService,
    required String originValue,
    required List<FormValueFieldValidation<String>> validators,
  }) : super(
          originValue: originValue,
          validators: validators,
          maxLength: null,
        ) {
    isLoadingSubject.disposeWith(this);
    captchaLoadingErrorSubject.disposeWith(this);
    captchaSubject.disposeWith(this);
    captchaLoadedDateTimeSubject.disposeWith(this);
    Timer.periodic(
      checkCaptchaExpiredDuration,
      (timer) {
        _checkForReload();
      },
    ).disposeWith(this);

    // init load
    reloadCaptcha();
  }

  void _checkForReload() {
    if (isDisabledOnServerSide == true) {
      return;
    }

    if (isHaveCaptchaLoadingError) {
      reloadCaptcha();
    } else {
      if (captchaLoadedDateTime == null) {
        reloadCaptcha();
      } else {
        var difference = captchaLoadedDateTime!.difference(
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
        _logger.finest(() => '_checkForReload '
            'isNeedReload $isNeedReload '
            'totalSeconds $totalSeconds '
            'secondsValid $secondsValid');
        if (isNeedReload) {
          reloadCaptcha();
        }
      }
    }
  }

  @override
  Future reloadCaptcha() async {
    _logger.finest(
      () => 'reloadCaptcha START isLoading $isLoading',
    );

    if (isLoading) {
      return;
    }
    isLoadingSubject.add(true);

    captchaLoadedDateTimeSubject.add(null);
    captchaSubject.add(null);
    clear();
    captchaLoadingErrorSubject.add(null);
    try {
      var captcha = await pleromaCaptchaService.getCaptcha();
      if (!captchaLoadedDateTimeSubject.isClosed) {
        captchaLoadedDateTimeSubject.add(DateTime.now());
      }

      if (!captchaSubject.isClosed) {
        captchaSubject.add(captcha.toUnifediApiCaptcha());
      }
      _logger.finest(() => 'reloadCaptcha FINISH $captcha');
    } catch (e, stackTrace) {
      _logger.warning(() => 'reloadCaptcha ERROR', e, stackTrace);
      if (!captchaLoadingErrorSubject.isClosed) {
        captchaLoadingErrorSubject.add(e);
      }
    } finally {
      isLoadingSubject.add(false);
    }
  }
}
