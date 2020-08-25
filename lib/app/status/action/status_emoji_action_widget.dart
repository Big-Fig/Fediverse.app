import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/status/action/status_action_counter_widget.dart';
import 'package:fedi/app/status/emoji_reaction/status_emoji_reaction_picker_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/error/error_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusEmojiActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);
    return Row(
      children: [
        FediIconButton(
          color: FediColors.darkGrey,
          iconSize: FediSizes.bigIconSize,
          icon: Icon(FediIcons.emoji),
          onPressed: () {
            _showEmojiPicker(context, statusBloc);
          },
        ),
        StreamBuilder<int>(
            stream: statusBloc.reblogPlusOriginalEmojiReactionsCountStream,
            initialData: statusBloc.reblogPlusOriginalEmojiReactionsCount,
            builder: (context, snapshot) {
              var emojiCount = snapshot.data;
              if (emojiCount == null) {
                return SizedBox.shrink();
              }

              return StatusActionCounterWidget(
                onPressed: () {
                  _showEmojiPicker(context, statusBloc);
                },
                value: emojiCount,
              );
            }),
      ],
    );
  }

  void _showEmojiPicker(BuildContext context, IStatusBloc statusBloc) {
    showEmojiPickerModalPopup(context,
        emojiReactionSelectedCallback: (String emojiName, String emoji) {
      PleromaAsyncOperationHelper.performPleromaAsyncOperation(
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
