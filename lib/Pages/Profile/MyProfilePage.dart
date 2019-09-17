import 'package:flutter/material.dart';
import 'package:phaze/Pages/Profile/ProfileHeader.dart';
import 'package:phaze/Pleroma/Foundation/CurrentInstance.dart';
import 'package:phaze/Pleroma/Models/Account.dart';
import 'package:phaze/Pleroma/Models/Status.dart';

class MyProfilePage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _MyProfilePage();
  }
}

class _MyProfilePage extends State<MyProfilePage> {
   
  Account myAccount;
  List<Status> statuses = <Status>[];

  @override
  void initState() {
    super.initState();

  }


  getMyStatuses(){

  }

  @override
  Widget build(BuildContext context) {



    SmartRefresher(
      key: PageStorageKey<String>("MAINTAB"),
      enablePullDown: true,
      enablePullUp: true,
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
              Text("Unable to fetch data", style: TextStyle(color: Colors.grey))
            ],
          )),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("pull up load");
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("Load Failed!Click retry!");
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
      onLoading: _onLoading,
      child: ListView.builder(itemBuilder: (BuildContext context, int index) {

      if (index == 0) {

        return ProfileHeader(profileAccount:CurrentInstance.instance.currentAccount,);

      } else {

        return Container();


      }


    },itemCount: (statuses.length + 1),),
    );

    return 

  
}
