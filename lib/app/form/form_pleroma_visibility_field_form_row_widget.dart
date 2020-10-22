import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/visibility/status_visibility_icon_widget.dart';
import 'package:fedi/app/status/visibility/status_visibility_title_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_selection_chooser_dialog.dart';
import 'package:fedi/app/ui/form/fedi_form_row.dart';
import 'package:fedi/app/ui/form/fedi_form_row_label.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("form_pleroma_visibility_field_form_row_widget.dart");

class FormPleromaVisibilityFieldFormRowWidget extends StatelessWidget {
  final String label;
  final String desc;
  final IFormValueFieldBloc<PleromaVisibility> field;

  FormPleromaVisibilityFieldFormRowWidget({
    @required this.label,
    this.desc,
    @required this.field,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PleromaVisibility>(
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
                              buildVisibilityDialogAction(context, field,
                                  PleromaVisibility.public, currentValue),
                              buildVisibilityDialogAction(context, field,
                                  PleromaVisibility.direct, currentValue),
                              buildVisibilityDialogAction(context, field,
                                  PleromaVisibility.unlisted, currentValue),
                              buildVisibilityDialogAction(context, field,
                                  PleromaVisibility.private, currentValue),
                            ]);
                      },
                      icon: Icon(
                        StatusVisibilityIconWidget.mapVisibilityToIconData(
                            currentValue),
                      ),
                    ),
                  ],
                ),
              ),
              if (desc != null) Text(desc),
            ],
          );
        });
  }

  SelectionDialogAction buildVisibilityDialogAction(
    BuildContext context,
    IFormValueFieldBloc<PleromaVisibility> field,
    PleromaVisibility visibility,
    PleromaVisibility currentValue,
  ) {
    return SelectionDialogAction(
      icon: StatusVisibilityIconWidget.mapVisibilityToIconData(visibility),
      label:
          StatusVisibilityTitleWidget.mapVisibilityToTitle(context, visibility),
      onAction: () {
        field.changeCurrentValue(visibility);
        Navigator.of(context).pop();
      },
      isSelected: visibility == currentValue,
    );
  }
}
