import 'package:fedi_app/app/search/recent/recent_search_bloc.dart';
import 'package:fedi_app/app/search/recent/recent_search_model.dart';
import 'package:fedi_app/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi_app/app/ui/empty/fedi_empty_widget.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentSearchWidget extends StatelessWidget {
  const RecentSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var recentSearchBloc = IRecentSearchBloc.of(context);

    return StreamBuilder<RecentSearchList?>(
      stream: recentSearchBloc.recentSearchListStream,
      initialData: recentSearchBloc.recentSearchList,
      builder: (context, snapshot) {
        var recentSearchList = snapshot.data;

        var recentItems = recentSearchList?.recentItems
            .where((item) => item.isNotEmpty)
            .toList();

        var recentItemsIsNotEmpty = recentItems?.isNotEmpty == true;

        return Provider<List<String>>.value(
          value: recentItems ?? [],
          child: Padding(
            padding: FediPadding.allBigPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _RecentSearchHeaderWidget(),
                const FediSmallVerticalSpacer(),
                const FediUltraLightGreyDivider(),
                Expanded(
                  child: recentItemsIsNotEmpty
                      ? const _RecentSearchListWidget()
                      : const _RecentSearchEmptyWidget(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _RecentSearchHeaderWidget extends StatelessWidget {
  const _RecentSearchHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var recentItems = Provider.of<List<String>>(context);

    var recentItemsIsNotEmpty = recentItems.isNotEmpty;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).app_search_recent_title,
          style: IFediUiTextTheme.of(context).bigTallBoldDarkGrey,
        ),
        if (recentItemsIsNotEmpty) const _RecentSearchClearButtonWidget(),
      ],
    );
  }
}

class _RecentSearchClearButtonWidget extends StatelessWidget {
  const _RecentSearchClearButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
        icon: Icon(
          FediIcons.remove,
          color: IFediUiColorTheme.of(context).darkGrey,
        ),
        onPressed: () {
          var recentSearchBloc = IRecentSearchBloc.of(
            context,
            listen: false,
          );
          // ignore: cascade_invocations
          recentSearchBloc.clearRecentSearch();
        },
      );
}

class _RecentSearchListWidget extends StatelessWidget {
  const _RecentSearchListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var recentItems = Provider.of<List<String>>(context);

    return ListView(
      children: recentItems
          .map(
            (recentItem) => InkWell(
              onTap: () {
                var recentSearchBloc = IRecentSearchBloc.of(
                  context,
                  listen: false,
                );
                // ignore: cascade_invocations
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

class _RecentSearchEmptyWidget extends StatelessWidget {
  const _RecentSearchEmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: FediEmptyWidget(
          title: S.of(context).app_search_recent_empty,
        ),
      );
}
