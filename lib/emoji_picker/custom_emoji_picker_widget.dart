import 'package:fedi/async/loading/init/async_init_loading_widget.dart';
import 'package:fedi/emoji_picker/category/code/custom_emoji_picker_code_category_bloc_impl.dart';
import 'package:fedi/emoji_picker/category/code/custom_emoji_picker_code_category_model.dart';
import 'package:fedi/emoji_picker/category/custom_emoji_picker_category_bloc.dart';
import 'package:fedi/emoji_picker/custom_emoji_picker_bloc.dart';
import 'package:fedi/emoji_picker/item/code/custom_emoji_picker_code_item_model.dart';
import 'package:fedi/emoji_picker/item/code/custom_emoji_picker_code_item_widget.dart';
import 'package:fedi/emoji_picker/item/custom_emoji_picker_item_model.dart';
import 'package:fedi/emoji_picker/item/image_url/custom_emoji_picker_image_url_item_model.dart';
import 'package:fedi/emoji_picker/item/image_url/custom_emoji_picker_image_url_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

typedef EmojiSelectedCallback = Function(CustomEmojiPickerItem item);
typedef EmptyCategoryBuilder = Function(
    BuildContext context, ICustomEmojiPickerCategoryBloc categoryBloc);

typedef CustomCategoryIconBuilder = IconData? Function(
    ICustomEmojiPickerCategoryBloc);
typedef CustomCategoryBodyBuilder = Widget Function(
    ICustomEmojiPickerCategoryBloc);

class CustomEmojiPickerWidget extends StatelessWidget {
  final int rowsCount;
  final EmojiSelectedCallback onEmojiSelected;
  final Color unselectedIndicatorColor;
  final Color selectedIndicatorColor;
  final Color separatorColor;
  final double selectedCategoryItemsGridHeight;
  final double indicatorHeight;
  final EmptyCategoryBuilder? emptyCategoryBuilder;
  final CustomCategoryIconBuilder? customCategoryIconBuilder;
  final CustomCategoryBodyBuilder? customCategoryBodyBuilder;
  final Widget? loadingWidget;
  final bool useImageEmoji;

  CustomEmojiPickerWidget({
    required this.rowsCount,
    required this.onEmojiSelected,
    this.unselectedIndicatorColor = Colors.black,
    this.separatorColor = Colors.grey,
    this.selectedIndicatorColor = Colors.blue,
    this.customCategoryIconBuilder,
    this.customCategoryBodyBuilder,
    this.loadingWidget,
    this.indicatorHeight = 50.0,
    this.selectedCategoryItemsGridHeight = 200.0,
    this.useImageEmoji = true,
    this.emptyCategoryBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: _CustomEmojiPickerSelectedCategoryWidget(
            selectedCategoryItemsGridHeight: selectedCategoryItemsGridHeight,
            loadingWidget: loadingWidget,
            useImageEmoji: useImageEmoji,
            emptyCategoryBuilder: emptyCategoryBuilder,
            rowsCount: rowsCount,
            onEmojiSelected: onEmojiSelected,
          ),
        ),
        _CustomEmojiPickerSeparatorWidget(separatorColor: separatorColor),
        _CustomEmojiPickerIndicatorListWidget(
          indicatorHeight: indicatorHeight,
          selectedIndicatorColor: selectedIndicatorColor,
          unselectedIndicatorColor: unselectedIndicatorColor,
          customCategoryIconBuilder: customCategoryIconBuilder,
        ),
      ],
    );
  }
}

class _CustomEmojiPickerSelectedCategoryWidget extends StatelessWidget {
  const _CustomEmojiPickerSelectedCategoryWidget({
    Key? key,
    required this.selectedCategoryItemsGridHeight,
    required this.loadingWidget,
    required this.useImageEmoji,
    required this.emptyCategoryBuilder,
    required this.rowsCount,
    required this.onEmojiSelected,
  }) : super(key: key);

  final double selectedCategoryItemsGridHeight;
  final Widget? loadingWidget;
  final bool useImageEmoji;
  final EmptyCategoryBuilder? emptyCategoryBuilder;
  final int rowsCount;
  final EmojiSelectedCallback onEmojiSelected;

  @override
  Widget build(BuildContext context) {
    var customEmojiPickerBloc = ICustomEmojiPickerBloc.of(context);
    return StreamBuilder<ICustomEmojiPickerCategoryBloc?>(
        stream: customEmojiPickerBloc.selectedCategoryBlocStream,
        builder: (context, snapshot) {
          var selectedCategoryBloc = snapshot.data;

          if (selectedCategoryBloc == null) {
            return const SizedBox.shrink();
          }
          return Provider<ICustomEmojiPickerCategoryBloc>.value(
            value: selectedCategoryBloc,
            child: Container(
              height: selectedCategoryItemsGridHeight,
              child: AsyncInitLoadingWidget(
                loadingWidget: loadingWidget,
                asyncInitLoadingBloc: selectedCategoryBloc,
                loadingFinishedBuilder: (BuildContext context) {
                  return StreamBuilder<List<CustomEmojiPickerItem>?>(
                      stream: selectedCategoryBloc.itemsStream,
                      builder: (context, snapshot) {
                        var items = snapshot.data;

                        if (items == null) {
                          return loadingWidget!;
                        }

                        if (!useImageEmoji) {
                          items = items.where((item) {
                            if (!(item is CustomEmojiPickerImageUrlItem)) {
                              return true;
                            } else {
                              return false;
                            }
                          }).toList();
                        }
                        if (items.isEmpty) {
                          return Center(
                            child: emptyCategoryBuilder!(
                                context, selectedCategoryBloc),
                          );
                        }
                        return Provider<List<CustomEmojiPickerItem>?>.value(
                          value: items,
                          child: _CustomEmojiPickerSelectedCategoryItemsWidget(
                            rowsCount: rowsCount,
                            selectedCategoryItemsGridHeight:
                                selectedCategoryItemsGridHeight,
                            onEmojiSelected: onEmojiSelected,
                          ),
                        );
                      });
                },
              ),
            ),
          );
        });
  }
}

class _CustomEmojiPickerSelectedCategoryItemsWidget extends StatelessWidget {
  const _CustomEmojiPickerSelectedCategoryItemsWidget({
    Key? key,
    required this.rowsCount,
    required this.selectedCategoryItemsGridHeight,
    required this.onEmojiSelected,
  }) : super(key: key);

  final int rowsCount;
  final double selectedCategoryItemsGridHeight;
  final EmojiSelectedCallback onEmojiSelected;

  @override
  Widget build(BuildContext context) {
    var customEmojiPickerBloc = ICustomEmojiPickerBloc.of(context);
    var items = Provider.of<List<CustomEmojiPickerItem>>(context);
    return GridView.count(
      crossAxisCount: rowsCount,
      scrollDirection: Axis.horizontal,
      children: items.map((item) {
            Widget child;

            if (item is CustomEmojiPickerCodeItem) {
              child = CustomEmojiPickerCodeItemWidget(
                item: item,
              );
            } else if (item is CustomEmojiPickerImageUrlItem) {
              child = CustomEmojiPickerImageUrlItemWidget(
                item: item,
              );
            } else {
              throw "Unsupported $item";
            }

            var size = selectedCategoryItemsGridHeight / rowsCount;
            return InkWell(
              onTap: () {
                customEmojiPickerBloc.onEmojiSelected(item);
                onEmojiSelected(item);
              },
              child: Container(
                width: size,
                height: size,
                child: Center(child: child),
              ),
            );
          }).toList(),
    );
  }
}

class _CustomEmojiPickerIndicatorListWidget extends StatelessWidget {
  const _CustomEmojiPickerIndicatorListWidget({
    Key? key,
    required this.indicatorHeight,
    required this.selectedIndicatorColor,
    required this.unselectedIndicatorColor,
    required this.customCategoryIconBuilder,
  }) : super(key: key);

  final double indicatorHeight;
  final Color selectedIndicatorColor;
  final Color unselectedIndicatorColor;
  final CustomCategoryIconBuilder? customCategoryIconBuilder;

  @override
  Widget build(BuildContext context) {
    var customEmojiPickerBloc = ICustomEmojiPickerBloc.of(context);
    return StreamBuilder<List<ICustomEmojiPickerCategoryBloc?>>(
      stream: customEmojiPickerBloc.availableCategoriesStream,
      initialData: customEmojiPickerBloc.availableCategories,
      builder: (context, snapshot) {
        var availableCategories = snapshot.data!;
        return Container(
          height: indicatorHeight,
          alignment: Alignment.center,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: availableCategories
                .map(
                  (category) => Provider<ICustomEmojiPickerCategoryBloc?>.value(
                    value: category,
                    child: _CustomEmojiPickerCategoryIndicatorWidget(
                      selectedIndicatorColor: selectedIndicatorColor,
                      unselectedIndicatorColor: unselectedIndicatorColor,
                      customCategoryIconBuilder: customCategoryIconBuilder,
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}

class _CustomEmojiPickerCategoryIndicatorWidget extends StatelessWidget {
  const _CustomEmojiPickerCategoryIndicatorWidget({
    Key? key,
    required this.selectedIndicatorColor,
    required this.unselectedIndicatorColor,
    required this.customCategoryIconBuilder,
  }) : super(key: key);

  final Color selectedIndicatorColor;
  final Color unselectedIndicatorColor;
  final CustomCategoryIconBuilder? customCategoryIconBuilder;

  @override
  Widget build(BuildContext context) {
    var customEmojiPickerBloc = ICustomEmojiPickerBloc.of(context);
    var category = ICustomEmojiPickerCategoryBloc.of(context);
    return StreamBuilder<ICustomEmojiPickerCategoryBloc?>(
      stream: customEmojiPickerBloc.selectedCategoryBlocStream,
      initialData: customEmojiPickerBloc.selectedCategoryBloc,
      builder: (context, snapshot) {
        var selectedCategory = snapshot.data;
        var isSelected = category == selectedCategory;
        return InkWell(
          onTap: isSelected
              ? null
              : () {
                  customEmojiPickerBloc.selectCategory(category);
                },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              mapCategoryToIcon(
                category: category,
                customCategoryIconBuilder: customCategoryIconBuilder,
              ),
              color: isSelected
                  ? selectedIndicatorColor
                  : unselectedIndicatorColor,
            ),
          ),
        );
      },
    );
  }
}

IconData mapCategoryToIcon({
  required ICustomEmojiPickerCategoryBloc category,
  required CustomCategoryIconBuilder? customCategoryIconBuilder,
}) {
  if (customCategoryIconBuilder != null) {
    var icon = customCategoryIconBuilder(category);
    if (icon != null) {
      return icon;
    }
  }
  if (category is CustomEmojiPickerCodeCategoryBloc) {
    var emojiPickerCodeCategoryType = category.type;

    switch (emojiPickerCodeCategoryType) {
      case CustomEmojiPickerCodeCategoryType.smiles:
        return Icons.tag_faces;
      case CustomEmojiPickerCodeCategoryType.animals:
        return Icons.pets;
      case CustomEmojiPickerCodeCategoryType.foods:
        return Icons.fastfood;
      case CustomEmojiPickerCodeCategoryType.travel:
        return Icons.location_city;
      case CustomEmojiPickerCodeCategoryType.activities:
        return Icons.directions_run;
      case CustomEmojiPickerCodeCategoryType.objects:
        return Icons.lightbulb_outline;
      case CustomEmojiPickerCodeCategoryType.symbols:
        return Icons.euro_symbol;
      case CustomEmojiPickerCodeCategoryType.flags:
        return Icons.flag;
      default:
        throw "emojiPickerCodeCategoryType $emojiPickerCodeCategoryType not supported";
    }
  } else {
    throw "category $category not supported";
  }
}

class _CustomEmojiPickerSeparatorWidget extends StatelessWidget {
  const _CustomEmojiPickerSeparatorWidget({
    Key? key,
    required this.separatorColor,
  }) : super(key: key);

  final Color separatorColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        height: 1,
        color: separatorColor,
      ),
    );
  }
}
