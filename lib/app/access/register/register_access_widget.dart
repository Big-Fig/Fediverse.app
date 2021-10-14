import 'package:fedi/app/access/register/form/register_access_form_bloc.dart';
import 'package:fedi/app/access/register/form/register_access_form_widget.dart';
import 'package:fedi/app/access/register/form/stepper/register_access_form_stepper_widget.dart';
import 'package:fedi/app/access/register/register_access_bloc.dart';
import 'package:fedi/app/access/register/register_access_widget_keys.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterUnifediApiAccessWidget extends StatelessWidget {
  final RegisterCallback onRegister;

  const RegisterUnifediApiAccessWidget({
    required this.onRegister,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var registerUnifediApiAccessBloc =
        IRegisterUnifediApiAccessBloc.of(context);

    return Padding(
      padding: FediPadding.verticalBigPadding,
      child: FediAsyncInitLoadingWidget(
        asyncInitLoadingBloc: registerUnifediApiAccessBloc,
        loadingFinishedBuilder: (context) => ProxyProvider<
            IRegisterUnifediApiAccessBloc, IRegisterUnifediApiAccessFormBloc>(
          update: (context, value, previous) =>
              value.registerUnifediApiAccessFormBloc,
          child: RegisterUnifediApiAccessFormWidget(
            onRegister: onRegister,
            key: const Key(
              RegisterUnifediApiAccessWidgetKeys
                  .registerUnifediApiAccessFormWidgetKey,
            ),
          ),
        ),
      ),
    );
  }
}
