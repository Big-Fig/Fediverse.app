import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_model.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_dialog.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_confirm_alert_dialog.dart';
import 'package:fedi/app/ui/fedi_animations.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/selection/fedi_selection_item_row_widget.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("timelines_home_tab_storage_widget.dart");

class TimelinesHomeTabStorageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var timelinesHomeTabStorageBloc = ITimelinesHomeTabStorageBloc.of(context);

    return StreamBuilder<List<TimelinesHomeTabStorageListItem>>(
      stream: timelinesHomeTabStorageBloc.timelineStorageItemsDistinctStream,
      builder: (context, snapshot) {
        var list = snapshot.data;

        if (list == null) {
          return const SizedBox.shrink();
        }
        return Provider<List<TimelinesHomeTabStorageListItem>>.value(
          value: list,
          child: const _TimelinesHomeTabStorageListWidget(),
        );
      },
    );
  }

  const TimelinesHomeTabStorageWidget();
}

class _TimelinesHomeTabStorageListWidget extends StatelessWidget {
  const _TimelinesHomeTabStorageListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelinesHomeTabStorageBloc = ITimelinesHomeTabStorageBloc.of(context);

    var items = Provider.of<List<TimelinesHomeTabStorageListItem>>(context);

    if (items == null) {
      return const FediCircularProgressIndicator();
    }

    if (items.isEmpty) {
      return Center(
        child: Text(
          S.of(context).app_timeline_storage_empty,
        ),
      );
    }

    var children = items
        .map(
          (item) => ReorderableItem(
            key: item.key,
            childBuilder: (BuildContext context, ReorderableItemState state) =>
                Provider<Timeline>.value(
              value: item.timeline,
              child: const _TimelinesHomeTabStorageListItemWidget(),
            ),
          ),
        )
        .toList();
    return ReorderableList(
      onReorder: (Key item, Key newPosition) =>
          _reorderCallback(timelinesHomeTabStorageBloc, item, newPosition),
      onReorderDone: (Key item) =>
          _reorderDone(timelinesHomeTabStorageBloc, item),
      child: ListView(
        children: children,
      ),
      // onReorder: (oldIndex, newIndex) {
      //   _logger.finest(() => "onReorder oldIndex $oldIndex newIndex $newIndex");
      //   _logger.finest(() => "onReorder oldItems $items");
      //   if (newIndex > oldIndex) {
      //     newIndex -= 1;
      //   }
      //
      //   final oldValue = items.removeAt(oldIndex);
      //   items.insert(newIndex, oldValue);
      //
      //   _logger.finest(() => "onReorder afterItems $items");
      //
      //   timelinesHomeTabStorageBloc.onItemsUpdated(items);
      // },
    );
  }

  bool _reorderCallback(
      ITimelinesHomeTabStorageBloc timelinesHomeTabStorageBloc,
      Key item,
      Key newPosition) {
    int oldIndex = timelinesHomeTabStorageBloc.indexOfKey(item);
    int newIndex = timelinesHomeTabStorageBloc.indexOfKey(newPosition);

    _logger.finest(() => "onReorder oldIndex $oldIndex newIndex $newIndex");
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    timelinesHomeTabStorageBloc.swapItemsAt(oldIndex, newIndex);

    //
    // // Uncomment to allow only even target reorder possition
    // // if (newPositionIndex % 2 == 1)
    // //   return false;
    //
    // final draggedItem = _items[draggingIndex];
    // setState(() {
    //   debugPrint("Reordering $item -> $newPosition");
    //   _items.removeAt(draggingIndex);
    //   _items.insert(newPositionIndex, draggedItem);
    // });
    return true;
  }

  void _reorderDone(
      ITimelinesHomeTabStorageBloc timelinesHomeTabStorageBloc, Key item) {
    final draggedItem = timelinesHomeTabStorageBloc.timelineOfKey(item);
    debugPrint("Reordering finished for ${draggedItem}}");
  }
}

class _TimelinesHomeTabStorageListItemWidget extends StatelessWidget {
  const _TimelinesHomeTabStorageListItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelinesHomeTabStorageBloc = ITimelinesHomeTabStorageBloc.of(context);
    var timeline = Provider.of<Timeline>(context);

    return InkWell(
      onTap: () {
        var uiState = timelinesHomeTabStorageBloc.uiState;
        if (uiState == TimelinesHomeTabStorageUiState.view) {
          showTimelineSettingsDialog(context: context, timeline: timeline);
        }
      },
      child: FediSelectionItemRowWidget(
        key: Key(
          timeline.id,
        ),
        leading: const _TimelinesHomeTabStorageListItemLeadingWidget(),
        title: const _TimelinesHomeTabStorageListItemTitleWidget(),
        ending: const _TimelinesHomeTabStorageListItemEndingWidget(),
      ),
    );
  }
}

class _TimelinesHomeTabStorageListItemTitleWidget extends StatelessWidget {
  const _TimelinesHomeTabStorageListItemTitleWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timeline = Provider.of<Timeline>(context);

    return InkWell(
      onTap: () {
        showTimelineSettingsDialog(
          context: context,
          timeline: timeline,
        );
      },
      child: Row(
        children: [
          Text(
            timeline.label,
            style: IFediUiTextTheme.of(context).mediumShortDarkGrey,
          ),
        ],
      ),
    );
  }
}

class _TimelinesHomeTabStorageListItemEndingWidget extends StatelessWidget {
  const _TimelinesHomeTabStorageListItemEndingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelinesHomeTabStorageBloc = ITimelinesHomeTabStorageBloc.of(context);
    var timeline = Provider.of<Timeline>(context);

    return StreamBuilder<TimelinesHomeTabStorageUiState>(
      stream: timelinesHomeTabStorageBloc.uiStateStream,
      initialData: timelinesHomeTabStorageBloc.uiState,
      builder: (context, snapshot) {
        var uiState = snapshot.data;

        Widget child;
        switch (uiState) {
          case TimelinesHomeTabStorageUiState.edit:
            child = ReorderableListener(
              child: Container(
                padding: EdgeInsets.only(right: 18.0, left: 18.0),
                color: Color(0x08000000),
                child: Center(
                  child: Icon(Icons.reorder, color: Color(0xFF888888)),
                ),
              ),
            );
            // child = InkWell(
            //   onTap: () {
            //     showTimelineSettingsDialog(
            //       context: context,
            //       timeline: timeline,
            //     );
            //   },
            //   child: Icon(
            //     FediIcons.sort,
            //     size: 16.0,
            //     color: IFediUiColorTheme.of(context).lightGrey,
            //   ),
            // );
            break;
          case TimelinesHomeTabStorageUiState.view:
            child = FediSelectionItemIconWidget(
              onClick: () {
                showTimelineSettingsDialog(
                  context: context,
                  timeline: Provider.of(context, listen: false),
                );
              },
            );
            break;
        }

        return child;
      },
    );
  }
}

class _TimelinesHomeTabStorageListItemLeadingWidget extends StatelessWidget {
  const _TimelinesHomeTabStorageListItemLeadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelinesHomeTabStorageBloc = ITimelinesHomeTabStorageBloc.of(context);
    var timeline = Provider.of<Timeline>(context);
    return StreamBuilder<TimelinesHomeTabStorageUiState>(
        stream: timelinesHomeTabStorageBloc.uiStateStream,
        initialData: timelinesHomeTabStorageBloc.uiState,
        builder: (context, snapshot) {
          var uiState = snapshot.data;

          var child;

          switch (uiState) {
            case TimelinesHomeTabStorageUiState.edit:
              child = _TimelinesHomeTabStorageListItemRemoveButtonWidget(
                key: ValueKey("${timeline.id}.remove_body"),
              );
              break;
            case TimelinesHomeTabStorageUiState.view:
              child = SizedBox.shrink(
                key: ValueKey("${timeline.id}.remove_empty"),
              );
              break;
          }

          return AnimatedSwitcher(
            duration: FediAnimations.defaultAnimationSwitcherDuration,
            transitionBuilder: (Widget child, Animation<double> animation) {
              final offsetAnimation = Tween<Offset>(
                begin: Offset(-1.0, 0.0),
                end: Offset(0.0, 0.0),
              ).animate(animation);
              return SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: animation,
                child: SlideTransition(
                  position: offsetAnimation,
                  child: child,
                ),
              );
            },
            child: child,
          );
        });
  }
}

class _TimelinesHomeTabStorageListItemRemoveButtonWidget
    extends StatelessWidget {
  const _TimelinesHomeTabStorageListItemRemoveButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelinesHomeTabStorageBloc = ITimelinesHomeTabStorageBloc.of(context);
    var timeline = Provider.of<Timeline>(context);

    var isPossibleToDelete = timeline.isPossibleToDelete == true;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isPossibleToDelete)
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                FediConfirmAlertDialog(
                  context: context,
                  title: S.of(context).app_timeline_storage_delete_dialog_title,
                  contentText: S
                      .of(context)
                      .app_timeline_storage_delete_dialog_content(
                          timeline.label),
                  okActionLabel: S
                      .of(context)
                      .app_timeline_storage_delete_dialog_action_delete,
                  onAction: (BuildContext context) {
                    timelinesHomeTabStorageBloc.remove(timeline);
                    Navigator.of(context).pop();
                  },
                ).show(context);
              },
              child: Padding(
                padding: EdgeInsets.only(
                  left: FediSizes.smallPadding,
                  right: FediSizes.bigPadding,
                  // top: FediSizes.smallPadding,
                  // bottom: FediSizes.smallPadding,
                ),
                child: Icon(
                  FediIcons.remove_circle,
                  color: IFediUiColorTheme.of(context).darkGrey,
                ),
              ),
            ),
          ),
        if (!isPossibleToDelete)
          SizedBox(
            width: 48,
          ),
      ],
    );
  }
}
