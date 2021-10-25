import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/captcha/register_access_form_captcha_stepper_item_bloc.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/register_access_form_stepper_item_bloc_impl.dart';
import 'package:fedi_app/app/access/register/form/stepper/item/register_access_form_stepper_item_model.dart';
import 'package:fedi_app/app/captcha/unifedi/unifedi_form_captcha_string_field_bloc.dart';
import 'package:fedi_app/app/captcha/unifedi/unifedi_form_captcha_string_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/string/validation/string_value_form_field_non_empty_validation.dart';
import 'package:fedi_app/form/form_item_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';

class RegisterUnifediApiAccessFormStepperCaptchaItemBloc
    extends RegisterUnifediApiAccessFormStepperItemBloc
    implements IRegisterUnifediApiAccessFormStepperCaptchaItemBloc {
  @override
  // ignore: avoid-late-keyword
  late IUnifediFormCaptchaStringFieldBloc captchaFieldBloc;

  final IUnifediApiInstanceService unifediApiInstanceService;

  RegisterUnifediApiAccessFormStepperCaptchaItemBloc({
    required this.unifediApiInstanceService,
  }) : super(
          isAllItemsInitialized: false,
        ) {
    captchaFieldBloc = UnifediFormCaptchaStringFieldBloc(
      unifediCaptchaService: unifediApiInstanceService,
      originValue: '',
      validators: [
        StringValueFormFieldNonEmptyValidationError.createValidator(),
      ],
    );

    captchaFieldBloc.disposeWith(this);

    onFormItemsChanged();
  }

  @override
  RegisterUnifediApiAccessFormStepperItemType get type =>
      RegisterUnifediApiAccessFormStepperItemType.captcha;

  @override
  List<IFormItemBloc> get currentItems => [
        captchaFieldBloc,
      ];

  @override
  Future<void> reloadCaptcha() => captchaFieldBloc.reloadCaptcha();
}
