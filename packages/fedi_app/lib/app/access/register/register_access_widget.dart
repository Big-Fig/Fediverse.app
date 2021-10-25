import 'package:fedi_app/app/access/register/form/register_access_form_bloc.dart';
import 'package:fedi_app/app/access/register/form/register_access_form_widget.dart';
import 'package:fedi_app/app/access/register/form/stepper/register_access_form_stepper_widget.dart';
import 'package:fedi_app/app/access/register/register_access_bloc.dart';
import 'package:fedi_app/app/access/register/register_access_widget_keys.dart';
import 'package:fedi_app/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterAccessWidget extends StatelessWidget {
  final RegisterAccessCallback onRegister;

  const RegisterAccessWidget({
    required this.onRegister,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var registerUnifediApiAccessBloc = IRegisterAccessBloc.of(context);

    return Padding(
      padding: FediPadding.verticalBigPadding,
      child: FediAsyncInitLoadingWidget(
        asyncInitLoadingBloc: registerUnifediApiAccessBloc,
        loadingFinishedBuilder: (context) =>
            ProxyProvider<IRegisterAccessBloc, IRegisterAccessFormBloc>(
          update: (context, value, previous) =>
              value.registerUnifediApiAccessFormBloc,
          child: RegisterAccessFormWidget(
            onRegister: onRegister,
            key: const Key(
              RegisterAccessWidgetKeys.registerAccessFormWidgetKey,
            ),
          ),
        ),
      ),
    );
  }
}
