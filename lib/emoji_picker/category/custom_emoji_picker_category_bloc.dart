import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/emoji_picker/item/custom_emoji_picker_item_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICustomEmojiPickerCategoryBloc
    implements IAsyncInitLoadingBloc, IDisposable {
  static ICustomEmojiPickerCategoryBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ICustomEmojiPickerCategoryBloc>(context, listen: listen);

  List<CustomEmojiPickerItem> get items;

  Stream<List<CustomEmojiPickerItem>> get itemsStream;
}
