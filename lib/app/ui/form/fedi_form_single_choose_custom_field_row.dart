import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/form/fedi_form_column_desc.dart';
import 'package:fedi/app/ui/form/fedi_form_column_error.dart';
import 'package:fedi/app/ui/form/fedi_form_row.dart';
import 'package:fedi/app/ui/form/fedi_form_row_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ValueToTextMapper<T> = String Function(T value);
typedef ValueToIconMapper<T> = IconData Function(T value);
typedef ValueChangedCallback<T> = Function(T oldValue, T newValue);

class FediFormSingleChooseCustomFromListFieldRow<T> extends StatelessWidget {
  final bool enabled;
  final bool nullable;
  final String label;
  final String desc;
  final String error;
  final T value;
  final ValueToTextMapper<T> valueToTextMapper;
  final ValueToIconMapper<T> valueToIconMapper;
  final VoidCallback startCustomSelectCallback;
  final VoidCallback clearCallback;

  FediFormSingleChooseCustomFromListFieldRow({
    @required this.enabled,
    @required this.nullable,
    @required this.label,
    @required this.desc,
    @required this.error,
    @required this.value,
    @required this.valueToTextMapper,
    @required this.valueToIconMapper,
    @required this.startCustomSelectCallback,
    @required this.clearCallback,
  });

  @override
  Widget build(BuildContext context) {
    return FediFormRow(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FediFormRowLabel(label),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: enabled ? startCustomSelectCallback : null,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (valueToIconMapper != null)
                          Padding(
                            padding: FediPadding.horizontalSmallPadding,
                            child: Icon(
                              valueToIconMapper(value),
                              color: enabled
                                  ? IFediUiColorTheme.of(context).darkGrey
                                  : IFediUiColorTheme.of(context).lightGrey,
                            ),
                          ),
                        if (valueToTextMapper != null)
                          Padding(
                            padding: FediPadding.horizontalSmallPadding,
                            child: Text(
                              valueToTextMapper(value),
                              style: enabled
                                  ? IFediUiTextTheme.of(context).mediumShortDarkGrey
                                  : IFediUiTextTheme.of(context).mediumShortLightGrey,
                            ),
                          ),
                        Padding(
                          padding: FediPadding.horizontalSmallPadding,
                          child: Icon(
                            FediIcons.pen,
                            color: enabled
                                ? IFediUiColorTheme.of(context).darkGrey
                                : IFediUiColorTheme.of(context).lightGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (nullable && value != null)
                    InkWell(
                      onTap: () {
                        clearCallback();
                      },
                      child: Padding(
                        padding: FediPadding.horizontalSmallPadding,
                        child: Icon(
                          FediIcons.delete,
                          color:
                          enabled ? IFediUiColorTheme.of(context).darkGrey : IFediUiColorTheme.of(context).lightGrey,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
          if (desc != null) FediFormColumnDesc(desc),
          if (error != null) FediFormColumnError(error),
        ],
      ),
    );
  }
}
