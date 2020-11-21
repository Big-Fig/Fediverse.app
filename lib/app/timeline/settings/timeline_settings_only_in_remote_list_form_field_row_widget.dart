import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_selection_chooser_dialog.dart';
import 'package:fedi/app/ui/form/fedi_form_single_choose_custom_field_row.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/list/pleroma_list_model.dart';
import 'package:fedi/pleroma/list/pleroma_list_service.dart';
import 'package:fedi/form/field/value/form_value_field_bloc.dart';
import 'package:flutter/cupertino.dart';

class TimelineSettingsOnlyInRemoteListFormFieldRowWidget
    extends StatelessWidget {
  final IFormValueFieldBloc<PleromaList> formValueFieldBloc;
  final bool enabled;
  final String desc;
  final bool nullable;

  TimelineSettingsOnlyInRemoteListFormFieldRowWidget({
    @required this.formValueFieldBloc,
    this.enabled = true,
    @required this.desc,
    @required this.nullable,
  });

  @override
  Widget build(BuildContext context) => StreamBuilder<PleromaList>(
      stream: formValueFieldBloc.currentValueStream,
      initialData: formValueFieldBloc.currentValue,
      builder: (context, snapshot) {
        var currentValue = snapshot.data;
        return FediFormSingleChooseCustomFromListFieldRow<PleromaList>(
          enabled: enabled,
          desc: desc,
          error: formValueFieldBloc.isHaveAtLeastOneError
              ? S.of(context).form_field_value_error_null_desc
              : null,
          nullable: nullable,
          clearCallback: () {
            formValueFieldBloc.changeCurrentValue(null);
          },
          startCustomSelectCallback: () async {
            var pleromaListService =
                IPleromaListService.of(context, listen: false);

            var dialogResult =
                await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
                    context: context,
                    asyncCode: () async {
                      return await pleromaListService.getLists();
                    });

            if (dialogResult.success) {
              var remoteLists = dialogResult.result;

              showFediSelectionChooserDialog(
                context: context,
                title: S
                    .of(context)
                    .app_timeline_settings_onlyInRemoteList_field_chooser_dialog_title,
                actions: remoteLists
                    .map(
                      (remoteList) => SelectionDialogAction(
                        isSelected: remoteList?.id ==
                            formValueFieldBloc.currentValue?.id,
                        label: remoteList.title,
                        onAction: (context) {
                          formValueFieldBloc.changeCurrentValue(remoteList);
                          Navigator.of(context).pop();
                        },
                      ),
                    )
                    .toList(),
              );
            }
          },
          label: S.of(context).app_timeline_settings_onlyInRemoteList_field_label,
          value: currentValue,
          valueToTextMapper: (pleromaList) =>
              pleromaList?.title ??
                  S.of(context).app_timeline_settings_onlyInRemoteList_field_null,
          valueToIconMapper: null,
        );
      });
}
