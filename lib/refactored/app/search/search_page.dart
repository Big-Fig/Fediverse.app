import 'package:fedi/refactored/app/search/search_bloc.dart';
import 'package:fedi/refactored/app/search/search_bloc_impl.dart';
import 'package:fedi/refactored/app/search/search_model.dart';
import 'package:fedi/refactored/app/search/search_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // todo: localization
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: SafeArea(child: SearchWidget()),
    );
  }
}

void goToSearchPage(BuildContext context, {SearchTab startTab = SearchTab.accounts}) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<ISearchBloc>(
            create: (context) => SearchBloc.createFromContext(context, startTab: startTab),
            child: SearchPage())),
  );
}