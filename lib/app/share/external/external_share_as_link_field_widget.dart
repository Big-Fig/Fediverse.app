import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/share/external/external_share_bloc.dart';
import 'package:flutter/cupertino.dart';

class ExternalShareAsLinkFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FormBoolFieldFormRowWidget(
        label: "app.share.external.field.share_as_link".tr(),
        field: IExternalShareBloc.of(context, listen: false).asLinkBoolField,
      );
}
