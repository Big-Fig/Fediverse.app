import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/emoji/picker/category/custom_image_url/emoji_picker_custom_image_url_category_bloc_impl.dart';
import 'package:fedi_app/app/emoji/picker/category/custom_image_url/local_preferences/emoji_picker_custom_image_url_category_local_preference_bloc.dart';
import 'package:fedi_app/app/emoji/picker/category/recent/emoji_picker_recent_category_bloc_impl.dart';
import 'package:fedi_app/app/emoji/picker/category/recent/local_preferences/emoji_picker_recent_category_local_preference_bloc.dart';
import 'package:fedi_app/app/emoji/picker/category/search/emoji_picker_search_category_bloc_impl.dart';
import 'package:fedi_app/app/ui/edit_text/fedi_transparent_edit_text_field.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/emoji_picker/category/code/custom_emoji_picker_code_category_bloc_impl.dart';
import 'package:fedi_app/emoji_picker/category/custom_emoji_picker_category_bloc.dart';
import 'package:fedi_app/emoji_picker/custom_emoji_picker_bloc.dart';
import 'package:fedi_app/emoji_picker/custom_emoji_picker_bloc_impl.dart';
import 'package:fedi_app/emoji_picker/custom_emoji_picker_widget.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class EmojiPickerWidget extends StatelessWidget {
  final EmojiSelectedCallback onEmojiSelected;
  final bool useImageEmoji;
  final double selectedCategoryItemsGridHeight;
  final int rowsCount;

  const EmojiPickerWidget({
    Key? key,
    required this.onEmojiSelected,
    required this.useImageEmoji,
    // ignore: no-magic-number
    this.rowsCount = 3,
    // ignore: no-magic-number
    this.selectedCategoryItemsGridHeight = 108.0,
  }) : super(key: key);

  @override
  // todo: refactor
  // ignore: long-method
  Widget build(BuildContext context) =>
      DisposableProvider<ICustomEmojiPickerBloc>(
        create: (context) {
          EmojiPickerCustomImageUrlCategoryBloc? customCategoryBloc;
          if (useImageEmoji) {
            customCategoryBloc = EmojiPickerCustomImageUrlCategoryBloc(
              unifediApiInstanceService:
                  Provider.of<IUnifediApiInstanceService>(
                context,
                listen: false,
              ),
              preferenceBloc:
                  IEmojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc.of(
                context,
                listen: false,
              ),
              currentUnifediApiAccessBloc: ICurrentAccessBloc.of(
                context,
                listen: false,
              ),
            );
          }

          var emojiPickerRecentCategoryBloc = EmojiPickerRecentCategoryBloc(
            preferenceBloc: IEmojiPickerRecentCategoryLocalPreferenceBloc.of(
              context,
              listen: false,
            ),
          );

          var emojiPickerSearchCategoryBloc = EmojiPickerSearchCategoryBloc(
            allCategoryBlocs: CustomEmojiPickerCodeCategoryBloc.allCategories,
          );

          var allCategoriesBlocs = <ICustomEmojiPickerCategoryBloc>[
            emojiPickerRecentCategoryBloc,
            if (useImageEmoji) customCategoryBloc!,
            emojiPickerSearchCategoryBloc,
            ...CustomEmojiPickerCodeCategoryBloc.allCategories,
          ];

          // ignore: cascade_invocations
          for (final bloc in allCategoriesBlocs) {
            bloc.performAsyncInit();
          }
          var customEmojiPickerBloc = CustomEmojiPickerBloc(
            selectedCategory: allCategoriesBlocs.first,
            availableCategories: allCategoriesBlocs,
          );

          customEmojiPickerBloc.selectedEmojiStream.listen((emojiItem) {
            emojiPickerRecentCategoryBloc.onEmojiSelected(emojiItem);
          }).disposeWith(customEmojiPickerBloc);

          customEmojiPickerBloc.addCustomDisposable(
            () async {
              for (final categoryBloc in allCategoriesBlocs) {
                await categoryBloc.dispose();
              }
            },
          );

          return customEmojiPickerBloc;
        },
        child: CustomEmojiPickerWidget(
          selectedCategoryItemsGridHeight: selectedCategoryItemsGridHeight,
          rowsCount: rowsCount,
          emptyCategoryBuilder: (context, categoryBloc) {
            String text;
            if (categoryBloc is EmojiPickerCustomImageUrlCategoryBloc) {
              text = S.of(context).app_emoji_custom_empty;
            } else if (categoryBloc is EmojiPickerRecentCategoryBloc) {
              text = S.of(context).app_emoji_recent_empty;
            } else if (categoryBloc is EmojiPickerSearchCategoryBloc) {
              return null;
            } else {
              text = S.of(context).app_emoji_category_empty;
            }

            return Text(
              text,
              style: IFediUiTextTheme.of(context).mediumTallDarkGrey,
            );
          },
          useImageEmoji: useImageEmoji,
          customCategoryIconBuilder: (category) {
            if (category is EmojiPickerCustomImageUrlCategoryBloc) {
              return FediIcons.instance;
            } else if (category is EmojiPickerRecentCategoryBloc) {
              return FediIcons.refresh;
            } else if (category is EmojiPickerSearchCategoryBloc) {
              return FediIcons.search;
            } else {
              return null;
            }
          },
          customCategoryBodyBuilder: (
            BuildContext context,
            int rowsCount,
            double selectedCategoryItemsGridHeight,
            EmojiSelectedCallback onEmojiSelected,
          ) {
            var categoryBloc =
                Provider.of<ICustomEmojiPickerCategoryBloc>(context);

            if (categoryBloc is EmojiPickerSearchCategoryBloc) {
              return _EmojiPickerSearchCategoryBlocBodyWidget(
                rowsCount: rowsCount,
                selectedCategoryItemsGridHeight:
                    selectedCategoryItemsGridHeight,
                onEmojiSelected: onEmojiSelected,
              );
            } else {
              return null;
            }
          },
          loadingWidget: const FediCircularProgressIndicator(),
          selectedIndicatorColor: IFediUiColorTheme.of(context).primary,
          unselectedIndicatorColor: IFediUiColorTheme.of(context).darkGrey,
          separatorColor: IFediUiColorTheme.of(context).ultraLightGrey,
          onEmojiSelected: onEmojiSelected,
        ),
      );
}

class _EmojiPickerSearchCategoryBlocBodyWidget extends StatelessWidget {
  final int rowsCount;
  final double selectedCategoryItemsGridHeight;
  final EmojiSelectedCallback onEmojiSelected;

  const _EmojiPickerSearchCategoryBlocBodyWidget({
    Key? key,
    required this.rowsCount,
    required this.selectedCategoryItemsGridHeight,
    required this.onEmojiSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categoryBloc = Provider.of<ICustomEmojiPickerCategoryBloc>(context);
    var emojiPickerSearchCategoryBloc =
        categoryBloc as EmojiPickerSearchCategoryBloc;

    return Column(
      children: [
        FediTransparentEditTextField(
          expanded: false,
          autofocus: false,
          hintText: S.of(context).app_emoji_search_hint,
          errorText: null,
          maxLines: 1,
          onSubmitted: null,
          textInputAction: TextInputAction.done,
          textEditingController:
              emojiPickerSearchCategoryBloc.searchTextEditingController,
          focusNode: null,
          highlightMentions: false,
          maxLength: null,
        ),
        Expanded(
          child: CustomEmojiPickerSelectedCategoryItemsGridWidget(
            rowsCount: rowsCount - 1,
            selectedCategoryItemsGridHeight: selectedCategoryItemsGridHeight,
            onEmojiSelected: onEmojiSelected,
          ),
        ),
      ],
    );
  }
}
