import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_selection_chooser_dialog.dart';
import 'package:fedi/app/ui/form/fedi_form_single_choose_custom_field_row.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/pleroma/list/pleroma_list_model.dart';
import 'package:fedi/pleroma/list/pleroma_list_service.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:flutter/cupertino.dart';

class TimelineSettingsOnlyInRemoteListFormFieldRowWidget
    extends StatelessWidget {
  final IFormValueFieldBloc<PleromaList> formValueFieldBloc;
  final bool enabled;
  final String desc;

  TimelineSettingsOnlyInRemoteListFormFieldRowWidget({
    @required this.formValueFieldBloc,
    this.enabled = true,
    @required this.desc,
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
              ? "form.field.value.error.null.desc".tr()
              : null,
          nullable: true,
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
                title:
                    "app.timeline.settings.only_in_remote_list.field.chooser.dialog.title"
                        .tr(),
                actions: remoteLists
                    .map(
                      (remoteList) => SelectionDialogAction(
                        isSelected: remoteList?.id ==
                            formValueFieldBloc.currentValue?.id,
                        label: remoteList.title,
                        onAction: () {
                          formValueFieldBloc.changeCurrentValue(remoteList);
                          Navigator.of(context).pop();
                        },
                      ),
                    )
                    .toList(),
              );
            }
          },
          label: "app.timeline.settings.only_in_remote_list.field.label".tr(),
          value: currentValue,
          valueToTextMapper: (pleromaList) =>
              pleromaList?.title ??
              "app.timeline.settings.only_in_remote_list.field.null".tr(),
          valueToIconMapper: null,
        );
      });
}
