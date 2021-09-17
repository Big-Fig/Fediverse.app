import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/timeline/settings/only_in_custom_list/timeline_settings_only_in_custom_list_form_field_bloc.dart';
import 'package:fedi/app/ui/dialog/chooser/selection/single/fedi_single_selection_chooser_dialog.dart';
import 'package:fedi/app/ui/form/fedi_form_single_choose_custom_field_row.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class TimelineSettingsOnlyInCustomListFormFieldRowWidget
    extends StatelessWidget {
  final String? description;
  final String descriptionOnDisabled;

  TimelineSettingsOnlyInCustomListFormFieldRowWidget({
    required this.description,
    required this.descriptionOnDisabled,
  });

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
            var pleromaListService =
                Provider.of<IUnifediApiListService>(context, listen: false);

            var dialogResult =
                await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
              context: context,
              asyncCode: () async {
                return await pleromaListService.getLists();
              },
            );

            if (dialogResult.success) {
              var remoteLists = dialogResult.result!;

              await showFediSingleSelectionChooserDialog(
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
          valueToTextMapper: (pleromaList) =>
              pleromaList?.title ??
              S.of(context).app_timeline_settings_onlyInRemoteList_field_null,
          valueToIconMapper: null,
        );
      },
    );
  }
}
