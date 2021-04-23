import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/emoji/picker/category/custom/emoji_picker_custom_image_url_category_local_preference_bloc.dart';
import 'package:fedi/app/emoji/picker/category/custom/emoji_picker_custom_image_url_category_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/emoji_picker/category/image_url/custom_emoji_picker_image_url_category_bloc.dart';
import 'package:fedi/emoji_picker/item/image_url/custom_emoji_picker_image_url_item_model.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_service.dart';
import 'package:logging/logging.dart';
import 'package:pedantic/pedantic.dart';

var _logger = Logger("emoji_picker_custom_image_url_category_bloc_impl.dart");

class EmojiPickerCustomImageUrlCategoryBloc extends AsyncInitLoadingBloc
    implements ICustomEmojiPickerImageUrlCategoryBloc {
  final ICurrentAuthInstanceBloc currentAuthInstanceBloc;
  final IPleromaApiEmojiService pleromaEmojiService;
  final IEmojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc
      preferenceBloc;

  EmojiPickerCustomImageUrlCategoryBloc({
    required this.pleromaEmojiService,
    required this.currentAuthInstanceBloc,
    required this.preferenceBloc,
  });

  @override
  Future internalAsyncInit() async {
    await preferenceBloc.performAsyncInit();
    var currentInstance = currentAuthInstanceBloc.currentInstance!;
    if (currentInstance.isPleroma) {
      // old instances may not have this API
      var urlHost = currentInstance.urlHost;
      var urlSchema = currentInstance.urlSchema;
      unawaited(
        pleromaEmojiService.getCustomEmojis().then(
          (customEmojis) async {
            var emojiItems = customEmojis
                .map(
                  (customEmoji) => CustomEmojiPickerImageUrlItem(
                    imageUrl: "$urlSchema://$urlHost/${customEmoji.imageUrl}",
                    name: customEmoji.name,
                  ),
                )
                .toList();
            await preferenceBloc.setValue(
              EmojiPickerCustomImageUrlCategoryItems(
                items: emojiItems,
              ),
            );
          },
        ).catchError(
          (e, stackTrace) {
            _logger.warning(
              () => "internalAsyncInit error: fetch remote emoji "
                  "list",
              e,
              stackTrace,
            );
          },
        ),
      );
    }
  }

  @override
  List<CustomEmojiPickerImageUrlItem> get items =>
      preferenceBloc.value?.items ?? [];

  @override
  Stream<List<CustomEmojiPickerImageUrlItem>?> get itemsStream =>
      preferenceBloc.stream.map((list) => list?.items);
}
