import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi_app/app/status/action/status_action_counter_widget.dart';
import 'package:fedi_app/app/status/emoji_reaction/status_emoji_reaction_picker_widget.dart';
import 'package:fedi_app/app/status/status_bloc.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/error/error_data_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusEmojiActionWidget extends StatelessWidget {
  const StatusEmojiActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: const [
          _StatusEmojiActionButtonWidget(),
          _StatusEmojiActionCounterWidget(),
        ],
      );
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
          child: const StatusActionCounterWidget(
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
        icon: const Icon(FediIcons.emoji),
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
      // ignore: avoid-ignoring-return-values
      UnifediAsyncOperationHelper.performUnifediAsyncOperation(
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
