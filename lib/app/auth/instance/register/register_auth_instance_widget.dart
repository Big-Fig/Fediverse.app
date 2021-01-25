import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/auth/instance/auth_instance_pleroma_rest_error_data.dart';
import 'package:fedi/app/auth/instance/register/form/register_auth_instance_form_widget.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_bloc.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/async/loading/init/async_init_loading_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'form/register_auth_instance_form_bloc.dart';

class RegisterAuthInstanceWidget extends StatelessWidget {
  const RegisterAuthInstanceWidget();

  @override
  Widget build(BuildContext context) {
    var registerAuthInstanceBloc = IRegisterAuthInstanceBloc.of(context);
    return Padding(
      padding: FediPadding.verticalBigPadding,
      child: FediAsyncInitLoadingWidget(
        asyncInitLoadingBloc: registerAuthInstanceBloc,
        loadingFinishedBuilder: (context) {
          return Column(
            children: [
              Expanded(
                child: ProxyProvider<IRegisterAuthInstanceBloc,
                    IRegisterAuthInstanceFormBloc>(
                  update: (context, value, previous) =>
                      value.registerAuthInstanceFormBloc,
                  child: const RegisterAuthInstanceFormWidget(),
                ),
              ),
              const SizedBox(height: 25),
              const _RegisterAuthInstanceSubmitButtonWidget(),
            ],
          );
        },
      ),
    );
  }
}

class _RegisterAuthInstanceSubmitButtonWidget extends StatelessWidget {
  const _RegisterAuthInstanceSubmitButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var registerAuthInstanceBloc = IRegisterAuthInstanceBloc.of(context);
    return StreamBuilder<bool>(
      stream: registerAuthInstanceBloc.isReadyToSubmitStream,
      initialData: registerAuthInstanceBloc.isReadyToSubmit,
      builder: (context, snapshot) {
        var readyToSubmit = snapshot.data;
        var onPressed;
        if (readyToSubmit) {
          onPressed = () async {
            await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
              context: context,
              asyncCode: () => registerAuthInstanceBloc.submit(),
              errorDataBuilders: [
                (context, error, stackTrace) =>
                    AuthInstancePleromaRestErrorData.createFromContext(
                      context: context,
                      error: error,
                      stackTrace: stackTrace,
                    )
              ],
            );
          };
        }
        return FediPrimaryFilledTextButtonWithBorder(
          S.of(context).app_auth_instance_register_action_createAccount,
          onPressed: onPressed,
          expanded: false,
        );
      },
    );
  }
}
