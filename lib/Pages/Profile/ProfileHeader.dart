import 'package:flutter/material.dart';
import 'package:phaze/Pleroma/Models/Account.dart';

class ProfileHeader extends StatelessWidget {
  final Account profileAccount;

ProfileHeader({this.profileAccount});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            child: Row(
              children: <Widget>[
                 ClipRRect(
                      borderRadius: new BorderRadius.circular(25.0),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/double_ring_loading_io.gif',
                        image: profileAccount.avatar,
                        height: 50.0,
                        width: 50.0,
                      ),
                    ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
