import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/emoji_picker/category/image_url/custom_emoji_picker_image_url_category_bloc.dart';
import 'package:fedi/emoji_picker/item/custom_emoji_picker_item_model.dart';
import 'package:fedi/emoji_picker/item/image_url/custom_emoji_picker_image_url_item_model.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_service.dart';
import 'package:rxdart/rxdart.dart';

class FediEmojiPickerPleromaImageUrlCategory extends AsyncInitLoadingBloc
    implements ICustomEmojiPickerImageUrlCategoryBloc {
  final IPleromaEmojiService pleromaEmojiService;
  FediEmojiPickerPleromaImageUrlCategory() {
    addDisposable(subject: itemsSubject);
  }

  @override
  Future internalAsyncInit() {
    // TODO: implement internalAsyncInit
    throw UnimplementedError();
  }

  BehaviorSubject<List<CustomEmojiPickerItem>> itemsSubject = BehaviorSubject();

  @override
  List<CustomEmojiPickerImageUrlItem> get items => itemsSubject.value;

  @override
  Stream<List<CustomEmojiPickerItem>> get itemsStream => itemsSubject.stream;
}
