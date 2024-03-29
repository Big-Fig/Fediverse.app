import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi_app/app/timeline/settings/only_in_custom_list/timeline_settings_only_in_custom_list_form_field_bloc.dart';
import 'package:fedi_app/app/ui/dialog/chooser/selection/single/fedi_single_selection_chooser_dialog.dart';
import 'package:fedi_app/app/ui/form/fedi_form_single_choose_custom_field_row.dart';
import 'package:fedi_app/dialog/dialog_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class TimelineSettingsOnlyInCustomListFormFieldRowWidget
    extends StatelessWidget {
  final String? description;
  final String descriptionOnDisabled;

  const TimelineSettingsOnlyInCustomListFormFieldRowWidget({
    Key? key,
    required this.description,
    required this.descriptionOnDisabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fieldBloc = ITimelineSettingsOnlyInCustomListFormFieldBloc.of(context);

    return StreamBuilder<IUnifediApiList?>(
      stream: fieldBloc.currentValueStream,
      initialData: fieldBloc.currentValue,
      builder: (context, snapshot) {
        var currentValue = snapshot.data;

        return FediFormSingleChooseCustomFromListFieldRow<IUnifediApiList?>(
          isEnabled: fieldBloc.isEnabled,
          description: description,
          descriptionOnDisabled: descriptionOnDisabled,
          error: fieldBloc.isHaveAtLeastOneError
              ? S.of(context).form_field_value_error_null_desc
              : null,
          isNullValuePossible: fieldBloc.isNullValuePossible,
          clearCallback: () {
            fieldBloc.changeCurrentValue(null);
          },
          startCustomSelectCallback: () async {
            var unifediListService =
                Provider.of<IUnifediApiListService>(context, listen: false);

            var dialogResult =
                await UnifediAsyncOperationHelper.performUnifediAsyncOperation(
              context: context,
              asyncCode: () async => unifediListService.getLists(),
            );

            if (dialogResult.success) {
              var remoteLists = dialogResult.result!;

              await showFediSingleSelectionChooserDialog<void>(
                context: context,
                title: S
                    .of(context)
                    .app_timeline_settings_onlyInRemoteList_field_chooser_dialog_title,
                actions: remoteLists
                    .map(
                      (remoteList) => SelectionDialogAction(
                        key: null,
                        isSelected: remoteList.id == fieldBloc.currentValue?.id,
                        label: remoteList.title,
                        onAction: (context) {
                          fieldBloc.changeCurrentValue(remoteList);
                          Navigator.of(context).pop();
                        },
                      ),
                    )
                    .toList(),
              );
            }
          },
          label:
              S.of(context).app_timeline_settings_onlyInRemoteList_field_label,
          value: currentValue,
          valueToTextMapper: (unifediList) =>
              unifediList?.title ??
              S.of(context).app_timeline_settings_onlyInRemoteList_field_null,
          valueToIconMapper: null,
        );
      },
    );
  }
}
