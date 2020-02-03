import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pages/Profile/OtherAccount.dart';
import 'package:fedi/Pages/Timeline/AccountCell.dart';
import 'package:fedi/Pages/Timeline/StatusDetail.dart';
import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Status.dart' as StatusRequests;
import 'package:fedi/Pleroma/Models/Account.dart';
import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StatusFavoritePage extends StatefulWidget {
  final Status status;

  StatusFavoritePage(this.status);

  @override
  State<StatefulWidget> createState() {
    return _StatusFavoritePage();
  }
}

class _StatusFavoritePage extends State<StatusFavoritePage> {
  List<Account> accounts = [];

  void initState() {
    super.initState();
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => fetchStatuses(context));
    }
  }

  void fetchStatuses(BuildContext context) {
    if (accounts.length == 0) {
      _refreshController.requestRefresh();
    }
  }

  viewAccount(Account account) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OtherAccount(account)),
    );
  }

  viewStatusDetail(Status status) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StatusDetail(
          status: status,
        ),
      ),
    );
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // if failed,use refreshFailed()
    CurrentInstance.instance.currentClient
        .run(
            path: StatusRequests.Status.favouritedBy(widget.status.id),
            method: HTTPMethod.GET)
        .then((response) {
      accounts = accountsFromJson(response.body);

      if (mounted) setState(() {});
      _refreshController.refreshCompleted();
    }).catchError((error) {
      print(error.toString());
      if (mounted) setState(() {});
      _refreshController.refreshFailed();
    });
  }

  viewStatus(Status status) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context)
        .tr("timeline.status.favorite.favorited_by")
        ),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        header: WaterDropHeader(
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
                AppLocalizations.of(context)
                    .tr("timeline.status.favorite.update.up_to_date"),
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
                    .tr("timeline.status.favorite.update.unable_to_fetch"),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text(AppLocalizations.of(context).tr(
                  "timeline.status.favorite.update.no_more_accounts"));
            } else if (mode == LoadStatus.loading) {
              body = CircularProgressIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text(AppLocalizations.of(context).tr(
                  "timeline.status.favorite.update.failed"));
            } else {
              body = Text(AppLocalizations.of(context).tr(
                  "timeline.status.favorite.update.no_more_data"));
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 10.0),
          itemBuilder: (c, i) {
            Account account = accounts[i];
            return AccountCell(viewAccount, account);
          },
          itemCount: accounts.length,
        ),
      ),
    );
  }
}
