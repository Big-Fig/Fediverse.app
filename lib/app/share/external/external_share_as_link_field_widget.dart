import 'package:fedi/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi/app/share/external/external_share_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ExternalShareAsLinkFieldWidget extends StatelessWidget {
  const ExternalShareAsLinkFieldWidget();

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IExternalShareBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.asLinkBoolField,
        child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_share_external_field_shareAsLink,
        ),
      );
}
