import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/async_smart_refresher_helper.dart';
import 'package:fedi/app/list/list_refresh_header_widget.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/app/status/post/post_status_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/thread/status_thread_bloc.dart';
import 'package:fedi/app/status/thread/status_thread_page.dart';
import 'package:fedi/app/ui/divider/fedi_light_grey_divider.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StatusThreadWidget extends StatefulWidget {
  @override
  _StatusThreadWidgetState createState() => _StatusThreadWidgetState();
}

class _StatusThreadWidgetState extends State<StatusThreadWidget> {
  RefreshController refreshController = RefreshController(initialRefresh: true);
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionListener =
      ItemPositionsListener.create();

  bool isJumpedToStartState = false;

  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var statusThreadBloc = IStatusThreadBloc.of(context, listen: false);

    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: FediColors.offWhite,
            child: buildMessageList(context, statusThreadBloc),
          ),
        ),
        FediUltraLightGreyDivider(),
        PostStatusWidget(
          goBackOnSuccess: false,
          expanded: false,
          isTransparent: false,
          displayMentions: false,
        )
      ],
    );
  }

  Widget buildMessageList(
      BuildContext context, IStatusThreadBloc statusThreadBloc) {
    return StreamBuilder<List<IStatus>>(
        stream: statusThreadBloc.statusesStream,
        initialData: statusThreadBloc.statuses,
        builder: (context, snapshot) {
          var statuses = snapshot.data;

          return SmartRefresher(
            enablePullUp: false,
            enablePullDown: true,
            header: ListRefreshHeaderWidget(),
            controller: refreshController,
            onRefresh: () => AsyncSmartRefresherHelper.doAsyncRefresh(
                controller: refreshController,
                action: statusThreadBloc.refresh),
            child: buildList(statusThreadBloc, statuses),
          );
        });
  }

  Widget buildList(IStatusThreadBloc statusThreadBloc, List<IStatus> statuses) {
    if (statuses.isEmpty) {
      return Text(AppLocalizations.of(context).tr("app.list.empty"));
    } else {
      // jump only after context messages loaded
      if (!isJumpedToStartState && statuses.length > 1) {
        isJumpedToStartState = true;
        Future.delayed(Duration(milliseconds: 1000), () {
          if (itemScrollController.isAttached) {
            var startStatusIndex =
                statusThreadBloc.initialStatusToFetchThreadIndex;
            itemScrollController.scrollTo(
                index: startStatusIndex,
                duration: Duration(milliseconds: 1000));
          }
        });
      }

      return ScrollablePositionedList.builder(
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionListener,
//        padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 10.0),
        itemCount: statuses.length,
        itemBuilder: (BuildContext context, int index) {
          var status = statuses[index];
          var isFirstInList = index == 0;
          return Provider.value(
            value: status,
            child: Padding(
              padding: isFirstInList
                  ? const EdgeInsets.only(bottom: 3.0)
                  : const EdgeInsets.symmetric(vertical: 4.0),
              child: Container(
                color: FediColors.white,
                child: Column(
                  children: [
                    StatusListItemTimelineWidget.thread(
                      statusCallback: (context, status) {
                        if (status.remoteId !=
                            statusThreadBloc
                                .initialStatusToFetchThread.remoteId) {
                          goToStatusThreadPage(context, status);
                        }
                      },
                      collapsible: false,
                      displayAccountHeader:
                          !statusThreadBloc.isFirstStatusInThread(status),
                    ),
                    if (isFirstInList) FediLightGreyDivider(),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
