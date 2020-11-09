import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_selection_chooser_dialog.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/form/fedi_form_column_desc.dart';
import 'package:fedi/app/ui/form/fedi_form_row.dart';
import 'package:fedi/app/ui/form/fedi_form_row_label.dart';
import 'package:fedi/app/ui/theme/dark_fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/theme/light_fedi_ui_theme_model.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("form_fedi_theme_field_form_row_widget.dart");

class FormFediThemeFieldFormRowWidget extends StatelessWidget {
  final String label;
  final String desc;
  final IFormValueFieldBloc<IFediUiTheme> field;

  FormFediThemeFieldFormRowWidget({
    @required this.label,
    this.desc,
    @required this.field,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<IFediUiTheme>(
        stream: field.currentValueStream.distinct(),
        initialData: field.currentValue,
        builder: (context, snapshot) {
          var currentValue = snapshot.data;

          _logger.finest(() => "currentValue $currentValue");
          var fediUiTextTheme = IFediUiTextTheme.of(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  _showDialog(context, currentValue);
                },
                child: FediFormRow(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FediFormRowLabel(label),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FediIconButton(
                            onPressed: () {
                              _showDialog(context, currentValue);
                            },
                            icon: Icon(
                              mapThemeToIcon(context, currentValue),
                            ),
                          ),
                          Text(
                            mapThemeToTitle(context, currentValue),
                            style: fediUiTextTheme.mediumShortDarkGrey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (desc != null) FediFormColumnDesc(desc),
            ],
          );
        });
  }

  void _showDialog(BuildContext context, IFediUiTheme currentValue) {
      showFediSelectionChooserDialog(
        context: context,
        title: S
            .of(context)
            .app_status_post_visibility_title,
        actions: [
          buildThemeDialogAction(
              context, field, null, currentValue),
          buildThemeDialogAction(context, field,
              lightFediUiTheme, currentValue),
          buildThemeDialogAction(context, field,
              darkFediUiTheme, currentValue),
        ]);
  }

  SelectionDialogAction buildThemeDialogAction(
    BuildContext context,
    IFormValueFieldBloc<IFediUiTheme> field,
    IFediUiTheme theme,
    IFediUiTheme currentValue,
  ) {
    return SelectionDialogAction(
      icon: mapThemeToIcon(context, theme),
      label: mapThemeToTitle(context, theme),
      onAction: (context) {
        field.changeCurrentValue(theme);
        Navigator.of(context).pop();
      },
      isSelected: theme == currentValue,
    );
  }

  String mapThemeToTitle(BuildContext context, IFediUiTheme theme) {
    if (theme == null) {
      return S.of(context).app_theme_type_system;
    } else if (theme == lightFediUiTheme) {
      return S.of(context).app_theme_type_light;
    } else if (theme == darkFediUiTheme) {
      return S.of(context).app_theme_type_dark;
    } else {
      throw "unsupported theme $theme";
    }
  }

  IconData mapThemeToIcon(BuildContext context, IFediUiTheme theme) {
    if (theme == null) {
      return FediIcons.appearance_auto;
    } else if (theme == lightFediUiTheme) {
      return FediIcons.appearance_light;
    } else if (theme == darkFediUiTheme) {
      return FediIcons.appearance_dark;
    } else {
      throw "unsupported theme $theme";
    }
  }
}
