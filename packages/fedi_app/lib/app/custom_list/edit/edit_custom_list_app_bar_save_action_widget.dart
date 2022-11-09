import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi_app/app/custom_list/edit/edit_custom_list_bloc.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_app_bar_text_action_widget.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class EditCustomListAppBarSaveActionWidget extends StatelessWidget {
  const EditCustomListAppBarSaveActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editCustomListBloc = IEditCustomListBloc.of(context);

    return StreamBuilder<bool>(
      stream: editCustomListBloc.isReadyToSubmitStream,
      builder: (context, snapshot) {
        var isReadyToSave = snapshot.data ?? false;

        return FediPageAppBarTextActionWidget(
          text: S.of(context).app_account_my_customList_edit_action_save,
          onPressed: isReadyToSave
              ? () async {
                  // ignore: avoid-ignoring-return-values
                  await UnifediAsyncOperationHelper
                      .performUnifediAsyncOperation(
                    context: context,
                    asyncCode: () => editCustomListBloc.submit(),
                  );

                  Navigator.of(context).pop();
                }
              : null,
        );
      },
    );
  }
}
