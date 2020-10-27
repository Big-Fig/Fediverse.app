import 'package:fedi/app/home/tab/timelines/storage/timelines_home_tab_storage_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_page.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:fedi/generated/l10n.dart';

var _logger = Logger("timelines_home_tab_storage_widget.dart");

class TimelinesHomeTabStorageWidget extends StatefulWidget {
  @override
  _TimelinesHomeTabStorageWidgetState createState() =>
      _TimelinesHomeTabStorageWidgetState();
}

class _TimelinesHomeTabStorageWidgetState
    extends State<TimelinesHomeTabStorageWidget> {
  @override
  Widget build(BuildContext context) {
    var timelinesHomeTabStorageBloc =
        ITimelinesHomeTabStorageBloc.of(context, listen: false);

    return StreamBuilder<List<Timeline>>(
        stream: timelinesHomeTabStorageBloc.timelinesStream,
        builder: (context, snapshot) {
          var items = snapshot.data;

          if (items == null) {
            return FediCircularProgressIndicator();
          }

          if (items.isEmpty) {
            return Center(
              child: Text(
                S.of(context).app_timeline_storage_empty,
              ),
            );
          }
          return ReorderableListView(
            children: items.map(
              (item) {
                var isPossibleToDelete = item.isPossibleToDelete == true;
                return ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FediIconButton(
                        color: IFediUiColorTheme.of(context).darkGrey,
                        icon: Icon(FediIcons.settings),
                        onPressed: () {
                          goToTimelineSettingsPage(
                            context,
                            timeline: item,
                          );
                        },
                      ),
                      if (isPossibleToDelete)
                        FediIconButton(
                          color: IFediUiColorTheme.of(context).darkGrey,
                          icon: Icon(FediIcons.remove),
                          onPressed: () {
                            timelinesHomeTabStorageBloc.remove(item);
                          },
                        ),
                      if (!isPossibleToDelete)
                        SizedBox(
                          width: 48,
                        ),
                    ],
                  ),
                  leading: Icon(
                    FediIcons.reorder,
                    color: IFediUiColorTheme.of(context).darkGrey,
                  ),
                  key: Key(
                    item.id,
                  ),
                  title: Text(
                    item.label,
                    style: IFediUiTextTheme.of(context).mediumShortDarkGrey,
                  ),
                );
              },
            ).toList(),
            onReorder: (oldIndex, newIndex) {
              _logger.finest(
                  () => "onReorder oldIndex $oldIndex newIndex $newIndex");
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
        });
  }
}
