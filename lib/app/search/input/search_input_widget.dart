import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_remove_icon_in_circle_button.dart';
import 'package:fedi/app/ui/edit_text/fedi_filled_edit_text_field.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInputWidget extends StatelessWidget {
  final bool autofocus;
  final EdgeInsets padding;

  const SearchInputWidget({
    this.autofocus = false,
    this.padding = const EdgeInsets.only(right: FediSizes.bigPadding),
  });

  @override
  Widget build(BuildContext context) {
    var searchInputBloc = ISearchInputBloc.of(context);

    return Padding(
      padding: padding,
      child: Row(
        children: [
          Flexible(
            child: SizedBox(
              // todo: refactor
              // ignore: no-magic-number
              height: 40.0,
              child: FediFilledEditTextField(
                border:
                    Border.all(color: IFediUiColorTheme.of(context).darkGrey),
                leading: Padding(
                  padding: FediPadding.horizontalBigPadding,
                  child: Icon(
                    FediIcons.search,
                    color: IFediUiColorTheme.of(context).grey,
                    // todo: refactor
                    // ignore: no-magic-number
                    size: 20.0,
                  ),
                ),
                autofocus: autofocus,
                backgroundColor: IFediUiColorTheme.of(context).white,
                textEditingController:
                    searchInputBloc.searchTextEditingController,
                expanded: false,
                hintText: S.of(context).app_search_field_input_hint,
                ending: const _SearchInputClearButtonWidget(),
                textInputAction: TextInputAction.search,
                onSubmitted: (_) {
                  searchInputBloc.confirmSearch();
                },
                maxLines: 1,
                errorText: null,
                highlightMentions: false,
                maxLength: null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchInputClearButtonWidget extends StatelessWidget {
  const _SearchInputClearButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchInputBloc = ISearchInputBloc.of(
      context,
    );

    return StreamBuilder<bool>(
      stream: searchInputBloc.currentInputIsNotEmptyStream,
      initialData: searchInputBloc.currentInputIsNotEmpty,
      builder: (context, snapshot) {
        var currentInputIsNotEmpty = snapshot.data!;

        if (currentInputIsNotEmpty) {
          return Padding(
            padding: const EdgeInsets.only(right: FediSizes.bigPadding),
            child: FediRemoveIconInCircleButton(
              onPressed: () {
                searchInputBloc.clearSearch();
              },
              // todo: refactor
              // ignore: no-magic-number
              size: 20.0,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
