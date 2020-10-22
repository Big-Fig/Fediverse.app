import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_selection_chooser_dialog.dart';
import 'package:fedi/app/ui/form/fedi_form_row.dart';
import 'package:fedi/app/ui/form/fedi_form_row_label.dart';
import 'package:fedi/app/ui/theme/dark_fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/theme/light_fedi_ui_theme_model.dart';
import 'package:fedi/dialog/dialog_model.dart';
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FediFormRow(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FediFormRowLabel(label),
                    FediIconButton(
                      onPressed: () {
                        showFediSelectionChooserDialog(
                            context: context,
                            title: "app.status.post.visibility.title".tr(),
                            actions: [
                              buildThemeDialogAction(
                                  context, field, null, currentValue),
                              buildThemeDialogAction(context, field,
                                  lightFediUiTheme, currentValue),
                              buildThemeDialogAction(context, field,
                                  darkFediUiTheme, currentValue),
                            ]);
                      },
                      icon: null,
                    ),
                  ],
                ),
              ),
              if (desc != null) Text(desc),
            ],
          );
        });
  }

  SelectionDialogAction buildThemeDialogAction(
    BuildContext context,
    IFormValueFieldBloc<IFediUiTheme> field,
    IFediUiTheme theme,
    IFediUiTheme currentValue,
  ) {
    return SelectionDialogAction(
      icon: null,
      label: mapThemeToTitle(context, theme),
      onAction: () {
        field.changeCurrentValue(theme);
        Navigator.of(context).pop();
      },
      isSelected: theme == currentValue,
    );
  }

  String mapThemeToTitle(BuildContext context, IFediUiTheme theme) {
    if (theme == null) {
      return "app.theme.type.system".tr();
    } else if (theme == lightFediUiTheme) {
      return "app.theme.type.light".tr();
    } else if (theme == darkFediUiTheme) {
      return "app.theme.type.dark".tr();
    } else {
      throw "unsupported theme $theme";
    }
  }
}
