import 'package:fedi/app/chat/selection/action/chat_selection_action_list_widget.dart';
import 'package:fedi/app/chat/selection/chat_selection_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class ChatSelectionWidget extends StatelessWidget {
  const ChatSelectionWidget();

  @override
  Widget build(BuildContext context) {
    var chatSelectionBloc = IChatSelectionBloc.of(context);

    return StreamBuilder<bool>(
      stream: chatSelectionBloc.isSomethingSelectedStream,
      builder: (context, snapshot) {
        var isSomethingSelected = snapshot.data ?? false;

        if (isSomethingSelected) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: FediPadding.horizontalBigPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const _ChatSelectionCountWidget(),
                    const ChatSelectionActionListWidget(),
                  ],
                ),
              ),
              const FediUltraLightGreyDivider(),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _ChatSelectionCountWidget extends StatelessWidget {
  const _ChatSelectionCountWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chatSelectionBloc = IChatSelectionBloc.of(context);
    return StreamBuilder<int>(
      stream: chatSelectionBloc.selectedItemsCountStream,
      builder: (context, snapshot) {
        var selectedItemsCount = snapshot.data ?? 0;

        if (selectedItemsCount == 0) {
          return const SizedBox.shrink();
        } else {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FediIconButton(
                icon: Icon(FediIcons.remove),
                color: IFediUiColorTheme.of(context).darkGrey,
                onPressed: () {
                  chatSelectionBloc.clearSelection();
                },
              ),
              Text(
                S.of(context).app_chat_selection_count(selectedItemsCount),
                style: IFediUiTextTheme.of(context).bigBoldDarkGrey,
              ),
            ],
          );
        }
      },
    );
  }
}
