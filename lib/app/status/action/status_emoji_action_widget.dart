import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/status/action/status_action_counter_widget.dart';
import 'package:fedi/app/status/emoji_reaction/status_emoji_reaction_picker_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/error/error_data_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusEmojiActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        children: [
          const _StatusEmojiActionButtonWidget(),
          const _StatusEmojiActionCounterWidget(),
        ],
      );

  const StatusEmojiActionWidget();
}

class _StatusEmojiActionCounterWidget extends StatelessWidget {
  const _StatusEmojiActionCounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);

    return StreamBuilder<int?>(
      stream: statusBloc.reblogPlusOriginalEmojiReactionsCountStream,
      builder: (context, snapshot) {
        var emojiCount = snapshot.data;
        if (emojiCount == null) {
          return const SizedBox.shrink();
        }

        return Provider<int>.value(
          value: emojiCount,
          child: StatusActionCounterWidget(
            onClick: _showEmojiPicker,
          ),
        );
      },
    );
  }
}

class _StatusEmojiActionButtonWidget extends StatelessWidget {
  const _StatusEmojiActionButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediIconButton(
        color: IFediUiColorTheme.of(context).darkGrey,
        iconSize: FediSizes.bigIconSize,
        icon: Icon(FediIcons.emoji),
        onPressed: () {
          _showEmojiPicker(context);
        },
      );
}

void _showEmojiPicker(BuildContext context) {
  var statusBloc = IStatusBloc.of(context, listen: false);
  showEmojiPickerModalPopup(
    context,
    emojiReactionSelectedCallback: (
      context,
      String emojiName,
      String emoji,
    ) {
      PleromaAsyncOperationHelper.performPleromaAsyncOperation(
        context: context,
        asyncCode: () => statusBloc.toggleEmojiReaction(emoji: emoji),
        errorDataBuilders: [
          (BuildContext? context, dynamic error, StackTrace stackTrace) =>
              ErrorData(
                error: error,
                stackTrace: stackTrace,
                titleCreator: (context) =>
                    S.of(context).app_status_emoji_error_cantAdd_dialog_title,
                contentCreator: (context) =>
                    S.of(context).app_status_emoji_error_cantAdd_dialog_content(
                          error.toString(),
                        ),
              ),
        ],
      );
    },
  );
}
