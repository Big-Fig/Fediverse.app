import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi_app/app/filter/edit/edit_filter_bloc.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_app_bar_text_action_widget.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class EditFilterAppBarSaveActionWidget extends StatelessWidget {
  const EditFilterAppBarSaveActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editFilterBloc = IEditFilterBloc.of(context);

    return StreamBuilder<bool>(
      stream: editFilterBloc.isReadyToSubmitStream,
      builder: (context, snapshot) {
        var isReadyToSave = snapshot.data ?? false;

        return FediPageAppBarTextActionWidget(
          text: S.of(context).app_filter_edit_action_save,
          onPressed: isReadyToSave
              ? () async {
                  // ignore: avoid-ignoring-return-values
                  await UnifediAsyncOperationHelper
                      .performUnifediAsyncOperation(
                    context: context,
                    asyncCode: () => editFilterBloc.submit(),
                  );

                  Navigator.of(context).pop();
                }
              : null,
        );
      },
    );
  }
}
