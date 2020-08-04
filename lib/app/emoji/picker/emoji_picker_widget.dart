import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/emoji/picker/category/custom/emoji_picker_custom_image_url_category_bloc_impl.dart';
import 'package:fedi/app/emoji/picker/category/custom/emoji_picker_custom_image_url_category_local_preference_bloc.dart';
import 'package:fedi/app/emoji/picker/category/recent/emoji_picker_recent_category_bloc_impl.dart';
import 'package:fedi/app/emoji/picker/category/recent/emoji_picker_recent_category_local_preference_bloc.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/emoji_picker/category/code/custom_emoji_picker_code_category_bloc_impl.dart';
import 'package:fedi/emoji_picker/category/custom_emoji_picker_category_bloc.dart';
import 'package:fedi/emoji_picker/custom_emoji_picker_bloc.dart';
import 'package:fedi/emoji_picker/custom_emoji_picker_bloc_impl.dart';
import 'package:fedi/emoji_picker/custom_emoji_picker_widget.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FediEmojiPickerWidget extends StatelessWidget {
  final EmojiSelectedCallback onEmojiSelected;

  FediEmojiPickerWidget({@required this.onEmojiSelected});

  @override
  Widget build(BuildContext context) {
    return DisposableProvider<ICustomEmojiPickerBloc>(
      create: (context) {
        var customCategoryBloc = EmojiPickerCustomImageUrlCategoryBloc(
          pleromaEmojiService: IPleromaEmojiService.of(context, listen: false),
          preferenceBloc:
              IEmojiPickerCustomImageUrlCategoryBlocLocalPreferenceBloc.of(
            context,
            listen: false,
          ),
          currentAuthInstanceBloc: ICurrentAuthInstanceBloc.of(
            context,
            listen: false,
          ),
        );

        var emojiPickerRecentCategoryBloc = EmojiPickerRecentCategoryBloc(
          preferenceBloc: IEmojiPickerRecentCategoryLocalPreferenceBloc.of(
              context,
              listen: false),
        );

        var allCategoriesBlocs = <ICustomEmojiPickerCategoryBloc>[
//          emojiPickerRecentCategoryBloc,
          customCategoryBloc,
          ...CustomEmojiPickerCodeCategoryBloc.allCategories,
        ];
        var customEmojiPickerBloc = CustomEmojiPickerBloc(
            selectedCategory: allCategoriesBlocs.first,
            availableCategories: allCategoriesBlocs);

        customEmojiPickerBloc.addDisposable(custom: () {
          allCategoriesBlocs.forEach((categoryBloc) => categoryBloc.dispose());
        });
        return customEmojiPickerBloc;
      },
      child: CustomEmojiPickerWidget(
        customCategoryIconBuilder: (category) {
          if (category is EmojiPickerCustomImageUrlCategoryBloc) {
            return Icons.star;
          } else {
            return null;
          }
        },
        loadingWidget: const FediCircularProgressIndicator(),
        selectedIndicatorColor: FediColors.primaryColor,
        unselectedIndicatorColor: FediColors.darkGrey,
        separatorColor: FediColors.ultraLightGrey,
        rowsCount: 5,
        onEmojiSelected: onEmojiSelected,
      ),
    );
  }
}
