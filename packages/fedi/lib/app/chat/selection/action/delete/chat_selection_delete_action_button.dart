import 'package:fedi/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/chat/selection/chat_selection_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_confirm_alert_dialog.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class ChatSelectionDeleteActionButtonWidget extends StatelessWidget {
  const ChatSelectionDeleteActionButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chatSelectionBloc = IChatSelectionBloc.of(context);
    var chatBloc = IChatBloc.of(context);

    return StreamBuilder<bool>(
      stream: chatSelectionBloc.isAllSelectedItemsFromMeStream,
      builder: (context, snapshot) {
        var isAllSelectedItemsFromMe = snapshot.data ?? true;

        return FediIconButton(
          icon: const Icon(FediIcons.delete),
          color: isAllSelectedItemsFromMe
              ? IFediUiColorTheme.of(context).darkGrey
              : IFediUiColorTheme.of(context).lightGrey,
          onPressed: isAllSelectedItemsFromMe
              ? () {
                  FediConfirmAlertDialog(
                    context: context,
                    title: S
                        .of(context)
                        .app_chat_selection_action_delete_confirm_dialog_title,
                    contentText: S
                        .of(context)
                        .app_chat_selection_action_delete_confirm_dialog_content,
                    okActionLabel: S
                        .of(context)
                        .app_chat_selection_action_delete_confirm_dialog_action_delete,
                    onAction: (context) async {
                      var dialogResult = await UnifediAsyncOperationHelper
                          .performUnifediAsyncOperation(
                        context: context,
                        asyncCode: () async {
                          await chatBloc.deleteMessages(
                            chatSelectionBloc.currentSelection,
                          );
                        },
                      );

                      if (dialogResult.success) {
                        chatSelectionBloc.clearSelection();
                      }

                      Navigator.pop(context);
                    },
                  ).show<void>(context);
                }
              : null,
        );
      },
    );
  }
}
