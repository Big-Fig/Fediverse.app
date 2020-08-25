import 'package:fedi/app/emoji/picker/emoji_picker_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef EmojiReactionSelectedCallback = Function(
    String emojiName, String emoji);

class StatusEmojiReactionPickerWidget extends StatelessWidget {
  final EmojiReactionSelectedCallback emojiReactionSelectedCallback;

  StatusEmojiReactionPickerWidget(
      {@required this.emojiReactionSelectedCallback});

  @override
  Widget build(BuildContext context) {
    return EmojiPickerWidget(
      selectedCategoryItemsGridHeight: 200,
      rowsCount: 5,
      onEmojiSelected: (emoji) {
        emojiReactionSelectedCallback(emoji.name, emoji.code);
      },
      useImageEmoji: false,
    );
  }
}

void showEmojiPickerModalPopup(BuildContext context,
    {EmojiReactionSelectedCallback emojiReactionSelectedCallback}) {
  showFediModalBottomSheetDialog(
      context: context,
      child: Padding(
        padding: FediPadding.horizontalSmallPadding,
        child: StatusEmojiReactionPickerWidget(
          emojiReactionSelectedCallback: (String emojiName, String emoji) {
            if (emojiReactionSelectedCallback != null) {
              emojiReactionSelectedCallback(emojiName, emoji);
            }
            Navigator.of(context).pop();
          },
        ),
      ));
}
