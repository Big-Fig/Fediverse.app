import 'package:fedi_app/app/account/account_bloc.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/spacer/fedi_medium_horizontal_spacer.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/app/url/url_helper.dart';
import 'package:fedi_app/unifedi/api/field/unifedi_api_field_extension.dart';
import 'package:flutter/material.dart';
import 'package:unifedi_api/unifedi_api.dart';

class AccountFieldListItemWidget extends StatelessWidget {
  final IUnifediApiField field;
  final Brightness brightness;

  const AccountFieldListItemWidget({
    Key? key,
    required this.field,
    required this.brightness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var valueAsRawUrlWithoutSchema = field.valueAsRawUrlWithoutSchema ?? '';

    return InkWell(
      onTap: () {
        var valueAsRawUrl = field.valueAsRawUrl;
        if (valueAsRawUrl?.isNotEmpty == true) {
          var url = UrlHelper.extractUrl(valueAsRawUrl!);
          var accountBloc = IAccountBloc.of(context, listen: false);
          UrlHelper.handleUrlClickWithInstanceLocation(
            context: context,
            url: url,
            instanceLocationBloc: accountBloc,
          );
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            _calculateIconData(
              valueAsRawUrlWithoutSchema: valueAsRawUrlWithoutSchema,
            ),
            color: brightness == Brightness.dark
                ? IFediUiColorTheme.of(context).mediumGrey
                : IFediUiColorTheme.of(context).white, // todo: refactor
            // ignore: no-magic-number
            size: 16.0,
          ),
          const FediMediumHorizontalSpacer(),
          Text(
            '${field.name}: ',
            style: brightness == Brightness.dark
                ? IFediUiTextTheme.of(context).mediumTallDarkGrey
                : IFediUiTextTheme.of(context).mediumTallWhite,
          ),
          Flexible(
            child: Text(
              valueAsRawUrlWithoutSchema,
              overflow: TextOverflow.ellipsis,
              style: IFediUiTextTheme.of(context).mediumTallPrimary,
            ),
          ),
        ],
      ),
    );
  }

  IconData _calculateIconData({
    required String valueAsRawUrlWithoutSchema,
  }) {
    var preparedUrl = valueAsRawUrlWithoutSchema.toLowerCase();
    if (valueAsRawUrlWithoutSchema.startsWith('www.')) {
      preparedUrl = preparedUrl.replaceAll(
        'www.',
        '',
      );
    }
    if (_isFacebookLink(preparedUrl)) {
      return FediIcons.fb;
    }
    if (_isInstagramLink(preparedUrl)) {
      return FediIcons.ig;
    } else {
      return FediIcons.link;
    }
  }

  bool _isFacebookLink(String valueAsRawUrlWithoutSchema) =>
      valueAsRawUrlWithoutSchema.startsWith('facebook.com') ||
      valueAsRawUrlWithoutSchema.startsWith('fb.me');

  bool _isInstagramLink(String valueAsRawUrlWithoutSchema) =>
      valueAsRawUrlWithoutSchema.startsWith('instagram.com') ||
      valueAsRawUrlWithoutSchema.startsWith('instagr.am') ||
      valueAsRawUrlWithoutSchema.startsWith('instagr.com');
}
