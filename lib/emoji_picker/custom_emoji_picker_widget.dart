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

typedef EmojiSelectedCallback = Function(CustomEmojiPickerItem item);
typedef EmptyCategoryBuilder = Function(
    BuildContext context, ICustomEmojiPickerCategoryBloc categoryBloc);

class CustomEmojiPickerWidget extends StatelessWidget {
  final int rowsCount;
  final EmojiSelectedCallback onEmojiSelected;
  final Color unselectedIndicatorColor;
  final Color selectedIndicatorColor;
  final Color separatorColor;
  final double selectedCategoryItemsGridHeight;
  final double indicatorHeight;
  final EmptyCategoryBuilder emptyCategoryBuilder;
  final IconData Function(ICustomEmojiPickerCategoryBloc)
      customCategoryIconBuilder;
  final Widget Function(ICustomEmojiPickerCategoryBloc)
      customCategoryBodyBuilder;
  final Widget loadingWidget;
  final bool useImageEmoji;

  CustomEmojiPickerWidget(
      {@required this.rowsCount,
      @required this.onEmojiSelected,
      this.unselectedIndicatorColor = Colors.black,
      this.separatorColor = Colors.grey,
      this.selectedIndicatorColor = Colors.blue,
      this.customCategoryIconBuilder,
      this.customCategoryBodyBuilder,
      this.loadingWidget,
      this.indicatorHeight = 50.0,
      this.selectedCategoryItemsGridHeight = 200.0,
      this.useImageEmoji = true,
      this.emptyCategoryBuilder});

  @override
  Widget build(BuildContext context) {
    var customEmojiPickerBloc =
        ICustomEmojiPickerBloc.of(context, listen: false);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: _buildSelectedCategoryItems(context, customEmojiPickerBloc),
        ),
        _buildSeparator(),
        _buildCategoryIndicators(context, customEmojiPickerBloc)
      ],
    );
  }

  Padding _buildSeparator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        height: 1,
        color: separatorColor,
      ),
    );
  }

  Widget _buildCategoryIndicators(
      BuildContext context, ICustomEmojiPickerBloc customEmojiPickerBloc) {
    return StreamBuilder<List<ICustomEmojiPickerCategoryBloc>>(
        stream: customEmojiPickerBloc.availableCategoriesStream,
        initialData: customEmojiPickerBloc.availableCategories,
        builder: (context, snapshot) {
          var availableCategories = snapshot.data;
          return Container(
            height: indicatorHeight,
            alignment: Alignment.center,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: availableCategories
                  .map((category) => _buildCategoryIndicator(
                      context, customEmojiPickerBloc, category))
                  .toList(),
            ),
          );
        });
  }

  Widget _buildSelectedCategoryItems(
      BuildContext context, ICustomEmojiPickerBloc customEmojiPickerBloc) {
    return StreamBuilder<ICustomEmojiPickerCategoryBloc>(
        stream: customEmojiPickerBloc.selectedCategoryBlocStream,
        initialData: customEmojiPickerBloc.selectedCategoryBloc,
        builder: (context, snapshot) {
          var selectedCategoryBloc = snapshot.data;
          return Container(
            height: selectedCategoryItemsGridHeight,
            child: AsyncInitLoadingWidget(
              loadingWidget: loadingWidget,
              asyncInitLoadingBloc: selectedCategoryBloc,
              loadingFinishedBuilder: (BuildContext context) {
                return StreamBuilder<List<CustomEmojiPickerItem>>(
                    stream: selectedCategoryBloc.itemsStream,
                    initialData: selectedCategoryBloc.items,
                    builder: (context, snapshot) {
                      var items = snapshot.data ?? [];

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
                          child: emptyCategoryBuilder(
                              context, selectedCategoryBloc),
                        );
                      }
                      return GridView.count(
                        crossAxisCount: rowsCount,
                        scrollDirection: Axis.horizontal,
                        children: items?.map((item) {
                              Widget child;

                              if (item is CustomEmojiPickerCodeItem) {
                                child = CustomEmojiPickerCodeItemWidget(
                                  item: item,
                                );
                              } else if (item
                                  is CustomEmojiPickerImageUrlItem) {
                                child = CustomEmojiPickerImageUrlItemWidget(
                                  item: item,
                                );
                              } else {
                                throw "Unsupported $item";
                              }

                              var size =
                                  selectedCategoryItemsGridHeight / rowsCount;
                              return InkWell(
                                onTap: () {
                                  customEmojiPickerBloc.onEmojiSelected(item);
                                  onEmojiSelected(item);
                                },
                                child: Container(
                                    width: size,
                                    height: size,
                                    child: Center(child: child)),
                              );
                            })?.toList() ??
                            [],
                      );
                    });
              },
            ),
          );
        });
  }

  Widget _buildCategoryIndicator(
      BuildContext context,
      ICustomEmojiPickerBloc customEmojiPickerBloc,
      ICustomEmojiPickerCategoryBloc category) {
    return StreamBuilder<ICustomEmojiPickerCategoryBloc>(
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
                mapCategoryToIcon(category),
                color: isSelected
                    ? selectedIndicatorColor
                    : unselectedIndicatorColor,
              ),
            ),
          );
        });
  }

  IconData mapCategoryToIcon(ICustomEmojiPickerCategoryBloc category) {
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
          break;
        case CustomEmojiPickerCodeCategoryType.animals:
          return Icons.pets;
          break;
        case CustomEmojiPickerCodeCategoryType.foods:
          return Icons.fastfood;
          break;
        case CustomEmojiPickerCodeCategoryType.travel:
          return Icons.location_city;
          break;
        case CustomEmojiPickerCodeCategoryType.activities:
          return Icons.directions_run;
          break;
        case CustomEmojiPickerCodeCategoryType.objects:
          return Icons.lightbulb_outline;
          break;
        case CustomEmojiPickerCodeCategoryType.symbols:
          return Icons.euro_symbol;
          break;
        case CustomEmojiPickerCodeCategoryType.flags:
          return Icons.flag;
          break;
        default:
          throw "emojiPickerCodeCategoryType $emojiPickerCodeCategoryType not supported";
          break;
      }
    } else {
      throw "category $category not supported";
    }
  }
}
