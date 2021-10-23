import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/form/fedi_form_column_desc.dart';
import 'package:fedi/app/ui/form/fedi_form_column_error.dart';
import 'package:fedi/app/ui/form/fedi_form_row.dart';
import 'package:fedi/app/ui/form/fedi_form_row_label.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ValueToTextMapper<T> = String Function(T value);
typedef ValueToIconMapper<T> = IconData Function(T value);
typedef ValueChangedCallback<T> = Function(T oldValue, T newValue);

class FediFormSingleChooseCustomFromListFieldRow<T> extends StatelessWidget {
  final bool? isEnabled;
  final bool isNullValuePossible;
  final String label;
  final String? description;
  final String? descriptionOnDisabled;
  final String? error;
  final T value;
  final ValueToTextMapper<T>? valueToTextMapper;
  final ValueToIconMapper<T>? valueToIconMapper;
  final VoidCallback startCustomSelectCallback;
  final VoidCallback clearCallback;

  const FediFormSingleChooseCustomFromListFieldRow({
    Key? key,
    required this.isEnabled,
    required this.isNullValuePossible,
    required this.label,
    required this.description,
    required this.descriptionOnDisabled,
    required this.error,
    required this.value,
    required this.valueToTextMapper,
    required this.valueToIconMapper,
    required this.startCustomSelectCallback,
    required this.clearCallback,
  }) : super(key: key);

  @override
  // ignore: long-method
  Widget build(BuildContext context) => FediFormRow(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      onTap: isEnabled! ? startCustomSelectCallback : null,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (valueToIconMapper != null)
                            Padding(
                              padding: FediPadding.horizontalSmallPadding,
                              child: Icon(
                                valueToIconMapper!(value),
                                color: isEnabled!
                                    ? IFediUiColorTheme.of(context).darkGrey
                                    : IFediUiColorTheme.of(context).lightGrey,
                              ),
                            ),
                          if (valueToTextMapper != null)
                            Padding(
                              padding: FediPadding.horizontalSmallPadding,
                              child: Text(
                                valueToTextMapper!(value),
                                style: isEnabled!
                                    ? IFediUiTextTheme.of(context)
                                        .mediumShortDarkGrey
                                    : IFediUiTextTheme.of(context)
                                        .mediumShortLightGrey,
                              ),
                            ),
                          Padding(
                            padding: FediPadding.horizontalSmallPadding,
                            child: Icon(
                              FediIcons.pen,
                              color: isEnabled!
                                  ? IFediUiColorTheme.of(context).darkGrey
                                  : IFediUiColorTheme.of(context).lightGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isNullValuePossible && value != null)
                      InkWell(
                        onTap: clearCallback,
                        child: Padding(
                          padding: FediPadding.horizontalSmallPadding,
                          child: Icon(
                            FediIcons.delete,
                            color: isEnabled!
                                ? IFediUiColorTheme.of(context).darkGrey
                                : IFediUiColorTheme.of(context).lightGrey,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            // ignore: avoid-returning-widgets
            _buildDescription(),
            if (error != null) FediFormColumnError(error),
          ],
        ),
      );

  Widget _buildDescription() {
    if (isEnabled!) {
      if (description != null) {
        return FediFormColumnDesc(description);
      } else {
        return const SizedBox.shrink();
      }
    } else {
      if (descriptionOnDisabled != null) {
        return FediFormColumnDesc(descriptionOnDisabled);
      } else {
        if (description != null) {
          return FediFormColumnDesc(description);
        } else {
          return const SizedBox.shrink();
        }
      }
    }
  }
}
