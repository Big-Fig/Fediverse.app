import 'package:fedi/app/form/field/value/bool/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/share/external/external_share_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class ExternalShareAsLinkFieldWidget extends StatelessWidget {
  const ExternalShareAsLinkFieldWidget();

  @override
  Widget build(BuildContext context) => FormBoolFieldFormRowWidget(
        label: S.of(context).app_share_external_field_shareAsLink,
        field: IExternalShareBloc.of(context, listen: false).asLinkBoolField,
      );
}
