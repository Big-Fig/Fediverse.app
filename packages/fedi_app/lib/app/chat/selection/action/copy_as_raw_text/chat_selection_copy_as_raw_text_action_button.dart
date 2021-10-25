import 'package:fedi_app/app/chat/selection/chat_selection_bloc.dart';
import 'package:fedi_app/app/toast/toast_service.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ChatSelectionCopyAsRawTextActionButtonWidget extends StatelessWidget {
  const ChatSelectionCopyAsRawTextActionButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediIconButton(
        icon: const Icon(FediIcons.copy),
        color: IFediUiColorTheme.of(context).darkGrey,
        onPressed: () async {
          var chatSelectionBloc = IChatSelectionBloc.of(context, listen: false);

          var rawText = chatSelectionBloc.calculateSelectionAsRawText();
          await Clipboard.setData(
            ClipboardData(text: rawText),
          );

          chatSelectionBloc.clearSelection();

          IToastService.of(context, listen: false).showInfoToast(
            context: context,
            title: S
                .of(context)
                .app_chat_selection_action_copyAsRawText_toast_success,
            content: null,
          );
        },
      );
}
