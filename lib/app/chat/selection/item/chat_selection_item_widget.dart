import 'package:fedi/app/chat/selection/chat_selection_bloc.dart';
import 'package:fedi/app/chat/selection/item/chat_selection_item_bloc.dart';
import 'package:fedi/app/chat/selection/item/chat_selection_item_toggle_button_widget.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatSelectionItemWidget extends StatelessWidget {
  final Widget child;

  const ChatSelectionItemWidget({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var chatSelectionBloc = IChatSelectionBloc.of(context);

    var chatSelectionItemBloc = IChatSelectionItemBloc.of(context);

    return StreamBuilder<bool>(
      stream: chatSelectionItemBloc.isSelectedStream,
      builder: (
        context,
        snapshot,
      ) {
        var isSelected = snapshot.data ?? false;

        return Container(
          color: isSelected
              // todo: refactor
              // ignore: no-magic-number
              ? IFediUiColorTheme.of(context).primaryDark.withOpacity(0.1)
              : null,
          child: StreamBuilder<bool>(
            stream: chatSelectionItemBloc.isSelectionPossibleStream,
            builder: (
              context,
              snapshot,
            ) {
              var isSelectionPossible = snapshot.data ?? false;

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder<bool>(
                    stream: chatSelectionBloc.isSomethingSelectedStream,
                    builder: (
                      context,
                      snapshot,
                    ) {
                      var isSomethingSelected = snapshot.data ?? false;

                      if (isSomethingSelected) {
                        return const ChatSelectionItemToggleButtonWidget();
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                  Expanded(
                    child: InkWell(
                      onLongPress: isSelectionPossible
                          ? () {
                              var isSomethingSelected =
                                  chatSelectionBloc.isSomethingSelected;

                              if (!isSomethingSelected) {
                                var chatSelectionItemBloc =
                                    IChatSelectionItemBloc.of(
                                  context,
                                  listen: false,
                                );
                                chatSelectionItemBloc.select();
                              }
                            }
                          : null,
                      child: child,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
