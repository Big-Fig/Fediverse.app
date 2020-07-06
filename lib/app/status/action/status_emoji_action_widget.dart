import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/emoji_reaction/status_emoji_reaction_picker_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:fedi/error/error_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusEmojiActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);
    return Row(
      children: [
        IconButton(
          color: FediColors.darkGrey,
          iconSize: 20.0,
          icon: Icon(FediIcons.emoji),
          onPressed: () {
            _showEmojiPicker(context, statusBloc);
          },
        ),
        StreamBuilder<int>(
            stream: statusBloc.reblogPlusOriginalEmojiReactionsCountStream,
            initialData: statusBloc.reblogPlusOriginalEmojiReactionsCount,
            builder: (context, snapshot) {
              var favouritesCount = snapshot.data;
              if (favouritesCount == null) {
                return SizedBox.shrink();
              }
              return InkWell(
                  onTap: () {
                    _showEmojiPicker(context, statusBloc);
                  },
                  child: Text(
                    favouritesCount.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      color: FediColors.darkGrey,
                    ),
                  ));
            }),
      ],
    );
  }

  void _showEmojiPicker(BuildContext context, IStatusBloc statusBloc) {
    showEmojiPickerModalPopup(context,
        emojiReactionSelectedCallback: (String emojiName, String emoji) {
      doAsyncOperationWithDialog(
          context: context,
          asyncCode: () => statusBloc.toggleEmojiReaction(emoji: emoji),
          errorDataBuilders: [
            (BuildContext context, dynamic error, StackTrace stackTrace) =>
                ErrorData(
                    error: error,
                    stackTrace: stackTrace,
                    titleText:
                        "app.status.emoji.error.cant_add.dialog.title".tr(),
                    contentText:
                        "app.status.emoji.error.cant_add.dialog.content"
                            .tr(args: [error.toString()]))
          ]);
    });
  }
}
