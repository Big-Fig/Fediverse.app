import 'package:fedi/app/auth/instance/register/form/register_auth_instance_form_bloc.dart';
import 'package:fedi/app/auth/instance/register/form/register_auth_instance_form_widget.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_widget_keys.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterAuthInstanceWidget extends StatelessWidget {
  const RegisterAuthInstanceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var registerAuthInstanceBloc = IRegisterAuthInstanceBloc.of(context);

    return Padding(
      padding: FediPadding.verticalBigPadding,
      child: FediAsyncInitLoadingWidget(
        asyncInitLoadingBloc: registerAuthInstanceBloc,
        loadingFinishedBuilder: (context) => ProxyProvider<
            IRegisterAuthInstanceBloc, IRegisterAuthInstanceFormBloc>(
          update: (context, value, previous) =>
              value.registerAuthInstanceFormBloc,
          child: const RegisterAuthInstanceFormWidget(
            key: Key(
              RegisterAuthInstanceWidgetKeys.registerAuthInstanceFormWidgetKey,
            ),
          ),
        ),
      ),
    );
  }
}
