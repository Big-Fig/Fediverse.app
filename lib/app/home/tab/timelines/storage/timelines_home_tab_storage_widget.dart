import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_model.dart';
import 'package:fedi/app/timeline/create/create_timeline_page.dart';
import 'package:fedi/app/timeline/settings/edit/edit_timeline_settings_dialog.dart';
import 'package:fedi/app/timeline/timeline_label_extension.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_confirm_alert_dialog.dart';
import 'package:fedi/app/ui/empty/fedi_empty_widget.dart';
import 'package:fedi/app/ui/fedi_animations.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/selection/fedi_selection_item_row_widget.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart'
    as flutter_reorderable_list;
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger('timelines_home_tab_storage_widget.dart');

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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelinesHomeTabStorageBloc = ITimelinesHomeTabStorageBloc.of(context);

    var items = Provider.of<List<TimelinesHomeTabStorageListItem>>(context);

    if (items.isEmpty) {
      return Center(
        child: FediEmptyWidget(
          title: S.of(context).app_timeline_storage_empty,
        ),
      );
    }

    var children = items
        .map(
          (item) => flutter_reorderable_list.ReorderableItem(
            key: item.key,
            childBuilder: (
              BuildContext context,
              flutter_reorderable_list.ReorderableItemState state,
            ) =>
                Provider<Timeline>.value(
              value: item.timeline,
              child: Opacity(
                opacity: state ==
                        flutter_reorderable_list
                            .ReorderableItemState.placeholder
                    ? 0.0
                    : 1.0,
                child: const _TimelinesHomeTabStorageListItemWidget(),
              ),
            ),
          ),
        )
        .toList();

    return flutter_reorderable_list.ReorderableList(
      onReorder: (Key item, Key newPosition) =>
          _onReorder(timelinesHomeTabStorageBloc, item, newPosition),
      onReorderDone: (Key item) =>
          _onReorderDone(timelinesHomeTabStorageBloc, item),
      child: ListView(
        children: [
          ...children,
          const _TimelinesHomeTabStorageListAddTimelineItemWidget(),
        ],
      ),
    );
  }

  bool _onReorder(
    ITimelinesHomeTabStorageBloc timelinesHomeTabStorageBloc,
    Key item,
    Key newPosition,
  ) {
    int oldIndex = timelinesHomeTabStorageBloc.indexOfKey(item);
    int newIndex = timelinesHomeTabStorageBloc.indexOfKey(newPosition);

    _logger.finest(() => 'onReorder oldIndex $oldIndex newIndex $newIndex');

    timelinesHomeTabStorageBloc.swapItemsAt(oldIndex, newIndex);

    return true;
  }

  void _onReorderDone(
    ITimelinesHomeTabStorageBloc timelinesHomeTabStorageBloc,
    Key item,
  ) {
    _logger.finest(() => '_onReorderDone $item');
  }
}

class _TimelinesHomeTabStorageListAddTimelineItemWidget
    extends StatelessWidget {
  const _TimelinesHomeTabStorageListAddTimelineItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelinesHomeTabStorageBloc = ITimelinesHomeTabStorageBloc.of(context);

    return StreamBuilder<TimelinesHomeTabStorageUiState>(
      stream: timelinesHomeTabStorageBloc.uiStateStream,
      initialData: timelinesHomeTabStorageBloc.uiState,
      builder: (context, snapshot) {
        var uiState = snapshot.data ?? TimelinesHomeTabStorageUiState.view;

        late Widget child;
        switch (uiState) {
          case TimelinesHomeTabStorageUiState.edit:
            child = const SizedBox.shrink();
            break;
          case TimelinesHomeTabStorageUiState.view:
            child = InkWell(
              onTap: () {
                goToCreateItemTimelinesHomeTabStoragePage(context);
              },
              child: Padding(
                padding: FediPadding.horizontalBigPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      FediIcons.add,
                      // ignore: no-magic-number
                      size: 20.0,
                      color: IFediUiColorTheme.of(context).primary,
                    ),
                    const FediSmallHorizontalSpacer(),
                    Text(
                      S.of(context).app_timeline_storage_action_add,
                      style: IFediUiTextTheme.of(context).bigTallPrimary,
                    ),
                  ],
                ),
              ),
            );
            break;
        }

        return child;
      },
    );
  }
}

class _TimelinesHomeTabStorageListItemWidget extends StatelessWidget {
  const _TimelinesHomeTabStorageListItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelinesHomeTabStorageBloc = ITimelinesHomeTabStorageBloc.of(context);
    var timeline = Provider.of<Timeline>(context);

    return InkWell(
      onTap: () {
        var uiState = timelinesHomeTabStorageBloc.uiState;
        if (uiState == TimelinesHomeTabStorageUiState.view) {
          showEditTimelineSettingsDialog(
            context: context,
            timeline: timeline,
            lockedSource: false,
          );
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timeline = Provider.of<Timeline>(context);

    var label = timeline.calculateLabel(context);

    return InkWell(
      onTap: () {
        showEditTimelineSettingsDialog(
          context: context,
          timeline: timeline,
          lockedSource: false,
        );
      },
      child: Row(
        children: [
          Text(
            label,
            style: IFediUiTextTheme.of(context).mediumShortDarkGrey,
          ),
        ],
      ),
    );
  }
}

class _TimelinesHomeTabStorageListItemEndingWidget extends StatelessWidget {
  const _TimelinesHomeTabStorageListItemEndingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelinesHomeTabStorageBloc = ITimelinesHomeTabStorageBloc.of(context);

    return StreamBuilder<TimelinesHomeTabStorageUiState>(
      stream: timelinesHomeTabStorageBloc.uiStateStream,
      initialData: timelinesHomeTabStorageBloc.uiState,
      builder: (context, snapshot) {
        var uiState = snapshot.data ?? TimelinesHomeTabStorageUiState.view;

        late Widget child;
        switch (uiState) {
          case TimelinesHomeTabStorageUiState.edit:
            child = flutter_reorderable_list.ReorderableListener(
              child: Padding(
                padding: FediPadding.allSmallPadding,
                child: Icon(
                  FediIcons.sort,
                  // ignore: no-magic-number
                  size: 16.0,
                  color: IFediUiColorTheme.of(context).lightGrey,
                ),
              ),
            );
            break;
          case TimelinesHomeTabStorageUiState.view:
            child = FediSelectionItemIconWidget(
              onClick: () {
                showEditTimelineSettingsDialog(
                  context: context,
                  timeline: Provider.of(context, listen: false),
                  lockedSource: false,
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelinesHomeTabStorageBloc = ITimelinesHomeTabStorageBloc.of(context);
    var timeline = Provider.of<Timeline>(context);

    return StreamBuilder<TimelinesHomeTabStorageUiState>(
      stream: timelinesHomeTabStorageBloc.uiStateStream,
      initialData: timelinesHomeTabStorageBloc.uiState,
      builder: (context, snapshot) {
        var uiState = snapshot.data ?? TimelinesHomeTabStorageUiState.view;

        var child;

        switch (uiState) {
          case TimelinesHomeTabStorageUiState.edit:
            child = _TimelinesHomeTabStorageListItemRemoveButtonWidget(
              key: ValueKey('${timeline.id}.remove_body'),
            );
            break;
          case TimelinesHomeTabStorageUiState.view:
            child = SizedBox.shrink(
              key: ValueKey('${timeline.id}.remove_empty'),
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
      },
    );
  }
}

class _TimelinesHomeTabStorageListItemRemoveButtonWidget
    extends StatelessWidget {
  const _TimelinesHomeTabStorageListItemRemoveButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelinesHomeTabStorageBloc = ITimelinesHomeTabStorageBloc.of(context);
    var timeline = Provider.of<Timeline>(context);

    var isPossibleToDelete = timeline.isPossibleToDelete;

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
                  contentText:
                      S.of(context).app_timeline_storage_delete_dialog_content(
                            timeline.calculateLabel(context),
                          ),
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
                  left: FediSizes.smallPadding, right: FediSizes.bigPadding,
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
          const SizedBox(
            // todo: refactor
            // ignore: no-magic-number
            width: 48,
          ),
      ],
    );
  }
}
