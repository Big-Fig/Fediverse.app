import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/emoji/picker/category/custom_image_url/emoji_picker_custom_image_url_category_model.dart';
import 'package:fedi/app/emoji/picker/category/custom_image_url/local_preferences/emoji_picker_custom_image_url_category_local_preference_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/emoji_picker/category/image_url/custom_emoji_picker_image_url_category_bloc.dart';
import 'package:fedi/emoji_picker/item/image_url/custom_emoji_picker_image_url_item_model.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;
import 'package:unifedi_api/unifedi_api.dart';

var _urlPath = path.Context(style: path.Style.url);

var _logger = Logger('emoji_picker_custom_image_url_category_bloc_impl.dart');

class EmojiPickerCustomImageUrlCategoryBloc extends AsyncInitLoadingBloc
    implements ICustomEmojiPickerImageUrlCategoryBloc {
  final ICurrentUnifediApiAccessBloc currentUnifediApiAccessBloc;
  final IUnifediApiInstanceService unifediApiInstanceService;
  final IEmojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc
      preferenceBloc;

  EmojiPickerCustomImageUrlCategoryBloc({
    required this.unifediApiInstanceService,
    required this.currentUnifediApiAccessBloc,
    required this.preferenceBloc,
  });

  @override
  Future internalAsyncInit() async {
    await preferenceBloc.performAsyncInit();
    var currentInstance = currentUnifediApiAccessBloc.currentInstance!;
    if (currentInstance.isPleroma) {
      // old instances may not have this API
      // ignore: unawaited_futures
      _loadPleroma(currentInstance);
    } else if (currentInstance.isMastodon) {
      // ignore: unawaited_futures
      _loadMastodon();
    }
  }

  Future<void> _loadMastodon() async {
    await unifediApiInstanceService.getCustomEmojis().then(
      (customEmojis) async {
        var emojiItems = customEmojis
            .map(
              (customEmoji) => CustomEmojiPickerImageUrlItem(
                imageUrl: customEmoji.staticUrl!,
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
      (Object? e, StackTrace? stackTrace) {
        _logger.warning(
          () => 'internalAsyncInit error: fetch remote emoji '
              'list',
          e,
          stackTrace,
        );
      },
    );
  }

  Future<void> _loadPleroma(UnifediApiAccess currentInstance) async {
    // old instances may not have this API
    var urlHost = currentInstance.urlHost;
    var urlSchema = currentInstance.urlSchema;

    await unifediApiInstanceService.getCustomEmojis().then(
      (customEmojis) async {
        var emojiItems = customEmojis.map(
          (customEmoji) {
            var baseUrl = '$urlSchema://$urlHost';
            var imageUrl = '${customEmoji.url}';

            if (baseUrl.endsWith('/') && imageUrl.startsWith('/')) {
              baseUrl = baseUrl.substring(0, baseUrl.length - 1);
            }

            return CustomEmojiPickerImageUrlItem(
              imageUrl: _urlPath.join(
                baseUrl,
                imageUrl,
              ),
              name: customEmoji.name,
            );
          },
        ).toList();
        await preferenceBloc.setValue(
          EmojiPickerCustomImageUrlCategoryItems(
            items: emojiItems,
          ),
        );
      },
    ).catchError(
      (Object? e, StackTrace? stackTrace) {
        _logger.warning(
          () => 'internalAsyncInit error: fetch remote emoji '
              'list',
          e,
          stackTrace,
        );
      },
    );
  }

  @override
  List<CustomEmojiPickerImageUrlItem>? get items => preferenceBloc.value?.items;

  @override
  Stream<List<CustomEmojiPickerImageUrlItem>?> get itemsStream =>
      preferenceBloc.stream.map((list) => list?.items);
}
