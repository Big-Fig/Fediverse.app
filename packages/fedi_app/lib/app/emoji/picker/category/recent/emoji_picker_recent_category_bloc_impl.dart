import 'package:fedi_app/app/emoji/picker/category/recent/emoji_picker_recent_category_model.dart';
import 'package:fedi_app/app/emoji/picker/category/recent/local_preferences/emoji_picker_recent_category_local_preference_bloc.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi_app/emoji_picker/category/custom_emoji_picker_category_bloc.dart';
import 'package:fedi_app/emoji_picker/item/code/custom_emoji_picker_code_item_model.dart';
import 'package:fedi_app/emoji_picker/item/custom_emoji_picker_item_model.dart';
import 'package:fedi_app/emoji_picker/item/image_url/custom_emoji_picker_image_url_item_model.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

final _logger = Logger('emoji_picker_recent_category_bloc_impl.dart');

class EmojiPickerRecentCategoryBloc extends AsyncInitLoadingBloc
    implements ICustomEmojiPickerCategoryBloc {
  final IEmojiPickerRecentCategoryLocalPreferenceBloc preferenceBloc;

  EmojiPickerRecentCategoryBloc({
    required this.preferenceBloc,
  });

  @override
  Future<void> internalAsyncInit() async {
    await preferenceBloc.performAsyncInit();
  }

  @override
  List<CustomEmojiPickerItem>? get items => _calculateRecentItems(
        isLoading: isLoading,
        list: preferenceBloc.value,
      );

  @override
  Stream<List<CustomEmojiPickerItem>?> get itemsStream => Rx.combineLatest2(
        preferenceBloc.stream,
        isLoadingStream,
        (EmojiPickerRecentCategoryItemsList? list, bool? isLoading) =>
            _calculateRecentItems(
          isLoading: isLoading,
          list: list,
        ),
      );

  static List<CustomEmojiPickerItem>? _calculateRecentItems({
    required bool? isLoading,
    required EmojiPickerRecentCategoryItemsList? list,
  }) {
    // null is loading
    // empty is empty
    // empty != null
    if (isLoading == true) {
      return null;
    } else {
      return list?.recentItems ?? [];
    }
  }

  void onEmojiSelected(CustomEmojiPickerItem emojiItem) {
    var currentItems = items ?? [];
    var alreadyExist = currentItems.contains(emojiItem);
    _logger.finest(
      () => 'onEmojiSelected $emojiItem \n'
          'alreadyExist $alreadyExist',
    );
    if (!alreadyExist) {
      currentItems.add(emojiItem);
      preferenceBloc.setValue(
        EmojiPickerRecentCategoryItemsList(
          recentCodeItems:
              currentItems.whereType<CustomEmojiPickerCodeItem>().toList(),
          recentImageItems:
              currentItems.whereType<CustomEmojiPickerImageUrlItem>().toList(),
        ),
      );
    }
    _logger.finest(() => 'onEmojiSelected items ${items?.length} ');
  }
}
