import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/home/tab/timelines/drawer/timelines_home_tab_page_drawer_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimelinesHomeTabPageDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var drawerBloc = ITimelinesHomeTabPageDrawerBloc.of(context, listen: true);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildHeaderWidget(context),
          buildOptionListTile(
              AppLocalizations.of(context)
                  .tr("app.timeline.display.settings.field.only_with_media"
                      ".label"),
              drawerBloc.onlyWithMediaStream,
              drawerBloc.onlyWithMedia,
              drawerBloc.changeOnlyWithMedia),
          buildOptionListTile(
              AppLocalizations.of(context)
                  .tr("app.timeline.display.settings.field.hide_replies.label"),
              drawerBloc.onlyNoRepliesStream,
              drawerBloc.onlyNoReplies,
              drawerBloc.changeOnlyNoReplies),
          buildOptionListTile(
              AppLocalizations.of(context)
                  .tr("app.timeline.display.settings.field.hide_nsfw.label"),
              drawerBloc.onlyNoNsfwSensitiveStream,
              drawerBloc.onlyNoNsfwSensitive,
              drawerBloc.changeOnlyNoNsfwSensitive),
        ],
      ),
    );
  }

  ListTile buildOptionListTile(String optionLabel, Stream<bool> optionStream,
      bool optionValue, onOptionChanged(bool value)) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Text(
            optionLabel,
          ),
          Spacer(),
          StreamBuilder<bool>(
              stream: optionStream.distinct(),
              initialData: optionValue,
              builder: (context, snapshot) {
                var value = snapshot.data ?? false;
                return Switch(
                  value: value,
                  onChanged: onOptionChanged,
                  activeTrackColor: Colors.lightBlueAccent,
                  activeColor: Colors.blue,
                );
              }),
        ],
      ),
      onTap: () {
        // Update the state of the app.
        // ...
      },
    );
  }

  Container buildHeaderWidget(BuildContext context) {
    return Container(
      height: 110,
      width: 50,
      child: DrawerHeader(
        child: Text(
          AppLocalizations.of(context).tr("app.timeline.display.settings"
              ".title"),
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
    );
  }
}
