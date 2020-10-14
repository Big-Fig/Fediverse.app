import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';

class EditCustomListAppBarSaveActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var editCustomListBloc = IEditCustomListBloc.of(context, listen: false);
    return StreamBuilder<bool>(
        stream: editCustomListBloc.isReadyToSubmitStream,
        initialData: editCustomListBloc.isReadyToSubmit,
        builder: (context, snapshot) {
          var isReadyToSave = snapshot.data;
          return FediIconButton(
            icon: Icon(FediIcons.check),
            onPressed: isReadyToSave
                ? () async {
                    await PleromaAsyncOperationHelper
                        .performPleromaAsyncOperation(
                            context: context,
                            asyncCode: () async {
                              await editCustomListBloc.submit();
                            });

                    Navigator.of(context).pop();
                  }
                : null,
          );
        });
  }
}
