import 'package:flutter/material.dart';
import 'package:fedi/Pleroma/status/pleroma_status_model.dart';

class ProfilePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ProfilePage();
  }
}

class _ProfilePage extends State<ProfilePage> {

  List<IPleromaStatus> statuses = <IPleromaStatus>[];

  @override
  Widget build(BuildContext context) {

    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return Container();
    },itemCount: (statuses.length + 1),);
  }

}
