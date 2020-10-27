import 'package:fedi/app/search/recent/recent_search_bloc.dart';
import 'package:fedi/app/search/recent/recent_search_model.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentSearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var recentSearchBloc = IRecentSearchBloc.of(context, listen: false);
    return StreamBuilder<RecentSearchList>(
        stream: recentSearchBloc.recentSearchListStream,
        initialData: recentSearchBloc.recentSearchList,
        builder: (context, snapshot) {
          var recentSearchList = snapshot.data;

          var recentItems = recentSearchList?.recentItems
              ?.where((item) => item?.isNotEmpty == true);

          var recentItemsIsNotEmpty = recentItems?.isNotEmpty == true;
          return Padding(
            padding: FediPadding.allBigPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).app_search_recent_title,
                      style: IFediUiTextTheme.of(context).bigTallBoldDarkGrey,
                    ),
                    if (recentItemsIsNotEmpty)
                      buildClearButton(context, recentSearchBloc)
                  ],
                ),
                FediSmallVerticalSpacer(),
                FediUltraLightGreyDivider(),
                Expanded(
                  child: recentItemsIsNotEmpty
                      ? buildListView(
                          context,
                          recentSearchBloc,
                          recentItems,
                        )
                      : Center(
                          child: Text(
                            S.of(context).app_search_recent_empty,
                            style: IFediUiTextTheme.of(context)
                                .mediumShortDarkGrey,
                          ),
                        ),
                ),
              ],
            ),
          );
        });
  }

  IconButton buildClearButton(
      BuildContext context, IRecentSearchBloc recentSearchBloc) {
    return IconButton(
      icon: Icon(
        FediIcons.remove,
        color: IFediUiColorTheme.of(context).darkGrey,
      ),
      onPressed: () {
        recentSearchBloc.clearRecentSearch();
      },
    );
  }

  ListView buildListView(
    BuildContext context,
    IRecentSearchBloc recentSearchBloc,
    Iterable<String> recentItems,
  ) {
    return ListView(
      children: recentItems
          .map(
            (recentItem) => InkWell(
              onTap: () {
                recentSearchBloc.searchAgain(recentItem);
              },
              child: Padding(
                padding: FediPadding.verticalSmallPadding,
                child: Text(
                  recentItem,
                  style: IFediUiTextTheme.of(context).bigTallDarkGrey,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
