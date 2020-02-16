import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fedi/Pages/Messages/UserCell.dart';
import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Accounts.dart'
    as AccountRequests;
import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
// import 'package:flutter_webrtc/get_user_media.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MentionPage extends StatefulWidget {
  final Function(PleromaAccount account) userSelected;

  MentionPage(this.userSelected);

  @override
  State<StatefulWidget> createState() {
    return _MentionPage();
  }
}

class _MentionPage extends State<MentionPage> {
  String searchText;
  var _controller = TextEditingController();

  List<PleromaAccount> accounts = <PleromaAccount>[];
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

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    if (searchText != null) {
      searchForUser(searchText);
      return;
    }

    print(CurrentInstance.instance.currentAccount.id);
    // if failed,use refreshFailed()
    CurrentInstance.instance.currentClient
        .run(
            path: AccountRequests.Accounts.getFollowing(
                CurrentInstance.instance.currentAccount.id),
            method: HTTPMethod.GET)
        .then((response) {
      List<PleromaAccount> followingAccoutns = PleromaAccount.listFromJsonString(response.body);
      accounts.clear();
      accounts.addAll(followingAccoutns);
      if (mounted) setState(() {});
      _refreshController.refreshCompleted();
    }).catchError((error) {
      print(error.toString());
      if (mounted) setState(() {});
      _refreshController.refreshFailed();
    });
  }

  searchForUser(String q) {
    CurrentInstance.instance.currentClient
        .run(path: AccountRequests.Accounts.search(q), method: HTTPMethod.GET)
        .then((response) {
      List<PleromaAccount> followingAccoutns = PleromaAccount.listFromJsonString(response.body);
      accounts.clear();
      accounts.addAll(followingAccoutns);
      if (mounted) setState(() {});
      _refreshController.refreshCompleted();
    }).catchError((error) {
      print(error.toString());
      if (mounted) setState(() {});
      _refreshController.refreshFailed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).tr("mention.title")),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            child: TextField(
              autocorrect: false,
              controller: _controller,
              onChanged: (text) {
                searchText = text == "" ? null : text;
                _refreshController.requestRefresh();
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue.withAlpha(150),
                hintText: 'Search',
                border: InputBorder.none,
                helperStyle: TextStyle(color: Colors.white),
                suffixIcon: IconButton(
                  onPressed: () {
                    searchText = null;
                    _controller.clear();
                    _refreshController.requestRefresh();
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
          ),
          Expanded(
            child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: false,
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
                          .tr("mention.update.up_to_date"),
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
                          .tr("mention.update.unable_to_fetch"),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              footer: CustomFooter(
                builder: (BuildContext context, LoadStatus mode) {
                  Widget body;
                  if (mode == LoadStatus.idle) {
                    body = Text(AppLocalizations.of(context)
                        .tr("mention.update.no_more_messages"));
                  } else if (mode == LoadStatus.loading) {
                    body = CircularProgressIndicator();
                  } else if (mode == LoadStatus.failed) {
                    body = Text(AppLocalizations.of(context)
                        .tr("mention.update.failed"));
                  } else {
                    body = Text(AppLocalizations.of(context)
                        .tr("mention.update.no_more_data"));
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
                  var acct = accounts[i];
                  return UserCell(
                    account: acct,
                    cellTapped:(PleromaAccount acct){
                      print("another layer deep");
                      widget.userSelected(acct);
                      Navigator.of(c).pop();
                    },
                  );
                },
                itemCount: accounts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
