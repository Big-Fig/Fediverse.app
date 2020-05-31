import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/home/tab/notifications/drawer/notifications_home_tab_page_drawer_bloc.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsHomeTabPageDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var drawerBloc =
        INotificationsHomeTabPageDrawerBloc.of(context, listen: true);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildHeaderWidget(context),
          buildOptionListTile(
              tr("app.notification.push.settings.field.favourites.label"),
              drawerBloc.favouriteStream,
              drawerBloc.favourite,
              drawerBloc.changeFavourite),
          buildOptionListTile(
              tr("app.notification.push.settings.field.follows.label"),
              drawerBloc.followStream,
              drawerBloc.follow,
              drawerBloc.changeFollow),
          buildOptionListTile(
              tr("app.notification.push.settings.field.mentions.label"),
              drawerBloc.mentionStream,
              drawerBloc.mention,
              drawerBloc.changeMention),
          buildOptionListTile(
              tr("app.notification.push.settings.field.reblogs.label"),
              drawerBloc.reblogStream,
              drawerBloc.reblog,
              drawerBloc.changeReblog),
          buildOptionListTile(
              tr("app.notification.push.settings.field.polls.label"),
              drawerBloc.pollStream,
              drawerBloc.poll,
              drawerBloc.changePoll),
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
      child: DrawerHeader(
        child: Text(
          tr("app.notification.push.settings.title"),
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
          color: FediColors.primaryColor,
        ),
      ),
    );
  }

  const NotificationsHomeTabPageDrawerWidget();
}
