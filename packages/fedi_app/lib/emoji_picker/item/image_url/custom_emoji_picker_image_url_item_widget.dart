import 'package:fedi_app/app/cache/files/files_cache_service.dart';
import 'package:fedi_app/emoji_picker/item/image_url/custom_emoji_picker_image_url_item_model.dart';
import 'package:flutter/cupertino.dart';

class CustomEmojiPickerImageUrlItemWidget extends StatelessWidget {
  final CustomEmojiPickerImageUrlItem? item;

  const CustomEmojiPickerImageUrlItemWidget({Key? key, this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(1.0),
        child: IFilesCacheService.of(context).createCachedNetworkImageWidget(
          imageUrl: item!.imageUrl,
          fit: BoxFit.fill,
        ),
      );
}
