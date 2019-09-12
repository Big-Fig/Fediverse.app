import 'package:flutter/material.dart';
import 'package:phaze/Pleroma/Models/Account.dart';

class ProfileHeader extends StatelessWidget {
  final Account profileAccount;

  ProfileHeader({this.profileAccount});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 80,
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: new BorderRadius.circular(8.0),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/double_ring_loading_io.gif',
                    image: profileAccount.avatar,
                    height: 80.0,
                    width: 80.0,
                  ),
                ),
                Text("Statuses\n${profileAccount.statusesCount}"),
                Text("Following\n${profileAccount.followingCount}"),
                Text("Followers\n${profileAccount.followersCount}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
