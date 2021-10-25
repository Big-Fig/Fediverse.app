import 'package:fedi_app/emoji_picker/item/code/custom_emoji_picker_code_item_model.dart';
import 'package:flutter/cupertino.dart';

class CustomEmojiPickerCodeItemWidget extends StatelessWidget {
  final CustomEmojiPickerCodeItem item;

  const CustomEmojiPickerCodeItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        item.code,
        // todo: refactor
        // ignore: no-magic-number
        style: const TextStyle(fontSize: 24),
      );
}
