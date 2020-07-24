import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_remove_icon_in_circle_button.dart';
import 'package:fedi/app/ui/edit_text/fedi_filled_edit_text_field.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInputWidget extends StatelessWidget {
  final bool autofocus;

  SearchInputWidget({this.autofocus = false});

  @override
  Widget build(BuildContext context) {
    var searchInputBloc = ISearchInputBloc.of(context, listen: true);

    return Padding(
      padding: const EdgeInsets.only(right: FediSizes.bigPadding),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 40.0,
              child: FediFilledEditTextField(
                border: Border.all(color: FediColors.darkGrey),
                leading: Padding(
                  padding: FediPadding.horizontalBigPadding,
                  child: Icon(
                    FediIcons.search,
                    color: FediColors.grey,
                    size: 20.0,
                  ),
                ),
                autofocus: autofocus,
                backgroundColor: FediColors.white,
                textEditingController:
                    searchInputBloc.searchTextEditingController,
                expanded: false,
                hintText: tr("app.search.field.input.hint"),
                ending: buildClearButton(searchInputBloc),
                textInputAction: TextInputAction.search,
                onSubmitted: (_) {
                  searchInputBloc.confirmSearch();
                },
                maxLines: 1,
                errorText: null,
                highlightMentions: false,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildClearButton(ISearchInputBloc searchInputBloc) =>
      StreamBuilder<bool>(
          stream: searchInputBloc.currentInputIsNotEmptyStream,
          initialData: searchInputBloc.currentInputIsNotEmpty,
          builder: (context, snapshot) {
            var currentInputIsNotEmpty = snapshot.data;

            if (currentInputIsNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(right: FediSizes.bigPadding),
                child: FediRemoveIconInCircleButton(
                  onPressed: () {
                    searchInputBloc.clearSearch();
                  },
                  size: 20.0,
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          });
}
