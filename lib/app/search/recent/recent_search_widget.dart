import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/search/recent/recent_search_bloc.dart';
import 'package:fedi/app/search/recent/recent_search_model.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
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
                      "app.search.recent.title".tr(),
                      style: FediTextStyles.bigTallBoldDarkGrey,
                    ),
                    if (recentItemsIsNotEmpty)
                      buildClearButton(recentSearchBloc)
                  ],
                ),
                FediSmallVerticalSpacer(),
                FediUltraLightGreyDivider(),
                Expanded(
                  child: recentItemsIsNotEmpty
                      ? buildListView(recentSearchBloc, recentItems)
                      : Center(
                          child: Text(
                            "app.search.recent.empty".tr(),
                            style: FediTextStyles.mediumShortDarkGrey,
                          ),
                        ),
                ),
              ],
            ),
          );
        });
  }

  IconButton buildClearButton(IRecentSearchBloc recentSearchBloc) {
    return IconButton(
      icon: Icon(
        FediIcons.remove,
        color: FediColors.darkGrey,
      ),
      onPressed: () {
        recentSearchBloc.clearRecentSearch();
      },
    );
  }

  ListView buildListView(IRecentSearchBloc recentSearchBloc, Iterable<String>
  recentItems) {
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
                  style: FediTextStyles.bigTallDarkGrey,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
