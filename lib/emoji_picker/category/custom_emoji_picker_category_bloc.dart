import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/emoji_picker/item/custom_emoji_picker_item_model.dart';

abstract class ICustomEmojiPickerCategoryBloc
    implements IAsyncInitLoadingBloc, Disposable {
  List<CustomEmojiPickerItem> get items;

  Stream<List<CustomEmojiPickerItem>> get itemsStream;
}
