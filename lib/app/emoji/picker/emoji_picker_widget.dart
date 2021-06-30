import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/emoji/picker/category/custom_image_url/emoji_picker_custom_image_url_category_bloc_impl.dart';
import 'package:fedi/app/emoji/picker/category/custom_image_url/local_preferences/emoji_picker_custom_image_url_category_local_preference_bloc.dart';
import 'package:fedi/app/emoji/picker/category/recent/emoji_picker_recent_category_bloc_impl.dart';
import 'package:fedi/app/emoji/picker/category/recent/local_preferences/emoji_picker_recent_category_local_preference_bloc.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/emoji_picker/category/code/custom_emoji_picker_code_category_bloc_impl.dart';
import 'package:fedi/emoji_picker/category/custom_emoji_picker_category_bloc.dart';
import 'package:fedi/emoji_picker/custom_emoji_picker_bloc.dart';
import 'package:fedi/emoji_picker/custom_emoji_picker_bloc_impl.dart';
import 'package:fedi/emoji_picker/custom_emoji_picker_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/mastodon/api/emoji/mastodon_api_custom_emoji_service.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmojiPickerWidget extends StatelessWidget {
  final EmojiSelectedCallback onEmojiSelected;
  final bool useImageEmoji;
  final double selectedCategoryItemsGridHeight;
  final int rowsCount;

  EmojiPickerWidget({
    required this.onEmojiSelected,
    required this.useImageEmoji,
    // ignore: no-magic-number
    this.rowsCount = 3,
    // ignore: no-magic-number
    this.selectedCategoryItemsGridHeight = 108.0,
  });

  @override
  // todo: refactor
  // ignore: long-method
  Widget build(BuildContext context) {
    return DisposableProvider<ICustomEmojiPickerBloc>(
      create: (context) {
        EmojiPickerCustomImageUrlCategoryBloc? customCategoryBloc;
        if (useImageEmoji) {
          customCategoryBloc = EmojiPickerCustomImageUrlCategoryBloc(
            pleromaApiEmojiService:
                IPleromaApiEmojiService.of(context, listen: false),
            preferenceBloc:
                IEmojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc.of(
              context,
              listen: false,
            ),
            currentAuthInstanceBloc: ICurrentAuthInstanceBloc.of(
              context,
              listen: false,
            ),
            mastodonApiEmojiService: IMastodonApiEmojiService.of(
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

        var allCategoriesBlocs = <ICustomEmojiPickerCategoryBloc>[
          emojiPickerRecentCategoryBloc,
          if (useImageEmoji) customCategoryBloc!,
          ...CustomEmojiPickerCodeCategoryBloc.allCategories,
        ];

        allCategoriesBlocs.forEach((bloc) {
          bloc.performAsyncInit();
        });
        var customEmojiPickerBloc = CustomEmojiPickerBloc(
          selectedCategory: allCategoriesBlocs.first,
          availableCategories: allCategoriesBlocs,
        );

        customEmojiPickerBloc.selectedEmojiStream.listen((emojiItem) {
          emojiPickerRecentCategoryBloc.onEmojiSelected(emojiItem);
        }).disposeWith(customEmojiPickerBloc);

        customEmojiPickerBloc.addCustomDisposable(
          () => allCategoriesBlocs.forEach(
            (categoryBloc) => categoryBloc.dispose(),
          ),
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
}
