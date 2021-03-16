import 'dart:async';

import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/emoji_picker/category/custom_emoji_picker_category_bloc.dart';
import 'package:fedi/emoji_picker/custom_emoji_picker_bloc.dart';
import 'package:fedi/emoji_picker/item/custom_emoji_picker_item_model.dart';
import 'package:rxdart/rxdart.dart';

class CustomEmojiPickerBloc extends DisposableOwner
    implements ICustomEmojiPickerBloc {
  @override
  List<ICustomEmojiPickerCategoryBloc>? get availableCategories =>
      availableCategoriesSubject.value as List<ICustomEmojiPickerCategoryBloc>?;

  @override
  Stream<List<ICustomEmojiPickerCategoryBloc?>> get availableCategoriesStream =>
      availableCategoriesSubject.stream;

  final BehaviorSubject<List<ICustomEmojiPickerCategoryBloc?>>
      availableCategoriesSubject;

  @override
  ICustomEmojiPickerCategoryBloc? get selectedCategoryBloc =>
      selectedCategorySubject.value;
  @override
  Stream<ICustomEmojiPickerCategoryBloc?> get selectedCategoryBlocStream =>
      selectedCategorySubject.stream;

  final BehaviorSubject<ICustomEmojiPickerCategoryBloc?> selectedCategorySubject;

  @override
  void selectCategory(ICustomEmojiPickerCategoryBloc category) {
    selectedCategorySubject.add(category);
  }

  CustomEmojiPickerBloc({
    required ICustomEmojiPickerCategoryBloc? selectedCategory,
    required List<ICustomEmojiPickerCategoryBloc?> availableCategories,
  })  : availableCategoriesSubject =
            BehaviorSubject.seeded(availableCategories),
        selectedCategorySubject = BehaviorSubject.seeded(
            selectedCategory ?? availableCategories.first) {
    addDisposable(subject: availableCategoriesSubject);
    addDisposable(subject: selectedCategorySubject);
    addDisposable(streamController: selectedEmojiStreamController);
  }

  StreamController<CustomEmojiPickerItem> selectedEmojiStreamController =
      StreamController.broadcast();
  @override
  Stream<CustomEmojiPickerItem> get selectedEmojiStream =>
      selectedEmojiStreamController.stream;

  @override
  void onEmojiSelected(CustomEmojiPickerItem emojiItem) {
    selectedEmojiStreamController.add(emojiItem);
  }
}
