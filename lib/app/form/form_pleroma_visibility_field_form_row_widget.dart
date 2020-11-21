import 'package:fedi/app/status/visibility/status_visibility_icon_widget.dart';
import 'package:fedi/app/status/visibility/status_visibility_title_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_selection_chooser_dialog.dart';
import 'package:fedi/app/ui/form/fedi_form_column_desc.dart';
import 'package:fedi/app/ui/form/fedi_form_row.dart';
import 'package:fedi/app/ui/form/fedi_form_row_label.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("form_pleroma_visibility_field_form_row_widget.dart");

class FormPleromaVisibilityFieldFormRowWidget extends StatelessWidget {
  final String label;
  final String desc;
  final IValueFormFieldBloc<PleromaVisibility> field;
  final bool displayIcon;
  final bool enabled;

  FormPleromaVisibilityFieldFormRowWidget({
    @required this.label,
    this.desc,
    @required this.field,
    @required this.displayIcon,
    @required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    var fediUiTextTheme = IFediUiTextTheme.of(context);
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return StreamBuilder<PleromaVisibility>(
        stream: field.currentValueStream.distinct(),
        initialData: field.currentValue,
        builder: (context, snapshot) {
          var currentValue = snapshot.data;

          _logger.finest(() => "currentValue $currentValue");
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  if (enabled) {
                    _showDialog(context, currentValue);
                  }
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
                          if (displayIcon)
                            FediIconButton(
                              color: enabled
                                  ? fediUiColorTheme.darkGrey
                                  : fediUiColorTheme.lightGrey,
                              onPressed: () {
                                _showDialog(context, currentValue);
                              },
                              icon: Icon(
                                StatusVisibilityIconWidget
                                    .mapVisibilityToIconData(
                                    currentValue),
                              ),
                            ),
                          Text(
                            StatusVisibilityTitleWidget
                                .mapVisibilityToTitle(
                                context, currentValue),
                            style: enabled
                                ? fediUiTextTheme.mediumShortDarkGrey
                                : fediUiTextTheme.mediumShortLightGrey,
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

  void _showDialog(BuildContext context, PleromaVisibility currentValue) {
    showFediSelectionChooserDialog(
        context: context,
        title: S.of(context).app_status_post_visibility_title,
        actions: [
          buildVisibilityDialogAction(
              context, field, PleromaVisibility.public, currentValue),
          buildVisibilityDialogAction(
              context, field, PleromaVisibility.direct, currentValue),
          buildVisibilityDialogAction(
              context, field, PleromaVisibility.unlisted, currentValue),
          buildVisibilityDialogAction(
              context, field, PleromaVisibility.private, currentValue),
        ]);
  }

  SelectionDialogAction buildVisibilityDialogAction(
    BuildContext context,
    IValueFormFieldBloc<PleromaVisibility> field,
    PleromaVisibility visibility,
    PleromaVisibility currentValue,
  ) {
    return SelectionDialogAction(
      icon: StatusVisibilityIconWidget.mapVisibilityToIconData(visibility),
      label:
          StatusVisibilityTitleWidget.mapVisibilityToTitle(context, visibility),
      onAction: (context) {
        field.changeCurrentValue(visibility);
        Navigator.of(context).pop();
      },
      isSelected: visibility == currentValue,
    );
  }
}
