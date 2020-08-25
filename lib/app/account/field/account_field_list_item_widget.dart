import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/spacer/fedi_medium_horizontal_spacer.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/pleroma/field/pleroma_field_model.dart';
import 'package:flutter/material.dart';

class AccountFieldListItemWidget extends StatelessWidget {
  final IPleromaField field;
  final Brightness brightness;

  const AccountFieldListItemWidget({
    @required this.field,
    @required this.brightness,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        String link = UrlHelper.extractUrl(field.valueAsRawUrl);
        UrlHelper.handleUrlClick(context, link);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            FediIcons.link,
            color: brightness == Brightness.dark
                ? FediColors.mediumGrey
                : FediColors.white,
            size: 16.0,
          ),
          FediMediumHorizontalSpacer(),
          Text(
            "${field.name}: ",
            style: brightness == Brightness.dark
                ? FediTextStyles.mediumTallDarkGrey
                : FediTextStyles.mediumTallWhite,
          ),
          Flexible(
              child: Text(
            field.valueAsRawUrlWithoutSchema,
            overflow: TextOverflow.ellipsis,
            style: FediTextStyles.mediumTallPrimary,
          )),
        ],
      ),
    );
  }
}
