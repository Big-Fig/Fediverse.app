import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/status/scheduled/list/scheduled_status_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScheduledStatusListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).tr("app.status.scheduled"
            ".title")),
      ),
      body: SafeArea(child: ScheduledStatusListWidget(),),
    );
  }
}


void goToScheduledStatusListPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => ScheduledStatusListPage()),
  );
}
