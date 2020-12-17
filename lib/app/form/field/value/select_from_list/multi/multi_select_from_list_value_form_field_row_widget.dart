import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/dialog/chooser/selection/multi/fedi_multi_selection_chooser_dialog.dart';
import 'package:fedi/app/ui/form/fedi_form_field_row.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// todo: refactor with single selection
typedef MultiSelectFromListValueIconMapper<T> = IconData Function(
    BuildContext context, T value);
typedef MultiSelectFromListValueTitleMapper<T> = String Function(
    BuildContext context, T value);

class MultiSelectFromListValueFormFieldRowWidget<T> extends StatelessWidget {
  final String label;
  final String description;
  final String descriptionOnDisabled;

  final MultiSelectFromListValueIconMapper<T> valueIconMapper;
  final MultiSelectFromListValueTitleMapper<T> valueTitleMapper;
  final bool displayIconInRow;
  final bool displayIconInDialog;

  MultiSelectFromListValueFormFieldRowWidget({
    @required this.label,
    @required this.valueTitleMapper,
    @required this.description,
    @required this.descriptionOnDisabled,
    @required this.displayIconInRow,
    @required this.displayIconInDialog,
    @required this.valueIconMapper,
  }) {
    if (displayIconInRow || displayIconInDialog) {
      assert(valueIconMapper != null);
    }
    assert(valueTitleMapper != null);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleFediFormFieldRow(
      label: label,
      description: description,
      descriptionOnDisabled: descriptionOnDisabled,
      valueChild: _MultiSelectFromListValueFormFieldRowValueWidget<T>(
        displayIconInRow: displayIconInRow,
        displayIconInDialog: displayIconInDialog,
        label: label,
        valueIconMapper: valueIconMapper,
        valueTitleMapper: valueTitleMapper,
      ),
    );
  }
}

class _MultiSelectFromListValueFormFieldRowValueWidget<T>
    extends StatelessWidget {
  final String label;
  final bool displayIconInRow;
  final MultiSelectFromListValueIconMapper<T> valueIconMapper;
  final MultiSelectFromListValueTitleMapper<T> valueTitleMapper;
  final bool displayIconInDialog;

  _MultiSelectFromListValueFormFieldRowValueWidget({
    @required this.label,
    @required this.valueTitleMapper,
    @required this.displayIconInRow,
    @required this.displayIconInDialog,
    @required this.valueIconMapper,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        var fieldBloc = IMultiSelectFromListValueFormFieldBloc.of<T>(context,
            listen: false);
        if (fieldBloc.isEnabled) {
          _showDialog(
            context: context,
            fieldBloc: fieldBloc,
            label: label,
            valueIconMapper: valueIconMapper,
            valueTitleMapper: valueTitleMapper,
            displayIconInDialog: displayIconInDialog,
          );
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (displayIconInRow)
            _MultiSelectFromListValueFormFieldRowValueIconWidget<T>(
                label: label,
                valueIconMapper: valueIconMapper,
                valueTitleMapper: valueTitleMapper,
                displayIconInDialog: displayIconInDialog),
          _MultiSelectFromListValueFormFieldRowValueTitleWidget<T>(
            valueTitleMapper: valueTitleMapper,
          ),
        ],
      ),
    );
  }
}

class _MultiSelectFromListValueFormFieldRowValueTitleWidget<T>
    extends StatelessWidget {
  const _MultiSelectFromListValueFormFieldRowValueTitleWidget({
    Key key,
    @required this.valueTitleMapper,
  }) : super(key: key);

  final MultiSelectFromListValueTitleMapper<T> valueTitleMapper;

  @override
  Widget build(BuildContext context) {
    var fieldBloc = IMultiSelectFromListValueFormFieldBloc.of<T>(context);
    //
    var fediUiTextTheme = IFediUiTextTheme.of(context);
    return StreamBuilder<bool>(
      stream: fieldBloc.isEnabledStream,
      initialData: fieldBloc.isEnabled,
      builder: (context, snapshot) {
        var isEnabled = snapshot.data;
        return StreamBuilder<List<T>>(
          stream: fieldBloc.currentValueStream,
          initialData: fieldBloc.currentValue,
          builder: (context, snapshot) {
            var currentValueList = snapshot.data ?? [];
            return Text(
              currentValueList?.isNotEmpty == true
                  ? currentValueList
                      ?.map(
                        (currentValue) =>
                            valueTitleMapper(context, currentValue),
                      )
                      ?.join("\n")
                  : S.of(context).app_filter_context_empty,
              textAlign: TextAlign.end,
              style: isEnabled
                  ? fediUiTextTheme.mediumTallDarkGrey
                  : fediUiTextTheme.mediumTallLightGrey,
            );
          },
        );
      },
    );
  }
}

class _MultiSelectFromListValueFormFieldRowValueIconWidget<T>
    extends StatelessWidget {
  const _MultiSelectFromListValueFormFieldRowValueIconWidget({
    Key key,
    @required this.label,
    @required this.valueIconMapper,
    @required this.valueTitleMapper,
    @required this.displayIconInDialog,
  }) : super(key: key);

  final String label;
  final MultiSelectFromListValueIconMapper<T> valueIconMapper;
  final MultiSelectFromListValueTitleMapper<T> valueTitleMapper;
  final bool displayIconInDialog;

  @override
  Widget build(BuildContext context) {
    var fieldBloc = IMultiSelectFromListValueFormFieldBloc.of<T>(context);

    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return StreamBuilder<bool>(
      stream: fieldBloc.isEnabledStream,
      initialData: fieldBloc.isEnabled,
      builder: (context, snapshot) {
        var isEnabled = snapshot.data;
        return StreamBuilder<List<T>>(
          stream: fieldBloc.currentValueStream,
          initialData: fieldBloc.currentValue,
          builder: (context, snapshot) {
            var currentValueList = snapshot.data;
            return Column(
              children: currentValueList
                      ?.map(
                        (currentValue) => FediIconButton(
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
                              displayIconInDialog: displayIconInDialog,
                            );
                          },
                          icon: Icon(
                            valueIconMapper(context, currentValue),
                          ),
                        ),
                      )
                      ?.toList() ??
                  [],
            );
          },
        );
      },
    );
  }
}

void _showDialog<T>({
  @required BuildContext context,
  @required String label,
  @required IMultiSelectFromListValueFormFieldBloc<T> fieldBloc,
  @required MultiSelectFromListValueIconMapper<T> valueIconMapper,
  @required MultiSelectFromListValueTitleMapper<T> valueTitleMapper,
  @required bool displayIconInDialog,
}) {
  var actionsStream = fieldBloc.currentValueStream.map((event) {
    return <SelectionDialogAction>[
      if (fieldBloc.isNullValuePossible)
        _buildDialogAction(
          context: context,
          fieldBloc: fieldBloc,
          value: null,
          selectedValues: fieldBloc.currentValue,
          valueIconMapper: valueIconMapper,
          valueTitleMapper: valueTitleMapper,
          displayIconInDialog: displayIconInDialog,
        ),
      ...fieldBloc.possibleValues.map(
        (value) => _buildDialogAction(
          context: context,
          fieldBloc: fieldBloc,
          value: value,
          selectedValues: fieldBloc.currentValue,
          valueIconMapper: valueIconMapper,
          valueTitleMapper: valueTitleMapper,
          displayIconInDialog: displayIconInDialog,
        ),
      ),
    ].toList();
  });

  showFediMultiSelectionChooserDialog(
    context: context,
    title: label,
    rebuildActionsStream: actionsStream,
  );
}

SelectionDialogAction _buildDialogAction<T>({
  @required BuildContext context,
  @required IMultiSelectFromListValueFormFieldBloc<T> fieldBloc,
  @required T value,
  @required List<T> selectedValues,
  @required MultiSelectFromListValueIconMapper<T> valueIconMapper,
  @required MultiSelectFromListValueTitleMapper<T> valueTitleMapper,
  @required bool displayIconInDialog,
}) {
  return SelectionDialogAction(
    icon: displayIconInDialog ? valueIconMapper(context, value) : null,
    label: valueTitleMapper(context, value),
    onAction: (context) {
      fieldBloc.toggleValue(value);
    },
    isSelected: selectedValues?.contains(value) ?? false,
  );
}
