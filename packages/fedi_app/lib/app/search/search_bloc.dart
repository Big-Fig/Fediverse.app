import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/search/input/search_input_bloc.dart';
import 'package:fedi_app/app/search/search_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ISearchBloc extends IDisposable {
  static ISearchBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ISearchBloc>(context, listen: listen);

  ISearchInputBloc get searchInputBloc;

  SearchTab get selectedTab;

  Stream<SearchTab> get selectedTabStream;

  void selectTab(SearchTab tab);
}
