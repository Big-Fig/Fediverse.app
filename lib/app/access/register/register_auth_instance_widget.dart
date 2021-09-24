import 'package:fedi/app/access/register/form/register_auth_instance_form_bloc.dart';
import 'package:fedi/app/access/register/form/register_auth_instance_form_widget.dart';
import 'package:fedi/app/access/register/register_auth_instance_bloc.dart';
import 'package:fedi/app/access/register/register_auth_instance_widget_keys.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterUnifediApiAccessWidget extends StatelessWidget {
  const RegisterUnifediApiAccessWidget({
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
          child: const RegisterUnifediApiAccessFormWidget(
            key: Key(
              RegisterUnifediApiAccessWidgetKeys
                  .registerUnifediApiAccessFormWidgetKey,
            ),
          ),
        ),
      ),
    );
  }
}
