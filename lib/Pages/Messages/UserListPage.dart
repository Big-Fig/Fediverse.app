import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:phaze/Pages/Messages/UserCell.dart';
import 'package:phaze/Pleroma/Foundation/Client.dart';
import 'package:phaze/Pleroma/Foundation/CurrentInstance.dart';
import 'package:phaze/Pleroma/Foundation/Requests/Accounts.dart' as AccountRequests;
import 'package:phaze/Pleroma/Models/Account.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserListPage extends StatefulWidget {
  @override



  State<StatefulWidget> createState() {
    return _UserListPage();
  }


}

class _UserListPage extends State<UserListPage>{
  List<Account> accounts = <Account>[];
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
    print("ONREFRESH");
    // if failed,use refreshFailed()
    CurrentInstance.instance.currentClient
        .run(
            path: AccountRequests.Accounts.getFollowers(CurrentInstance.instance.currentAccount.id),
            method: HTTPMethod.GET)
        .then((response) {
          List<Account> followingAccoutns = accountsFromJson(response.body);
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


  searchForUser(String q){
    CurrentInstance.instance.currentClient
        .run(
            path: AccountRequests.Accounts.search(q),
            method: HTTPMethod.GET)
        .then((response) {
          List<Account> followingAccoutns = accountsFromJson(response.body);
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


  cellTapped(Account account) {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => ChatPage(
    //         conversation: conversation,
    //       ),
    //     ));
  }


 @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      key: PageStorageKey<String>("userList"),
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
              "Everything up to date",
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
              "Unable to fetch data",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("No more Messages");
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("Load Failed! Click retry!");
          } else {
            body = Text("No more Data");
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
        itemBuilder: (c, i) => UserCell(
          account: accounts[i],
          cellTapped: cellTapped,
        ),
        itemCount: accounts.length,
      ),
    );
  }
  
}