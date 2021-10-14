import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/dialog/chooser/selection/single/fedi_single_selection_chooser_dialog.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/form/fedi_form_field_row.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef SingleSelectFromListValueKeyMapper<T> = Key? Function(
  BuildContext context,
  T value,
);

typedef SingleSelectFromListValueIconMapper<T> = IconData Function(
  BuildContext context,
  T value,
);
typedef SingleSelectFromListValueTitleMapper<T> = String Function(
  BuildContext context,
  T value,
);

class SingleSelectFromListValueFormFieldRowWidget<T> extends StatelessWidget {
  final String label;
  final String? description;
  final String? descriptionOnDisabled;

  final SingleSelectFromListValueIconMapper<T?>? valueIconMapper;
  final SingleSelectFromListValueTitleMapper<T?> valueTitleMapper;
  final SingleSelectFromListValueKeyMapper<T?>? valueKeyMapper;
  final bool displayIconInRow;
  final bool displayIconInDialog;

  SingleSelectFromListValueFormFieldRowWidget({
    required this.label,
    required this.valueTitleMapper,
    this.valueKeyMapper,
    required this.description,
    required this.descriptionOnDisabled,
    required this.displayIconInRow,
    required this.displayIconInDialog,
    required this.valueIconMapper,
  }) {
    if (displayIconInRow || displayIconInDialog) {
      assert(
        valueIconMapper != null,
        'valueIconMapper required if display icon enabled',
      );
    }
  }

  @override
  Widget build(BuildContext context) => SimpleFediFormFieldRow(
        label: label,
        description: description,
        descriptionOnDisabled: descriptionOnDisabled,
        valueChild: _SingleSelectFromListValueFormFieldRowValueWidget<T>(
          displayIconInRow: displayIconInRow,
          displayIconInDialog: displayIconInDialog,
          label: label,
          valueIconMapper: valueIconMapper,
          valueTitleMapper: valueTitleMapper,
          valueKeyMapper: valueKeyMapper,
        ),
      );
}

class _SingleSelectFromListValueFormFieldRowValueWidget<T>
    extends StatelessWidget {
  final String label;
  final bool displayIconInRow;
  final SingleSelectFromListValueIconMapper<T?>? valueIconMapper;
  final SingleSelectFromListValueTitleMapper<T?> valueTitleMapper;
  final SingleSelectFromListValueKeyMapper<T?>? valueKeyMapper;
  final bool displayIconInDialog;

  const _SingleSelectFromListValueFormFieldRowValueWidget({
    required this.label,
    required this.valueTitleMapper,
    required this.displayIconInRow,
    required this.displayIconInDialog,
    required this.valueIconMapper,
    required this.valueKeyMapper,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          var fieldBloc = ISingleSelectFromListValueFormFieldBloc.of<T>(
            context,
            listen: false,
          );
          if (fieldBloc.isEnabled) {
            _showDialog(
              context: context,
              fieldBloc: fieldBloc,
              label: label,
              valueIconMapper: valueIconMapper,
              valueTitleMapper: valueTitleMapper,
              valueKeyMapper: valueKeyMapper,
              displayIconInDialog: displayIconInDialog,
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            // ignore: no-magic-number
            vertical: FediSizes.smallPadding / 2,
            horizontal: FediSizes.mediumPadding,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (displayIconInRow)
                _SingleSelectFromListValueFormFieldRowValueIconWidget<T>(
                  label: label,
                  valueIconMapper: valueIconMapper,
                  valueTitleMapper: valueTitleMapper,
                  valueKeyMapper: valueKeyMapper,
                  displayIconInDialog: displayIconInDialog,
                ),
              _SingleSelectFromListValueFormFieldRowValueTitleWidget<T>(
                valueTitleMapper: valueTitleMapper,
              ),
            ],
          ),
        ),
      );
}

class _SingleSelectFromListValueFormFieldRowValueTitleWidget<T>
    extends StatelessWidget {
  const _SingleSelectFromListValueFormFieldRowValueTitleWidget({
    Key? key,
    required this.valueTitleMapper,
  }) : super(key: key);

  final SingleSelectFromListValueTitleMapper<T?> valueTitleMapper;

  @override
  Widget build(BuildContext context) {
    var fieldBloc = ISingleSelectFromListValueFormFieldBloc.of<T>(context);
    //
    var fediUiTextTheme = IFediUiTextTheme.of(context);

    return StreamBuilder<bool?>(
      stream: fieldBloc.isEnabledStream,
      initialData: fieldBloc.isEnabled,
      builder: (context, snapshot) {
        var isEnabled = snapshot.data;

        return StreamBuilder<T?>(
          stream: fieldBloc.currentValueStream,
          initialData: fieldBloc.currentValue,
          builder: (context, snapshot) {
            var currentValue = snapshot.data;

            return Text(
              valueTitleMapper(context, currentValue),
              style: isEnabled!
                  ? fediUiTextTheme.mediumShortDarkGrey
                  : fediUiTextTheme.mediumShortLightGrey,
            );
          },
        );
      },
    );
  }
}

class _SingleSelectFromListValueFormFieldRowValueIconWidget<T>
    extends StatelessWidget {
  const _SingleSelectFromListValueFormFieldRowValueIconWidget({
    Key? key,
    required this.label,
    required this.valueIconMapper,
    required this.valueTitleMapper,
    required this.valueKeyMapper,
    required this.displayIconInDialog,
  }) : super(key: key);

  final String label;
  final SingleSelectFromListValueIconMapper<T?>? valueIconMapper;
  final SingleSelectFromListValueTitleMapper<T?> valueTitleMapper;
  final SingleSelectFromListValueKeyMapper<T?>? valueKeyMapper;
  final bool displayIconInDialog;

  @override
  Widget build(BuildContext context) {
    var fieldBloc = ISingleSelectFromListValueFormFieldBloc.of<T>(context);

    var fediUiColorTheme = IFediUiColorTheme.of(context);

    return StreamBuilder<bool>(
      stream: fieldBloc.isEnabledStream,
      initialData: fieldBloc.isEnabled,
      builder: (context, snapshot) {
        var isEnabled = snapshot.data!;

        return StreamBuilder<T?>(
          stream: fieldBloc.currentValueStream,
          initialData: fieldBloc.currentValue,
          builder: (context, snapshot) {
            var currentValue = snapshot.data;

            return FediIconButton(
              color: isEnabled
                  ? fediUiColorTheme.darkGrey
                  : fediUiColorTheme.lightGrey,
              onPressed: () {
                _showDialog(
                  context: context,
                  fieldBloc: fieldBloc,
                  label: label,
                  valueIconMapper: valueIconMapper,
                  valueTitleMapper: valueTitleMapper,
                  valueKeyMapper: valueKeyMapper,
                  displayIconInDialog: displayIconInDialog,
                );
              },
              icon: Icon(
                valueIconMapper!(context, currentValue),
              ),
            );
          },
        );
      },
    );
  }
}

// ignore: long-parameter-list
void _showDialog<T>({
  required BuildContext context,
  required String label,
  required ISingleSelectFromListValueFormFieldBloc<T> fieldBloc,
  required SingleSelectFromListValueIconMapper<T?>? valueIconMapper,
  required SingleSelectFromListValueTitleMapper<T?> valueTitleMapper,
  required SingleSelectFromListValueKeyMapper<T?>? valueKeyMapper,
  required bool displayIconInDialog,
}) {
  var actions = <SelectionDialogAction>[
    if (fieldBloc.isNullValuePossible)
      _buildDialogAction<T>(
        context: context,
        fieldBloc: fieldBloc,
        value: null,
        selectedValue: fieldBloc.currentValue,
        valueIconMapper: valueIconMapper,
        valueTitleMapper: valueTitleMapper,
        displayIconInDialog: displayIconInDialog,
        valueKeyMapper: valueKeyMapper,
      ),
    ...fieldBloc.possibleValues.map(
      (value) => _buildDialogAction(
        context: context,
        fieldBloc: fieldBloc,
        value: value,
        selectedValue: fieldBloc.currentValue,
        valueIconMapper: valueIconMapper,
        valueTitleMapper: valueTitleMapper,
        valueKeyMapper: valueKeyMapper,
        displayIconInDialog: displayIconInDialog,
      ),
    ),
  ];

  showFediSingleSelectionChooserDialog<void>(
    context: context,
    title: label,
    actions: actions,
  );
}

// todo: refactor long-parameter-list
// ignore: long-parameter-list
SelectionDialogAction _buildDialogAction<T>({
  required BuildContext context,
  required ISingleSelectFromListValueFormFieldBloc<T> fieldBloc,
  required T? value,
  required T? selectedValue,
  required SingleSelectFromListValueIconMapper<T?>? valueIconMapper,
  required SingleSelectFromListValueTitleMapper<T?> valueTitleMapper,
  required SingleSelectFromListValueKeyMapper<T?>? valueKeyMapper,
  required bool displayIconInDialog,
}) =>
    SelectionDialogAction(
      key: valueKeyMapper != null ? valueKeyMapper(context, value) : null,
      icon: displayIconInDialog ? valueIconMapper!(context, value) : null,
      label: valueTitleMapper(context, value),
      onAction: (context) {
        // null cases dont execute onAction
        // todo: refactoring
        // ignore: null_check_on_nullable_type_parameter
        fieldBloc.changeCurrentValue(value!);
        Navigator.of(context).pop();
      },
      isSelected: value == selectedValue,
    );
