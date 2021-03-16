import 'package:fedi/app/search/recent/recent_search_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRecentSearchLocalPreferenceBloc
    implements LocalPreferenceBloc<RecentSearchList?> {
  static IRecentSearchLocalPreferenceBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IRecentSearchLocalPreferenceBloc>(context,
          listen: listen);
}
