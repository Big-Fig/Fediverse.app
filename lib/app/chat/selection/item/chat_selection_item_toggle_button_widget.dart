import 'package:fedi/app/chat/selection/item/chat_selection_item_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';

class ChatSelectionItemToggleButtonWidget extends StatelessWidget {
  const ChatSelectionItemToggleButtonWidget();

  @override
  Widget build(BuildContext context) {
    var chatSelectionItemBloc = IChatSelectionItemBloc.of(context);

    return StreamBuilder<bool>(
      stream: chatSelectionItemBloc.isSelectionPossibleStream,
      initialData: chatSelectionItemBloc.isSelectionPossible,
      builder: (context, snapshot) {
        var isSelectionPossible = snapshot.data ?? true;

        return Column(
          children: [
            StreamBuilder<bool>(
              stream: chatSelectionItemBloc.isSelectedStream,
              builder: (context, snapshot) {
                var isSelected = snapshot.data ?? false;
                return Padding(
                  padding: EdgeInsets.only(left: FediSizes.smallPadding),
                  child: FediIconInCircleTransparentButton(
                    isSelected ? FediIcons.close : FediIcons.plus,
                    iconSize: 12.0,
                    size: 24.0,
                    onPressed: () {
                      if (isSelectionPossible) {
                        if (isSelected) {
                          chatSelectionItemBloc.unSelect();
                        } else {
                          chatSelectionItemBloc.select();
                        }
                      }
                    },
                    color: isSelectionPossible
                        ? isSelected
                            ? IFediUiColorTheme.of(context).error
                            : IFediUiColorTheme.of(context).primaryDark
                        : IFediUiColorTheme.of(context).ultraLightGrey,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
