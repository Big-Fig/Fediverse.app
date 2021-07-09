import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/localization/locale/form/localization_locale_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/localization/locale/form/localization_locale_single_from_list_value_form_field_row_widget.dart';
import 'package:fedi/app/localization/settings/edit/edit_localization_settings_bloc.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditLocalizationSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditLocalizationSettingsWidget({
    required this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    var configService = IConfigService.of(context);

    return Column(
      mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
      children: [
        ProxyProvider<IEditLocalizationSettingsBloc,
            ILocalizationLocaleSingleFromListValueFormFieldBloc>(
          update: (context, value, previous) =>
              value.localizationLocaleFieldBloc,
          child:
              const LocalizationLocaleSingleFromListValueFormFieldRowWidget(),
        ),
        if (configService.helpTranslateUrl != null)
          _EditLocalizationSettingsInfoRowWidget(
            label: S.of(context).app_about_field_helpTranslate_label,
            value: S.of(context).app_about_field_helpTranslate_value,
            valueUrl: configService.helpTranslateUrl,
          ),
      ],
    );
  }
}

// todo: copy-pasted, refactor
class _EditLocalizationSettingsInfoRowWidget extends StatelessWidget {
  final String label;
  final String value;
  final String? valueUrl;

  const _EditLocalizationSettingsInfoRowWidget({
    Key? key,
    required this.label,
    required this.value,
    required this.valueUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = IFediUiTextTheme.of(context).bigTallDarkGrey;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: textStyle,
        ),
        if (valueUrl == null)
          Padding(
            padding: FediPadding.allSmallPadding,
            child: Text(
              value,
              style: textStyle,
            ),
          )
        else
          InkWell(
            onTap: () {
              UrlHelper.handleUrlClick(context: context, url: valueUrl!);
            },
            child: Padding(
              padding: FediPadding.allSmallPadding,
              child: Text(
                value,
                style: textStyle.copyWith(
                  color: IFediUiColorTheme.of(context).primary,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
