import 'dart:async';

import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_bloc.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_bloc_impl.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_widget.dart';
import 'package:fedi/app/status/post/thread/thread_post_status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/thread/status_thread_bloc.dart';
import 'package:fedi/app/status/thread/status_thread_page.dart';
import 'package:fedi/app/ui/divider/fedi_light_grey_divider.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_shadows.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/ui/scroll/unfocus_on_scroll_area_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:provider/provider.dart';

class StatusThreadWidget extends StatefulWidget {
  @override
  _StatusThreadWidgetState createState() => _StatusThreadWidgetState();
}

class _StatusThreadWidgetState extends State<StatusThreadWidget> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionListener =
      ItemPositionsListener.create();

  bool isJumpedToStartState = false;

  StreamSubscription newItemsJumpSubscription;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var statusThreadBloc = IStatusThreadBloc.of(context, listen: false);

    newItemsJumpSubscription =
        statusThreadBloc.onNewStatusAddedStream.listen((newItem) {
      var index = statusThreadBloc.statuses.indexOf(newItem);

      if (index > 0) {
        _scrollToIndex(index);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    newItemsJumpSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var statusThreadBloc = IStatusThreadBloc.of(context, listen: false);

    var postMessageWidget = const _StatusThreadPostStatusWidget();

    var postMessageBloc = IPostMessageBloc.of(context, listen: false);

    var fediUiColorTheme = IFediUiColorTheme.of(context);

    return StreamBuilder<bool>(
        stream: postMessageBloc.isExpandedStream,
        initialData: postMessageBloc.isExpanded,
        builder: (context, snapshot) {
          var isPostMessageExpanded = snapshot.data;

          if (isPostMessageExpanded) {
            return postMessageWidget;
          } else {
            return Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: IFediUiColorTheme.of(context).offWhite,
                    child: UnfocusOnScrollAreaWidget(
                      child: buildMessageList(context, statusThreadBloc),
                    ),
                  ),
                ),
                buildInReplyToStatusWidget(context),
                FediUltraLightGreyDivider(),
                Container(
                  decoration: BoxDecoration(
                    color: fediUiColorTheme.white,
                    boxShadow: [FediShadows.forBottomBar],
                  ),
                  child: postMessageWidget,
                )
              ],
            );
          }
        });
  }

  StreamBuilder<IStatus> buildInReplyToStatusWidget(BuildContext context) {
    var postStatusBloc = IThreadPostStatusBloc.of(context, listen: false);
    return StreamBuilder<IStatus>(
        stream: postStatusBloc.notCanceledOriginInReplyToStatusStream,
        initialData: postStatusBloc.notCanceledOriginInReplyToStatus,
        builder: (context, snapshot) {
          var notCanceledOriginInReplyToStatus = snapshot.data;

          if (notCanceledOriginInReplyToStatus != null) {
            return Container(
              color: IFediUiColorTheme.of(context).ultraLightGrey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: FediSizes.mediumPadding,
                  horizontal: FediSizes.bigPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).app_status_reply_replyingTo(
                          notCanceledOriginInReplyToStatus.account.acct),
                      style: IFediUiTextTheme.of(context)
                          .mediumShortGrey
                          .copyWith(height: 1),
                    ),
                    InkWell(
                      child: Icon(Icons.cancel),
                      onTap: () {
                        postStatusBloc.cancelOriginInReplyToStatus();
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        });
  }

  Widget buildMessageList(
      BuildContext context, IStatusThreadBloc statusThreadBloc) {
    return StreamBuilder<List<IStatus>>(
        stream: statusThreadBloc.statusesStream,
        initialData: statusThreadBloc.statuses,
        builder: (context, snapshot) {
          var statuses = snapshot.data;
          return material.RefreshIndicator(
            onRefresh: () => statusThreadBloc.refresh(),
            child: buildList(statusThreadBloc, statuses),
          );
        });
  }

  Widget buildList(IStatusThreadBloc statusThreadBloc, List<IStatus> statuses) {
    if (statuses.isEmpty) {
      return Text(S.of(context).app_list_empty);
    } else {
      // jump only after context messages loaded
      if (!isJumpedToStartState && statuses.length > 1) {
        isJumpedToStartState = true;
        Future.delayed(Duration(milliseconds: 1000), () {
          var startStatusIndex =
              statusThreadBloc.initialStatusToFetchThreadIndex;

          _scrollToIndex(startStatusIndex);
        });
      }

      return ScrollablePositionedList.builder(
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionListener,
        physics: AlwaysScrollableScrollPhysics(),
//        padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 10.0),
        itemCount: statuses.length,
        itemBuilder: (BuildContext context, int index) {
          if (index < 0) {
            // fix non-fatal from firebase. Perhaps ScrollablePositionedList
            // sometimes want to load item out of top bounds
            return SizedBox.shrink();
          }
          var status = statuses[index];
          var isFirstInList = index == 0;
          var isInFocus =
              index == statusThreadBloc.initialStatusToFetchThreadIndex;
          var firstStatusInThread =
              statusThreadBloc.isFirstStatusInThread(status);
          return Provider.value(
            value: status,
            child: Padding(
              padding: isFirstInList
                  ? const EdgeInsets.only(bottom: 3.0)
                  : const EdgeInsets.symmetric(vertical: 4.0),
              child: Container(
                color: isInFocus
                    ? IFediUiColorTheme.of(context)
                        .ultraLightGrey
                        .withOpacity(0.5)
                    : IFediUiColorTheme.of(context).white,
                child: Column(
                  children: [
                    DisposableProxyProvider<IStatus,
                        IStatusListItemTimelineBloc>(
                      update: (context, status, _) =>
                          StatusListItemTimelineBloc.thread(
                        status: status,
                        statusCallback: (context, status) {
                          if (status.remoteId !=
                              statusThreadBloc
                                  .initialStatusToFetchThread.remoteId) {
                            goToStatusThreadPage(
                              context,
                              status: status,
                              initialMediaAttachment: null,
                            );
                          }
                        },
                        collapsible: false,
                        displayAccountHeader: !firstStatusInThread,
                        displayActions: firstStatusInThread || isInFocus,
                        accountMentionCallback:
                            (BuildContext context, IAccount account) {
                          IPostStatusBloc.of(context, listen: false)
                              .addAccountMentions([account]);
                        },
                        initialMediaAttachment:
                            statusThreadBloc.initialMediaAttachment,
                      ),
                      child: const StatusListItemTimelineWidget(),
                    ),
                    const FediLightGreyDivider(),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }

  void _scrollToIndex(int index) {
    if (itemScrollController.isAttached) {
      itemScrollController.scrollTo(
        index: index,
        duration: Duration(milliseconds: 1000),
      );
    }
  }
}

class _StatusThreadPostStatusWidget extends StatelessWidget {
  const _StatusThreadPostStatusWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusThreadBloc = IStatusThreadBloc.of(context);
    return PostStatusWidget(
      hintText: S.of(context).app_status_thread_post_hint(
            statusThreadBloc.initialStatusToFetchThread.account.acct,
          ),
    );
  }
}
