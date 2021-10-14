import 'dart:math';

import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/list/hashtag_list_bloc.dart';
import 'package:fedi/app/hashtag/page/hashtag_page_chooser_dialog.dart';
import 'package:fedi/app/hashtag/page/local/local_hashtag_page.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/ui/chart/fedi_chart_line_graph_painter.dart';
import 'package:fedi/app/ui/divider/fedi_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:fedi/app/ui/statistic/fedi_statistic_item_widget.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HashtagListItemWidget extends StatelessWidget {
  final bool displayHistory;

  const HashtagListItemWidget({
    required this.displayHistory,
  });

  @override
  Widget build(BuildContext context) {
    var hashtag = Provider.of<IHashtag>(context);

    return InkWell(
      onTap: () {
        var hashtagListBloc = IHashtagListBloc.of(
          context,
          listen: false,
        );

        var isLocal =
            hashtagListBloc.instanceLocation == InstanceLocation.local;
        if (isLocal) {
          goToLocalHashtagPage(
            context: context,
            hashtag: hashtag,
            myAccountFeaturedHashtag: null,
          );
        } else {
          showHashtagPageChooserDialog(
            context: context,
            hashtag: hashtag,
            remoteInstanceUri: hashtagListBloc.remoteInstanceUriOrNull!,
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _HashtagListItemNameWidget(),
              if (displayHistory) const _HashtagListItemHistoryWidget(),
            ],
          ),
          const FediLightGreyDivider(),
        ],
      ),
    );
  }
}

class _HashtagListItemNameWidget extends StatelessWidget {
  const _HashtagListItemNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hashtag = Provider.of<IHashtag>(context);

    return Padding(
      padding: FediPadding.allBigPadding,
      child: Text(
        '#${hashtag.name}',
        textAlign: TextAlign.left,
        style: IFediUiTextTheme.of(context).mediumShortDarkGrey,
      ),
    );
  }
}

class _HashtagListItemHistoryWidget extends StatelessWidget {
  const _HashtagListItemHistoryWidget();

  @override
  Widget build(BuildContext context) {
    var hashtag = Provider.of<IHashtag>(context);
    var history = hashtag.history;

    if (history?.items.isNotEmpty != true) {
      return const SizedBox.shrink();
    }

    return Row(
      children: const [
        _HashtagListItemStatusesWidget(),
        FediSmallHorizontalSpacer(),
        _HashtagListItemHistoryAccountsWidget(),
        FediSmallHorizontalSpacer(),
        _HashtagListItemHistoryGraphWidget(),
      ],
    );
  }
}

class _HashtagListItemHistoryAccountsWidget extends StatelessWidget {
  const _HashtagListItemHistoryAccountsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hashtag = Provider.of<IHashtag>(context);
    var history = hashtag.history;

    var items = history?.items ?? [];
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    return FediStatisticItemWidget(
      valueString: items.first.accounts.toString(),
      label: S.of(context).app_hashtag_history_accounts,
      color: IFediUiColorTheme.of(context).darkGrey,
    );
  }
}

class _HashtagListItemStatusesWidget extends StatelessWidget {
  const _HashtagListItemStatusesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hashtag = Provider.of<IHashtag>(context);
    var history = hashtag.history;

    var items = history?.items ?? [];
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    return FediStatisticItemWidget(
      valueString: items.first.uses.toString(),
      label: S.of(context).app_hashtag_history_statuses,
      color: IFediUiColorTheme.of(context).darkGrey,
    );
  }
}

class _HashtagListItemHistoryGraphWidget extends StatelessWidget {
  const _HashtagListItemHistoryGraphWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hashtag = Provider.of<IHashtag>(context);
    var history = hashtag.history;

    var items = history?.items ?? [];
    if (items.isEmpty) {
      return SizedBox.shrink();
    }

    var maxUses = items.first.uses;

    for (var item in items) {
      maxUses = max(item.uses, maxUses);
    }

    var featureUses = FediChartLineGraphPainterFeature(
      color: IFediUiColorTheme.of(context).primary,
      data:
          items.reversed.map((item) => item.uses.toDouble() / maxUses).toList(),
    );

    var labels = featureUses.data.map((d) => '').toList();

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CustomPaint(
        // ignore: no-magic-number
        size: Size(90, 45),
        painter: FediChartLineGraphPainter(
          features: [featureUses],
          labelY: labels,
          // ignore: no-equal-arguments
          labelX: labels,
          fontFamily: null,
          graphColor: IFediUiColorTheme.of(context).white,
          // ignore: no-magic-number
          graphOpacity: 0.2,
        ),
      ),
    );
  }
}
