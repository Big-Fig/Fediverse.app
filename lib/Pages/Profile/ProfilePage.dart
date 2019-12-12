import 'package:flutter/material.dart';
import 'package:fedi/Pleroma/Models/Status.dart';

class ProfilePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ProfilePage();
  }
}

class _ProfilePage extends State<ProfilePage> {

  List<Status> statuses = <Status>[];

  @override
  Widget build(BuildContext context) {

    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return Container();
    },itemCount: (statuses.length + 1),);
  }

}
