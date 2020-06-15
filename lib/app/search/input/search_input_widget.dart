import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_filled_button.dart';
import 'package:fedi/app/ui/edit/fedi_filled_edit_text_field.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchInputBloc = ISearchInputBloc.of(context, listen: true);

    return Row(
      children: [
        Flexible(
          child: FediFilledEditTextField(
            autofocus: false,
            textEditingController: searchInputBloc.searchTextEditingController,
            expanded: false,
            hintText: tr("app.search.field.input.hint"),
            ending: IconButton(
              iconSize: FediSizes.filledEditTextIconSize,
              onPressed: () {
                searchInputBloc.clearSearch();
              },
              icon: Icon(Icons.clear),
            ),
            textInputAction: TextInputAction.search,
            onSubmitted: (_) {
              searchInputBloc.performSearch();
            },
            maxLines: 1,
          ),
        ),
        SizedBox(width: 8,),
        FediIconInCircleFilledButton(
          FediIcons.search,
          onPressed: () {
            searchInputBloc.performSearch();
          },
        )
      ],
    );
  }
}
