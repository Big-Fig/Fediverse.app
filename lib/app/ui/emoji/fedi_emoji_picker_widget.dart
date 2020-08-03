import 'package:fedi/app/ui/emoji/fedi_emoji_picker_model.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/emoji_picker/category/code/custom_emoji_picker_code_category_bloc_impl.dart';
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

    var pleromaEmojiService = IPleromaEmojiService.of(context, listen: false);
    return DisposableProvider<ICustomEmojiPickerBloc>(
      create: (context) {
        var allCategories = [
          FediEmojiPickerPleromaImageUrlCategory(items: []),
          ...CustomEmojiPickerCodeCategoryBloc.allCategories,
        ];
        return CustomEmojiPickerBloc(
            selectedCategory: allCategories.first,
            availableCategories: allCategories);
      },
      child: CustomEmojiPickerWidget(
        customCategoryIconBuilder: (category) {
          if (category is FediEmojiPickerPleromaImageUrlCategory) {
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
