import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/home/page/timelines/drawer/timelines_home_page_drawer_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimelinesHomePageDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var drawerBloc = ITimelinesHomePageDrawerBloc.of(context, listen: true);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildHeaderWidget(context),
          buildOptionListTile(
              AppLocalizations.of(context)
                  .tr("home.drawer.settings.media_only"),
              drawerBloc.onlyMediaStream,
              drawerBloc.onlyMedia,
              drawerBloc.changeOnlyMedia),
          buildOptionListTile(
              AppLocalizations.of(context)
                  .tr("home.drawer.settings.hide_replies"),
              drawerBloc.noRepliesStream,
              drawerBloc.noReplies,
              drawerBloc.changeNoReplies),
          buildOptionListTile(
              AppLocalizations.of(context).tr("home.drawer.settings.hide_nsfw"),
              drawerBloc.noNsfwSensitiveStream,
              drawerBloc.noNsfwSensitive,
              drawerBloc.changeNoNsfwSensitive),
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
          AppLocalizations.of(context).tr("home.drawer.settings.header"),
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
    );
  }
}
