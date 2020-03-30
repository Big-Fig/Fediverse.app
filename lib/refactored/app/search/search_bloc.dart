import 'package:fedi/refactored/app/search/input/search_input_bloc.dart';
import 'package:fedi/refactored/app/search/search_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ISearchBloc extends Disposable {
  static ISearchBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ISearchBloc>(context, listen: listen);

  ISearchInputBloc get searchInputBloc;


  SearchTab get selectedTab;

  Stream<SearchTab> get selectedTabStream;

  selectTab(SearchTab tab);
}