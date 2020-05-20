import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListRefreshHeaderWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) => WaterDropHeader(
        complete: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.done,
              color: Colors.grey,
            ),
            Container(
              width: 15.0,
            ),
            Text(
              AppLocalizations.of(context).tr("app.list.refresh.up_to_date"),
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
        failed: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.close,
              color: Colors.grey,
            ),
            Container(
              width: 15.0,
            ),
            Text(
                AppLocalizations.of(context)
                    .tr("app.list.refresh.unable_to_fetch"),
                style: TextStyle(color: Colors.grey))
          ],
        ));

  const ListRefreshHeaderWidget();
}
