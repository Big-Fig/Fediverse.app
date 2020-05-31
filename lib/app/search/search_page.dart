import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/search/search_bloc.dart';
import 'package:fedi/app/search/search_bloc_impl.dart';
import 'package:fedi/app/search/search_model.dart';
import 'package:fedi/app/search/search_widget.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: tr("app.search.title"),
      ),
      body: SearchWidget(),
    );
}

void goToSearchPage(BuildContext context,
    {SearchTab startTab = SearchTab.accounts}) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<ISearchBloc>(
            create: (context) =>
                SearchBloc.createFromContext(context, startTab: startTab),
            child: SearchPage())),
  );
}
