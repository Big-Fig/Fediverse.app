import 'package:fedi/app/ui/dialog/chooser/fedi_selection_chooser_dialog.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/form/fedi_form_row.dart';
import 'package:fedi/app/ui/form/fedi_form_row_label.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ValueToTextMapper<T> = String Function(T value);
typedef ValueToIconMapper<T> = IconData Function(T value);
typedef ValueChangedCallback<T> = Function(T oldValue, T newValue);

class FediFormChooseFromListFieldRow<T> extends StatelessWidget {
  final String label;
  final String chooserTitle;
  final T value;
  final List<T> possibleValues;
  final ValueToTextMapper<T> valueToTextMapper;
  final ValueToIconMapper<T> valueToIconMapper;
  final ValueChangedCallback<T> onChanged;

  FediFormChooseFromListFieldRow({
    @required this.label,
    @required this.chooserTitle,
    @required this.value,
    @required this.possibleValues,
    @required this.valueToTextMapper,
    @required this.valueToIconMapper,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FediFormRow(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FediFormRowLabel(label),
          InkWell(
            onTap: () {
              showFediSelectionChooserDialog(
                context: context,
                title: chooserTitle,
                actions: possibleValues
                    .map(
                      (possibleValue) => SelectionDialogAction(
                        isSelected: value == possibleValue,
                        label: valueToTextMapper != null
                            ? valueToTextMapper(possibleValue)
                            : null,
                        icon: valueToIconMapper != null
                            ? valueToIconMapper(possibleValue)
                            : null,
                        onAction: () {
                          onChanged(value, possibleValue);
                          Navigator.of(context).pop();
                        },
                      ),
                    )
                    .toList(),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (valueToIconMapper != null)
                  Padding(
                    padding: FediPadding.horizontalSmallPadding,
                    child: Icon(
                      valueToIconMapper(value),
                      color: FediColors.darkGrey,
                    ),
                  ),
                if (valueToTextMapper != null)
                  Padding(
                    padding: FediPadding.horizontalSmallPadding,
                    child: Text(
                      valueToTextMapper(value),
                      style: FediTextStyles.mediumShortDarkGrey,
                    ),
                  ),
                Padding(
                  padding: FediPadding.horizontalSmallPadding,
                  child: Icon(
                    FediIcons.pen,
                    color: FediColors.darkGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
