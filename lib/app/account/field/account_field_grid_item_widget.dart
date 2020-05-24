import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/pleroma/field/pleroma_field_model.dart';
import 'package:flutter/material.dart';


class AccountFieldGridItemWidget extends StatelessWidget {
  final IPleromaField field;

  const AccountFieldGridItemWidget({@required this.field});

  @override
  Widget build(BuildContext context) {
    return FediPrimaryFilledTextButton(
      field.name,
      onPressed: () {
        String link = UrlHelper.extractUrl(field.value);
        UrlHelper.handleUrlClick(context, link);
      },
    );
  }


}
