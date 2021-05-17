import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_bloc.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_app_bar_text_action_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class EditCustomListAppBarSaveActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var editCustomListBloc = IEditCustomListBloc.of(context);

    return StreamBuilder<bool>(
      stream: editCustomListBloc.isReadyToSubmitStream,
      builder: (context, snapshot) {
        var isReadyToSave = snapshot.data ?? false;

        return FediPageAppBarTextActionWidget(
          text: S.of(context).app_acccount_my_customList_edit_action_save,
          onPressed: isReadyToSave
              ? () async {
                  await PleromaAsyncOperationHelper
                      .performPleromaAsyncOperation(
                    context: context,
                    asyncCode: () async {
                      await editCustomListBloc.submit();
                    },
                  );

                  Navigator.of(context).pop();
                }
              : null,
        );
      },
    );
  }

  const EditCustomListAppBarSaveActionWidget();
}
