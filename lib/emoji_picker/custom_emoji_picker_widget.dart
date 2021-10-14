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
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

final _logger = Logger('custom_emoji_picker_widget.dart');

typedef EmojiSelectedCallback = Function(CustomEmojiPickerItem item);
typedef EmptyCategoryBuilder = Widget? Function(
  BuildContext context,
  ICustomEmojiPickerCategoryBloc categoryBloc,
);

typedef CustomCategoryIconBuilder = IconData? Function(
  ICustomEmojiPickerCategoryBloc,
);
typedef CustomCategoryBodyBuilder = Widget? Function(
  BuildContext context,
  int rowsCount,
  double selectedCategoryItemsGridHeight,
  EmojiSelectedCallback onEmojiSelected,
);

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
  final Widget loadingWidget;
  final bool useImageEmoji;

  const CustomEmojiPickerWidget({
    required this.rowsCount,
    required this.onEmojiSelected,
    this.unselectedIndicatorColor = Colors.black,
    this.separatorColor = Colors.grey,
    this.selectedIndicatorColor = Colors.blue,
    this.customCategoryIconBuilder,
    this.customCategoryBodyBuilder,
    required this.loadingWidget,
    // ignore: no-magic-number
    this.indicatorHeight = 50.0,
    // ignore: no-magic-number
    this.selectedCategoryItemsGridHeight = 200.0,
    this.useImageEmoji = true,
    this.emptyCategoryBuilder,
  });

  @override
  Widget build(BuildContext context) => Column(
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
              customCategoryBodyBuilder: customCategoryBodyBuilder,
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

class _CustomEmojiPickerSelectedCategoryWidget extends StatelessWidget {
  const _CustomEmojiPickerSelectedCategoryWidget({
    Key? key,
    required this.selectedCategoryItemsGridHeight,
    required this.loadingWidget,
    required this.useImageEmoji,
    required this.emptyCategoryBuilder,
    required this.rowsCount,
    required this.onEmojiSelected,
    required this.customCategoryBodyBuilder,
  }) : super(key: key);

  final CustomCategoryBodyBuilder? customCategoryBodyBuilder;
  final double selectedCategoryItemsGridHeight;
  final Widget loadingWidget;
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
          child: SizedBox(
            height: selectedCategoryItemsGridHeight,
            child: AsyncInitLoadingWidget(
              loadingWidget: loadingWidget,
              asyncInitLoadingBloc: selectedCategoryBloc,
              loadingFinishedBuilder: (BuildContext context) =>
                  StreamBuilder<List<CustomEmojiPickerItem>?>(
                stream: selectedCategoryBloc.itemsStream,
                initialData: selectedCategoryBloc.items,
                builder: (context, snapshot) {
                  var items = snapshot.data;

                  _logger.finest(
                    () => 'BUILD items $selectedCategoryBloc $items ',
                  );

                  if (!useImageEmoji) {
                    items = items
                        ?.where(
                          (item) => item is! CustomEmojiPickerImageUrlItem,
                        )
                        .toList();
                  }

                  return Provider<List<CustomEmojiPickerItem>?>.value(
                    value: items,
                    child: _CustomEmojiPickerSelectedCategoryBodyWidget(
                      rowsCount: rowsCount,
                      selectedCategoryItemsGridHeight:
                          selectedCategoryItemsGridHeight,
                      onEmojiSelected: onEmojiSelected,
                      emptyCategoryBuilder: emptyCategoryBuilder,
                      loadingWidget: loadingWidget,
                      customCategoryBodyBuilder: customCategoryBodyBuilder,
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CustomEmojiPickerSelectedCategoryBodyWidget extends StatelessWidget {
  const _CustomEmojiPickerSelectedCategoryBodyWidget({
    Key? key,
    required this.rowsCount,
    required this.selectedCategoryItemsGridHeight,
    required this.onEmojiSelected,
    required this.loadingWidget,
    required this.emptyCategoryBuilder,
    required this.customCategoryBodyBuilder,
  }) : super(key: key);

  final CustomCategoryBodyBuilder? customCategoryBodyBuilder;
  final EmptyCategoryBuilder? emptyCategoryBuilder;
  final Widget loadingWidget;
  final int rowsCount;
  final double selectedCategoryItemsGridHeight;
  final EmojiSelectedCallback onEmojiSelected;

  @override
  Widget build(BuildContext context) {
    var items = Provider.of<List<CustomEmojiPickerItem>?>(context);

    if (items == null) {
      return loadingWidget;
    }

    if (items.isEmpty && emptyCategoryBuilder != null) {
      _logger.finest(() => 'isEmpty');

      var selectedCategoryBloc =
          Provider.of<ICustomEmojiPickerCategoryBloc>(context);
      var emptyWidget = emptyCategoryBuilder!(
        context,
        selectedCategoryBloc,
      );
      if (emptyWidget != null) {
        return Center(
          child: emptyWidget,
        );
      }
    }

    return _CustomEmojiPickerSelectedCategoryItemsWidget(
      rowsCount: rowsCount,
      selectedCategoryItemsGridHeight: selectedCategoryItemsGridHeight,
      onEmojiSelected: onEmojiSelected,
      customCategoryBodyBuilder: customCategoryBodyBuilder,
    );
  }
}

class _CustomEmojiPickerSelectedCategoryItemsWidget extends StatelessWidget {
  const _CustomEmojiPickerSelectedCategoryItemsWidget({
    Key? key,
    required this.rowsCount,
    required this.selectedCategoryItemsGridHeight,
    required this.onEmojiSelected,
    required this.customCategoryBodyBuilder,
  }) : super(key: key);

  final CustomCategoryBodyBuilder? customCategoryBodyBuilder;
  final int rowsCount;
  final double selectedCategoryItemsGridHeight;
  final EmojiSelectedCallback onEmojiSelected;

  @override
  Widget build(BuildContext context) {
    var customCategoryBodyBuilder = this.customCategoryBodyBuilder;

    if (customCategoryBodyBuilder != null) {
      var widget = customCategoryBodyBuilder(
        context,
        rowsCount,
        selectedCategoryItemsGridHeight,
        onEmojiSelected,
      );

      if (widget != null) {
        return widget;
      }
    }

    return CustomEmojiPickerSelectedCategoryItemsGridWidget(
      rowsCount: rowsCount,
      selectedCategoryItemsGridHeight: selectedCategoryItemsGridHeight,
      onEmojiSelected: onEmojiSelected,
    );
  }
}

class CustomEmojiPickerSelectedCategoryItemsGridWidget extends StatelessWidget {
  const CustomEmojiPickerSelectedCategoryItemsGridWidget({
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
          throw 'Unsupported $item';
        }

        var size = selectedCategoryItemsGridHeight / rowsCount;

        return InkWell(
          onTap: () {
            customEmojiPickerBloc.onEmojiSelected(item);
            onEmojiSelected(item);
          },
          child: SizedBox(
            width: size,
            // ignore: no-equal-arguments
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

    return StreamBuilder<List<ICustomEmojiPickerCategoryBloc>>(
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
                  (category) => Provider<ICustomEmojiPickerCategoryBloc>.value(
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

        var size = 24.0;

        var iconData = mapCategoryToIcon(
          category: category,
        );

        if (iconData == null) {
          if (customCategoryIconBuilder != null) {
            iconData = customCategoryIconBuilder!(category);
            // ignore: no-magic-number
            size = 20.0;
          }
        }

        return InkWell(
          onTap: isSelected
              ? null
              : () {
                  customEmojiPickerBloc.selectCategory(category);
                },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              iconData,
              size: size,
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

IconData? mapCategoryToIcon({
  required ICustomEmojiPickerCategoryBloc category,
}) {
  if (category is CustomEmojiPickerCodeCategoryBloc) {
    var emojiPickerCodeCategoryType = category.type;

    IconData? iconData;
    switch (emojiPickerCodeCategoryType) {
      case CustomEmojiPickerCodeCategoryType.smiles:
        iconData = Icons.tag_faces;
        break;
      case CustomEmojiPickerCodeCategoryType.animals:
        iconData = Icons.pets;
        break;
      case CustomEmojiPickerCodeCategoryType.foods:
        iconData = Icons.fastfood;
        break;
      case CustomEmojiPickerCodeCategoryType.travel:
        iconData = Icons.location_city;
        break;
      case CustomEmojiPickerCodeCategoryType.activities:
        iconData = Icons.directions_run;
        break;
      case CustomEmojiPickerCodeCategoryType.objects:
        iconData = Icons.lightbulb_outline;
        break;
      case CustomEmojiPickerCodeCategoryType.symbols:
        iconData = Icons.euro_symbol;
        break;
      case CustomEmojiPickerCodeCategoryType.flags:
        iconData = Icons.flag;
        break;
    }

    return iconData;
  } else {
    return null;
  }
}

class _CustomEmojiPickerSeparatorWidget extends StatelessWidget {
  const _CustomEmojiPickerSeparatorWidget({
    Key? key,
    required this.separatorColor,
  }) : super(key: key);

  final Color separatorColor;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Container(
          height: 1,
          color: separatorColor,
        ),
      );
}
