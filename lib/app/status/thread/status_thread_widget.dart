import 'dart:async';

import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/message/post_message_bloc.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_bloc.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_bloc_impl.dart';
import 'package:fedi/app/status/list/status_list_item_timeline_widget.dart';
import 'package:fedi/app/status/post/post_status_bloc.dart';
import 'package:fedi/app/status/post/post_status_widget.dart';
import 'package:fedi/app/status/post/thread/thread_post_status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/thread/local_status_thread_page.dart';
import 'package:fedi/app/status/thread/remote_status_thread_page.dart';
import 'package:fedi/app/status/thread/status_thread_bloc.dart';
import 'package:fedi/app/status/thread/status_thread_model.dart';
import 'package:fedi/app/ui/divider/fedi_light_grey_divider.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/empty/fedi_empty_widget.dart';
import 'package:fedi/app/ui/fedi_shadows.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/list/fedi_list_refresh_indicator.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/ui/scroll/unfocus_on_scroll_area_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class StatusThreadWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);

    var statusThreadBloc = IStatusThreadBloc.of(context);
    var isLocal = statusThreadBloc.instanceLocation == InstanceLocation.local;

    return StreamBuilder<bool>(
      stream: isLocal
          ? IPostMessageBloc.of(context).isExpandedStream
          : Stream.value(false),
      builder: (context, snapshot) {
        var isPostMessageExpanded = snapshot.data ?? false;

        if (isPostMessageExpanded) {
          return const _StatusThreadPostStatusWidget();
        } else {
          return Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: IFediUiColorTheme.of(context).offWhite,
                  child: const UnfocusOnScrollAreaWidget(
                    child: _StatusThreadStatusesWidget(),
                  ),
                ),
              ),
              if (isLocal) ...[
                StreamBuilder<bool>(
                  stream: IPostMessageBloc.of(context).isInputFocusedStream,
                  initialData: IPostMessageBloc.of(context).isInputFocused,
                  builder: (context, snapshot) {
                    var isInputFocused = snapshot.data!;
                    if (isInputFocused) {
                      return const _StatusThreadInReplyToStatusWidget();
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                const FediUltraLightGreyDivider(),
                Container(
                  decoration: BoxDecoration(
                    color: fediUiColorTheme.white,
                    boxShadow: const [
                      FediShadows.forBottomBar,
                    ],
                  ),
                  child: const _StatusThreadPostStatusWidget(),
                ),
              ],
            ],
          );
        }
      },
    );
  }

  const StatusThreadWidget();
}

class _StatusThreadStatusesWidget extends StatelessWidget {
  const _StatusThreadStatusesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusThreadBloc = IStatusThreadBloc.of(context);

    return StreamBuilder<List<IStatus>>(
      stream: statusThreadBloc.statusesDistinctStream,
      builder: (context, snapshot) {
        var statuses = snapshot.data;
        if (statuses == null) {
          return const Center(
            child: FediCircularProgressIndicator(),
          );
        }

        return Provider<List<IStatus>>.value(
          value: statuses,
          child: FediListRefreshIndicator(
            onRefresh: () => statusThreadBloc.refresh(),
            child: const _StatusThreadStatusesListWidget(),
          ),
        );
      },
    );
  }
}

class _StatusThreadInReplyToStatusWidget extends StatelessWidget {
  const _StatusThreadInReplyToStatusWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IThreadPostStatusBloc.of(context);

    return StreamBuilder<IStatus?>(
      stream: postStatusBloc.notCanceledOriginInReplyToStatusStream,
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
                          notCanceledOriginInReplyToStatus.account.acct,
                        ),
                    style: IFediUiTextTheme.of(context)
                        .mediumShortGrey
                        .copyWith(height: 1),
                  ),
                  InkWell(
                    onTap: () {
                      postStatusBloc.cancelOriginInReplyToStatus();
                    },
                    child: Icon(
                      Icons.close,
                      color: IFediUiColorTheme.of(context).darkGrey,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _StatusThreadPostStatusWidget extends StatelessWidget {
  const _StatusThreadPostStatusWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusThreadBloc = IStatusThreadBloc.of(context);

    return PostStatusWidget(
      hintText: S.of(context).app_status_thread_post_hint(
            statusThreadBloc.initialStatusToFetchThread!.account.acct,
          ),
      showActionsOnlyWhenFocused: true,
    );
  }
}

class _StatusThreadStatusesListWidget extends StatefulWidget {
  const _StatusThreadStatusesListWidget();

  @override
  _StatusThreadStatusesListWidgetState createState() =>
      _StatusThreadStatusesListWidgetState();
}

class _StatusThreadStatusesListWidgetState
    extends State<_StatusThreadStatusesListWidget> {
  StreamSubscription? newItemsJumpSubscription;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var statusThreadBloc = IStatusThreadBloc.of(context, listen: false);

    newItemsJumpSubscription = statusThreadBloc.onNewStatusAddedStream.listen(
      (newItem) {
        var index = statusThreadBloc.statuses.indexOf(newItem);

        if (index > 0) {
          statusThreadBloc.jumpToIndex(index);
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    newItemsJumpSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var statuses = Provider.of<List<IStatus>>(context);

    if (statuses.isEmpty) {
      return const _StatusThreadStatusesListEmptyWidget();
    } else {
      var statusThreadBloc = IStatusThreadBloc.of(context);
      // jump only after context messages loaded
      var isNeedJumpToStartState =
          !statusThreadBloc.isJumpedToStartState && statuses.length > 1;
      if (isNeedJumpToStartState) {
        Future.delayed(
          // todo: refactor
          // ignore: no-magic-number
          Duration(milliseconds: 1000),
          () {
            statusThreadBloc.jumpToStartIndex();
          },
        );
      }

      return ScrollablePositionedList.builder(
        itemScrollController: statusThreadBloc.itemScrollController,
        itemPositionsListener: statusThreadBloc.itemPositionListener,
        physics: const AlwaysScrollableScrollPhysics(),
//        padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 10.0),
        itemCount: statuses.length,
        itemBuilder: (BuildContext context, int index) {
          if (index < 0) {
            // fix non-fatal from firebase. Perhaps ScrollablePositionedList
            // sometimes want to load item out of top bounds
            return const SizedBox.shrink();
          }
          var status = statuses[index];

          return Provider<StatusThreadStatusAtIndex>.value(
            value: StatusThreadStatusAtIndex(
              index: index,
              status: status,
            ),
            child: Provider<IStatus>.value(
              value: status,
              child: const _StatusThreadStatusesListItemWidget(),
            ),
          );
        },
      );
    }
  }
}

class _StatusThreadStatusesListItemWidget extends StatelessWidget {
  const _StatusThreadStatusesListItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusThreadBloc = IStatusThreadBloc.of(context, listen: false);

    var statusAtIndex = Provider.of<StatusThreadStatusAtIndex>(context);
    var index = statusAtIndex.index;
    var status = statusAtIndex.status;
    var isFirstInList = index == 0;
    var isInFocus = index == statusThreadBloc.initialStatusToFetchThreadIndex;
    var isFirstStatusInThread = statusThreadBloc.isFirstStatusInThread(status);

    return Padding(
      padding: isFirstInList
          // todo: refactor
          // ignore: no-magic-number
          ? const EdgeInsets.only(bottom: 3.0)
          // todo: refactor
          // ignore: no-magic-number
          : const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        color: isInFocus
            // todo: refactor
            // ignore: no-magic-number
            ? IFediUiColorTheme.of(context).ultraLightGrey.withOpacity(0.5)
            : IFediUiColorTheme.of(context).white,
        child: Column(
          children: [
            DisposableProxyProvider<IStatus, IStatusListItemTimelineBloc>(
              update: (context, status, _) => StatusListItemTimelineBloc.thread(
                status: status,
                statusCallback: (context, status) {
                  if (status.remoteId !=
                      statusThreadBloc.initialStatusToFetchThread!.remoteId) {
                    var isLocal = statusThreadBloc.instanceLocation ==
                        InstanceLocation.local;
                    if (isLocal) {
                      goToLocalStatusThreadPage(
                        context,
                        status: status,
                        initialMediaAttachment: null,
                      );
                    } else {
                      goToRemoteStatusThreadPageBasedOnRemoteInstanceStatus(
                        context,
                        remoteInstanceStatus: status,
                        remoteInstanceInitialMediaAttachment: null,
                      );
                    }
                  }
                },
                collapsible: false,
                displayAccountHeader: !isFirstStatusInThread,
                isCommentsActionEnabled: !isInFocus,
                displayActions: true,
                accountMentionCallback:
                    (BuildContext context, IAccount? account) {
                  IPostStatusBloc.of(context, listen: false)
                      .addAccountMentions([account]);
                },
                initialMediaAttachment: statusThreadBloc.initialMediaAttachment,
              ),
              child: const StatusListItemTimelineWidget(),
            ),
            const FediLightGreyDivider(),
          ],
        ),
      ),
    );
  }
}

class _StatusThreadStatusesListEmptyWidget extends StatelessWidget {
  const _StatusThreadStatusesListEmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediEmptyWidget(
        title: S.of(context).app_list_empty,
      );
}
