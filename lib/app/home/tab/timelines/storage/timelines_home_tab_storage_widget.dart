import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_page.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("timelines_home_tab_storage_widget.dart");

class TimelinesHomeTabStorageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var timelinesHomeTabStorageBloc = ITimelinesHomeTabStorageBloc.of(context);

    return StreamProvider<List<Timeline>>.value(
      value: timelinesHomeTabStorageBloc.timelinesDistinctStream,
      child: const _TimelinesHomeTabStorageListWidget(),
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

    var items = Provider.of<List<Timeline>>(context);

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

    return ReorderableListView(
      children: items
          .map(
            (item) => Provider<Timeline>.value(
              key: Key(
                item.id,
              ),
              value: item,
              child: const _TimelinesHomeTabStorageListItemWidget(),
            ),
          )
          .toList(),
      onReorder: (oldIndex, newIndex) {
        _logger.finest(() => "onReorder oldIndex $oldIndex newIndex $newIndex");
        _logger.finest(() => "onReorder oldItems $items");
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }

        final oldValue = items.removeAt(oldIndex);
        items.insert(newIndex, oldValue);

        _logger.finest(() => "onReorder afterItems $items");

        timelinesHomeTabStorageBloc.onItemsUpdated(items);
      },
    );
  }
}

class _TimelinesHomeTabStorageListItemWidget extends StatelessWidget {
  const _TimelinesHomeTabStorageListItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timeline = Provider.of<Timeline>(context);

    return ListTile(
      trailing: const _TimelinesHomeTabStorageListItemTrailingWidget(),
      leading: Icon(
        FediIcons.drag,
        color: IFediUiColorTheme.of(context).darkGrey,
      ),
      key: Key(
        timeline.id,
      ),
      title: Text(
        timeline.label,
        style: IFediUiTextTheme.of(context).mediumShortDarkGrey,
      ),
    );
  }
}

class _TimelinesHomeTabStorageListItemTrailingWidget extends StatelessWidget {
  const _TimelinesHomeTabStorageListItemTrailingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timelinesHomeTabStorageBloc =
        ITimelinesHomeTabStorageBloc.of(context);
    var timeline = Provider.of<Timeline>(context);

    var isPossibleToDelete = timeline.isPossibleToDelete == true;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FediIconButton(
          color: IFediUiColorTheme.of(context).darkGrey,
          icon: Icon(FediIcons.settings),
          onPressed: () {
            goToTimelineSettingsPage(
              context,
              timeline: timeline,
            );
          },
        ),
        if (isPossibleToDelete)
          FediIconButton(
            color: IFediUiColorTheme.of(context).darkGrey,
            icon: Icon(FediIcons.delete),
            onPressed: () {
              timelinesHomeTabStorageBloc.remove(timeline);
            },
          ),
        if (!isPossibleToDelete)
          SizedBox(
            width: 48,
          ),
      ],
    );
  }
}
