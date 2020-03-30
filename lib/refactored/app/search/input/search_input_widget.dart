import 'package:fedi/refactored/app/search/input/search_input_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInputWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    var searchInputBloc = ISearchInputBloc.of(context, listen: true);

    return TextField(
      autocorrect: false,
      controller: searchInputBloc.searchTextEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.blue.withAlpha(150),
        // TODO: localization
        hintText: 'Search',
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
