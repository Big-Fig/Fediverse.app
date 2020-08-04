import 'package:fedi/app/emoji/picker/category/recent/emoji_picker_recent_category_local_preference_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/emoji_picker/category/custom_emoji_picker_category_bloc.dart';
import 'package:fedi/emoji_picker/item/custom_emoji_picker_item_model.dart';
import 'package:flutter/widgets.dart';

class EmojiPickerRecentCategoryBloc extends AsyncInitLoadingBloc
    implements ICustomEmojiPickerCategoryBloc {
  final IEmojiPickerRecentCategoryLocalPreferenceBloc preferenceBloc;

  EmojiPickerRecentCategoryBloc({
    @required this.preferenceBloc,
  });

  @override
  Future internalAsyncInit() async {
    await preferenceBloc.performAsyncInit();
  }

  @override
  List<CustomEmojiPickerItem> get items =>
      preferenceBloc.value?.recentItems ?? [];

  @override
  Stream<List<CustomEmojiPickerItem>> get itemsStream =>
      preferenceBloc.stream.map((list) => list?.recentItems);
}
