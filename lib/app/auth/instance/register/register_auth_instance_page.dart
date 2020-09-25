import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_bloc_impl.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_widget.dart';
import 'package:fedi/app/form/captcha/pleroma_form_captcha_string_field_bloc_impl.dart';
import 'package:fedi/app/ui/button/icon/fedi_dismiss_icon_button.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/captcha/pleroma_captcha_model.dart';
import 'package:fedi/pleroma/captcha/pleroma_captcha_service_impl.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_service_impl.dart';
import 'package:fedi/rest/rest_service_impl.dart';
import 'package:fedi/ui/form/field/value/string/form_captcha_string_field_bloc.dart';
import 'package:fedi/ui/form/field/value/string/form_non_empty_string_field_validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("register_auth_instance_page.dart");

class RegisterAuthInstancePage extends StatelessWidget {
  final Uri instanceBaseUrl;
  final VoidCallback successRegistrationCallback;

  const RegisterAuthInstancePage({
    @required this.instanceBaseUrl,
    @required this.successRegistrationCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
          title: tr("app.auth.instance.register.title"),
          leading: FediDismissIconButton()),
      body: SafeArea(
          child: RegisterAuthInstanceWidget(
        instanceBaseUrl: instanceBaseUrl,
        successRegistrationCallback: successRegistrationCallback,
      )),
    );
  }
}

void goToRegisterAuthInstancePage(
  BuildContext context, {
  @required Uri instanceBaseUrl,
  @required VoidCallback successRegistrationCallback,
}) async {
  IFormCaptchaStringFieldBloc captchaFieldBloc;
  await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
    context: context,
    asyncCode: () async {
      var pleromaRestService = PleromaRestService(
        isPleromaInstance: false,
        connectionService: IConnectionService.of(context, listen: false),
        restService: RestService(baseUrl: instanceBaseUrl),
      );
      var pleromaCaptchaService = PleromaCaptchaService(
        restService: pleromaRestService,
      );
      try {
        var captcha = await pleromaCaptchaService.getCaptcha();
        _logger.finest(() => "captcha ${captcha}");
        if (captcha != null && captcha.pleromaType != PleromaCaptchaType.none) {
          captchaFieldBloc = PleromaFormCaptchaStringFieldBloc(
            initialCaptcha: captcha,
            pleromaCaptchaService: pleromaCaptchaService,
            originValue: null,
            validators: [FormNonEmptyStringFieldValidationError.createValidator()],
          );
        }
      } catch (stackTrace, e) {
        _logger.warning(() => "getCaptcha error", stackTrace, e);
      } finally {
        pleromaCaptchaService.dispose();
        pleromaRestService.dispose();
      }
    },
  );
  goToPage(
      context, captchaFieldBloc, instanceBaseUrl, successRegistrationCallback);
}

void goToPage(BuildContext context, IFormCaptchaStringFieldBloc captchaBloc,
    Uri instanceBaseUrl, VoidCallback successRegistrationCallback) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<IRegisterAuthInstanceBloc>(
            create: (context) {
              var joinAuthInstanceRegisterBloc =
                  JoinAuthInstanceRegisterBloc(captchaFieldBloc: captchaBloc);
              if (captchaBloc != null) {
                joinAuthInstanceRegisterBloc.addDisposable(
                    disposable: captchaBloc);
              }
              return joinAuthInstanceRegisterBloc;
            },
            child: RegisterAuthInstancePage(
              instanceBaseUrl: instanceBaseUrl,
              successRegistrationCallback: successRegistrationCallback,
            ))),
  );
}
