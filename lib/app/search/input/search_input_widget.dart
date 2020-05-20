import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchInputBloc = ISearchInputBloc.of(context, listen: true);

    return TextField(
      autocorrect: false,
      controller: searchInputBloc.searchTextEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.blue.withAlpha(150),
        hintText:
            AppLocalizations.of(context).tr("app.search.field.input.hint"),
        border: InputBorder.none,
        helperStyle: TextStyle(color: Colors.white),
        suffixIcon: IconButton(
          onPressed: () {
            searchInputBloc.clearSearch();
          },
          icon: Icon(Icons.clear),
        ),
      ),
    );
  }
}
