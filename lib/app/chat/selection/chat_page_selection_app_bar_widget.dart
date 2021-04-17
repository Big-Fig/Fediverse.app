import 'package:fedi/app/chat/selection/chat_selection_bloc.dart';
import 'package:fedi/app/ui/button/fedi_text_button.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_custom_app_bar.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPageSelectionAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final PreferredSizeWidget emptySelectionAppBar;

  const ChatPageSelectionAppBarWidget({
    Key? key,
    required this.emptySelectionAppBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chatSelectionBloc = IChatSelectionBloc.of(context);
    return StreamBuilder<bool>(
      stream: chatSelectionBloc.isSomethingSelectedStream,
      builder: (context, snapshot) {
        var isSomethingSelected = snapshot.data ?? false;
        if (isSomethingSelected) {
          return FediPageCustomAppBar(
            leading: const SizedBox.shrink(),
            actions: [
              FediTextButton(
                text: S.of(context).app_chat_selection_action_cancel,
                onPressed: () {
                  chatSelectionBloc.clearSelection();
                },
              ),
            ],
            child: const SizedBox.shrink(),
          );
        } else {
          return emptySelectionAppBar;
        }
      },
    );
  }

  @override
  Size get preferredSize => FediPageCustomAppBar.calculatePreferredSize();
}
