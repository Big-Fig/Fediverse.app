import 'package:fedi_app/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi_app/app/ui/dialog/chooser/selection/multi/fedi_multi_selection_chooser_dialog.dart';
import 'package:fedi_app/app/ui/form/fedi_form_field_row.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/dialog/dialog_model.dart';
import 'package:fedi_app/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

// todo: refactor with single selection
typedef MultiSelectFromListValueKeyMapper<T> = Key? Function(
  BuildContext context,
  T value,
);
typedef MultiSelectFromListValueIconMapper<T> = IconData Function(
  BuildContext context,
  T value,
);
typedef MultiSelectFromListValueTitleMapper<T> = String Function(
  BuildContext context,
  T value,
);

class MultiSelectFromListValueFormFieldRowWidget<T> extends StatelessWidget {
  final String label;
  final String? description;
  final String? descriptionOnDisabled;

  final MultiSelectFromListValueIconMapper<T>? valueIconMapper;
  final MultiSelectFromListValueTitleMapper<T> valueTitleMapper;
  final MultiSelectFromListValueKeyMapper<T>? valueKeyMapper;
  final bool displayIconInRow;
  final bool displayIconInDialog;

  MultiSelectFromListValueFormFieldRowWidget({
    Key? key,
    required this.label,
    required this.valueTitleMapper,
    required this.description,
    required this.descriptionOnDisabled,
    required this.displayIconInRow,
    required this.displayIconInDialog,
    required this.valueIconMapper,
    required this.valueKeyMapper,
  }) : super(key: key) {
    // todo: refactor
    if (displayIconInRow || displayIconInDialog) {
      assert(
        valueIconMapper != null,
        'icon mapper should exist if display icon  enabled',
      );
    }
  }

  @override
  Widget build(BuildContext context) => SimpleFediFormFieldRow(
        label: label,
        description: description,
        descriptionOnDisabled: descriptionOnDisabled,
        valueChild: _MultiSelectFromListValueFormFieldRowValueWidget<T>(
          displayIconInRow: displayIconInRow,
          displayIconInDialog: displayIconInDialog,
          label: label,
          valueIconMapper: valueIconMapper,
          valueTitleMapper: valueTitleMapper,
          valueKeyMapper: valueKeyMapper,
        ),
      );
}

class _MultiSelectFromListValueFormFieldRowValueWidget<T>
    extends StatelessWidget {
  final String label;
  final bool displayIconInRow;
  final MultiSelectFromListValueIconMapper<T>? valueIconMapper;
  final MultiSelectFromListValueKeyMapper<T>? valueKeyMapper;
  final MultiSelectFromListValueTitleMapper<T> valueTitleMapper;
  final bool displayIconInDialog;

  const _MultiSelectFromListValueFormFieldRowValueWidget({
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
          var fieldBloc = IMultiSelectFromListValueFormFieldBloc.of<T>(
            context,
            listen: false,
          );
          if (fieldBloc.isEnabled) {
            // ignore: avoid-ignoring-return-values
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (displayIconInRow)
              _MultiSelectFromListValueFormFieldRowValueIconWidget<T>(
                label: label,
                valueIconMapper: valueIconMapper,
                valueTitleMapper: valueTitleMapper,
                valueKeyMapper: valueKeyMapper,
                displayIconInDialog: displayIconInDialog,
              ),
            _MultiSelectFromListValueFormFieldRowValueTitleWidget<T>(
              valueTitleMapper: valueTitleMapper,
            ),
          ],
        ),
      );
}

class _MultiSelectFromListValueFormFieldRowValueTitleWidget<T>
    extends StatelessWidget {
  const _MultiSelectFromListValueFormFieldRowValueTitleWidget({
    Key? key,
    required this.valueTitleMapper,
  }) : super(key: key);

  final MultiSelectFromListValueTitleMapper<T> valueTitleMapper;

  @override
  Widget build(BuildContext context) {
    var fieldBloc = IMultiSelectFromListValueFormFieldBloc.of<T>(context);
    //
    var fediUiTextTheme = IFediUiTextTheme.of(context);

    return StreamBuilder<bool?>(
      stream: fieldBloc.isEnabledStream,
      initialData: fieldBloc.isEnabled,
      builder: (context, snapshot) {
        var isEnabled = snapshot.data;

        return StreamBuilder<List<T>?>(
          stream: fieldBloc.currentValueStream,
          initialData: fieldBloc.currentValue,
          builder: (context, snapshot) {
            var currentValueList = snapshot.data ?? [];

            return Text(
              currentValueList.isNotEmpty
                  ? currentValueList
                      .map(
                        (currentValue) =>
                            valueTitleMapper(context, currentValue),
                      )
                      .join('\n')
                  : S.of(context).app_filter_context_empty,
              textAlign: TextAlign.end,
              style: isEnabled!
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
    Key? key,
    required this.label,
    required this.valueIconMapper,
    required this.valueTitleMapper,
    required this.valueKeyMapper,
    required this.displayIconInDialog,
  }) : super(key: key);

  final String label;
  final MultiSelectFromListValueIconMapper<T>? valueIconMapper;
  final MultiSelectFromListValueTitleMapper<T> valueTitleMapper;
  final MultiSelectFromListValueKeyMapper<T>? valueKeyMapper;
  final bool displayIconInDialog;

  @override
  Widget build(BuildContext context) {
    var fieldBloc = IMultiSelectFromListValueFormFieldBloc.of<T>(context);

    var fediUiColorTheme = IFediUiColorTheme.of(context);

    return StreamBuilder<bool?>(
      stream: fieldBloc.isEnabledStream,
      initialData: fieldBloc.isEnabled,
      builder: (context, snapshot) {
        var isEnabled = snapshot.data;

        return StreamBuilder<List<T>?>(
          stream: fieldBloc.currentValueStream,
          initialData: fieldBloc.currentValue,
          builder: (context, snapshot) {
            var currentValueList = snapshot.data;

            return Column(
              children: currentValueList
                      ?.map(
                        (currentValue) => FediIconButton(
                          color: isEnabled!
                              ? fediUiColorTheme.darkGrey
                              : fediUiColorTheme.lightGrey,
                          onPressed: () {
                            // ignore: avoid-ignoring-return-values
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
                        ),
                      )
                      .toList() ??
                  [],
            );
          },
        );
      },
    );
  }
}

// ignore: long-parameter-list
Future<T?> _showDialog<T>({
  required BuildContext context,
  required String label,
  required IMultiSelectFromListValueFormFieldBloc<T> fieldBloc,
  required MultiSelectFromListValueIconMapper<T>? valueIconMapper,
  required MultiSelectFromListValueTitleMapper<T> valueTitleMapper,
  required MultiSelectFromListValueKeyMapper<T>? valueKeyMapper,
  required bool displayIconInDialog,
}) async {
  var isNeedRebuildActionsStream = fieldBloc.isNeedRebuildActionsStream;

  var actionsSubject = BehaviorSubject<List<SelectionDialogAction>>.seeded(
    _calculateActions(
      fieldBloc: fieldBloc,
      context: context,
      valueIconMapper: valueIconMapper,
      valueTitleMapper: valueTitleMapper,
      valueKeyMapper: valueKeyMapper,
      displayIconInDialog: displayIconInDialog,
    ),
  );

  var subscription = isNeedRebuildActionsStream.listen(
    (_) {
      actionsSubject.add(
        _calculateActions(
          fieldBloc: fieldBloc,
          context: context,
          valueIconMapper: valueIconMapper,
          valueTitleMapper: valueTitleMapper,
          valueKeyMapper: valueKeyMapper,
          displayIconInDialog: displayIconInDialog,
        ),
      );
    },
  );

  var result = await showFediMultiSelectionChooserDialog<T>(
    context: context,
    title: label,
    isNeedRebuildActionsStream: actionsSubject.stream,
  );

  await subscription.cancel();

  // ignore: avoid-ignoring-return-values
  await actionsSubject.close();

  return result;
}

List<SelectionDialogAction> _calculateActions<T>({
  required BuildContext context,
  required IMultiSelectFromListValueFormFieldBloc<T> fieldBloc,
  required MultiSelectFromListValueIconMapper<T>? valueIconMapper,
  required MultiSelectFromListValueTitleMapper<T> valueTitleMapper,
  required MultiSelectFromListValueKeyMapper<T>? valueKeyMapper,
  required bool displayIconInDialog,
}) {
  var result = <SelectionDialogAction>[
    ...fieldBloc.possibleValues.map(
      (value) => _buildDialogAction(
        context: context,
        fieldBloc: fieldBloc,
        value: value,
        selectedValues: fieldBloc.currentValue,
        valueIconMapper: valueIconMapper,
        valueTitleMapper: valueTitleMapper,
        valueKeyMapper: valueKeyMapper,
        displayIconInDialog: displayIconInDialog,
      ),
    ),
  ];

  return result;
}

// todo: refactor long-parameter-list
// ignore: long-parameter-list, code-metrics
SelectionDialogAction _buildDialogAction<T>({
  required BuildContext context,
  required IMultiSelectFromListValueFormFieldBloc<T> fieldBloc,
  required T value,
  required List<T>? selectedValues,
  required MultiSelectFromListValueIconMapper<T>? valueIconMapper,
  required MultiSelectFromListValueTitleMapper<T> valueTitleMapper,
  required MultiSelectFromListValueKeyMapper<T>? valueKeyMapper,
  required bool displayIconInDialog,
}) =>
    SelectionDialogAction(
      key: valueKeyMapper != null ? valueKeyMapper(context, value) : null,
      icon: displayIconInDialog ? valueIconMapper!(context, value) : null,
      label: valueTitleMapper(context, value),
      onAction: (context) {
        fieldBloc.toggleValue(value);
      },
      isSelected: selectedValues?.contains(value) ?? false,
    );
