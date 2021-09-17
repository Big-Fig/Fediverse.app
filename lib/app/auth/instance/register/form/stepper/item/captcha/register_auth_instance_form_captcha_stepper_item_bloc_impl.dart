import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/captcha/register_auth_instance_form_captcha_stepper_item_bloc.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/register_auth_instance_form_stepper_item_bloc_impl.dart';
import 'package:fedi/app/auth/instance/register/form/stepper/item/register_auth_instance_form_stepper_item_model.dart';
import 'package:fedi/app/captcha/pleroma/pleroma_form_captcha_string_field_bloc.dart';
import 'package:fedi/app/captcha/pleroma/pleroma_form_captcha_string_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/validation/string_value_form_field_non_empty_validation.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';

class RegisterAuthInstanceFormStepperCaptchaItemBloc
    extends RegisterAuthInstanceFormStepperItemBloc
    implements IRegisterAuthInstanceFormStepperCaptchaItemBloc {
  @override
  // ignore: avoid-late-keyword
  late IPleromaFormCaptchaStringFieldBloc captchaFieldBloc;

  final IUnifediApiInstanceService unifediApiInstanceService;

  RegisterAuthInstanceFormStepperCaptchaItemBloc({
    required this.unifediApiInstanceService,
  }) : super(
          isAllItemsInitialized: false,
        ) {
    captchaFieldBloc = PleromaFormCaptchaStringFieldBloc(
      pleromaCaptchaService: unifediApiInstanceService,
      originValue: '',
      validators: [
        StringValueFormFieldNonEmptyValidationError.createValidator(),
      ],
    );

    captchaFieldBloc.disposeWith(this);

    onFormItemsChanged();
  }

  @override
  RegisterAuthInstanceFormStepperItemType get type =>
      RegisterAuthInstanceFormStepperItemType.captcha;

  @override
  List<IFormItemBloc> get currentItems => [
        captchaFieldBloc,
      ];

  @override
  Future reloadCaptcha() => captchaFieldBloc.reloadCaptcha();
}
