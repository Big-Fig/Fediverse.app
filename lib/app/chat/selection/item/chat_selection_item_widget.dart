import 'package:fedi/app/chat/selection/chat_selection_bloc.dart';
import 'package:fedi/app/chat/selection/item/chat_selection_item_bloc.dart';
import 'package:fedi/app/chat/selection/item/chat_selection_item_toggle_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatSelectionItemWidget extends StatelessWidget {
  final Widget child;

  const ChatSelectionItemWidget({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var chatSelectionBloc = IChatSelectionBloc.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: InkWell(
            onLongPress: () {
              var isSomethingSelected = chatSelectionBloc.isSomethingSelected;

              if (!isSomethingSelected) {
                var chatSelectionItemBloc = IChatSelectionItemBloc.of(
                  context,
                  listen: false,
                );
                chatSelectionItemBloc.select();
              }
            },
            child: child,
          ),
        ),
        StreamBuilder<bool>(
          stream: chatSelectionBloc.isSomethingSelectedStream,
          builder: (context, snapshot) {
            var isSomethingSelected = snapshot.data ?? false;

            if (isSomethingSelected) {
              return const ChatSelectionItemToggleButtonWidget();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
