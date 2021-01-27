import 'package:fedi/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi/app/ui/form/fedi_form_column_desc.dart';
import 'package:fedi/app/ui/form/fedi_form_field_row.dart';
import 'package:fedi/app/ui/form/fedi_form_row_label.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterAuthInstanceAcceptTermsOfServiceBoolValueFormFieldRowWidget
    extends StatelessWidget {
  final Uri instanceBaseUri;

  @override
  Widget build(BuildContext context) => BoolValueFormFieldBlocProxyProvider(
        child: FediFormFieldRow(
          label: FediFormRowLabel(
            S
                .of(context)
                .app_auth_instance_register_field_acceptTermsOfService_label,
          ),
          description: InkWell(
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
          ),
          descriptionOnDisabled: null,
          valueChild: const BoolValueFormFieldRowValueWidget(),
        ),
      );

  const RegisterAuthInstanceAcceptTermsOfServiceBoolValueFormFieldRowWidget({
    @required this.instanceBaseUri,
  });
}
