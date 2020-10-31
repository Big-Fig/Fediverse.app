import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/spacer/fedi_medium_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
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
                ? IFediUiColorTheme.of(context).mediumGrey
                : IFediUiColorTheme.of(context).white,
            size: 16.0,
          ),
          const FediMediumHorizontalSpacer(),
          Text(
            "${field.name}: ",
            style: brightness == Brightness.dark
                ? IFediUiTextTheme.of(context).mediumTallDarkGrey
                : IFediUiTextTheme.of(context).mediumTallWhite,
          ),
          Flexible(
              child: Text(
            field.valueAsRawUrlWithoutSchema,
            overflow: TextOverflow.ellipsis,
            style: IFediUiTextTheme.of(context).mediumTallPrimary,
          )),
        ],
      ),
    );
  }
}
