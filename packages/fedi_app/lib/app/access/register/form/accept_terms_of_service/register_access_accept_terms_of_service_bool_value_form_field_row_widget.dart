import 'package:fedi_app/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi_app/app/ui/form/fedi_form_column_desc.dart';
import 'package:fedi_app/app/ui/form/fedi_form_field_row.dart';
import 'package:fedi_app/app/ui/form/fedi_form_row_label.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/app/url/url_helper.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterUnifediApiAccessAcceptTermsOfServiceBoolValueFormFieldRowWidget
    extends StatelessWidget {
  final Uri instanceBaseUri;
  final bool displayErrors;

  const RegisterUnifediApiAccessAcceptTermsOfServiceBoolValueFormFieldRowWidget({
    Key? key,
    required this.instanceBaseUri,
    this.displayErrors = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BoolValueFormFieldBlocProxyProvider(
        child: FediFormFieldRow(
          displayErrors: displayErrors,
          label: FediFormRowLabel(
            S
                .of(context)
                .app_auth_instance_register_field_acceptTermsOfService_label,
          ),
          description:
              _RegisterUnifediApiAccessAcceptTermsOfServiceBoolValueFormFieldRowDescriptionWidget(
            instanceBaseUri: instanceBaseUri,
          ),
          descriptionOnDisabled: null,
          valueChild: const BoolValueFormFieldRowValueWidget(),
        ),
      );
}

class _RegisterUnifediApiAccessAcceptTermsOfServiceBoolValueFormFieldRowDescriptionWidget
    extends StatelessWidget {
  const _RegisterUnifediApiAccessAcceptTermsOfServiceBoolValueFormFieldRowDescriptionWidget({
    Key? key,
    required this.instanceBaseUri,
  }) : super(key: key);

  final Uri instanceBaseUri;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          UrlHelper.handleUrlClick(
            context: context,
            url: instanceBaseUri.toString(),
          );
        },
        child: FediFormColumnDesc(
          S
              .of(context)
              .app_auth_instance_register_field_acceptTermsOfService_description(
                instanceBaseUri.host,
              ),
          textStyle: IFediUiTextTheme.of(context).bigTallPrimary,
        ),
      );
}
