import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:phaze/Pleroma/Models/Account.dart';

class ProfileHeader extends StatelessWidget {
  final Account profileAccount;

  final Function(String) accountAction;
  final Function editAccount;

  ProfileHeader({this.profileAccount, this.editAccount, this.accountAction});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 130,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                FittedBox(
                  child: FadeInImage.assetNetwork(
                    image: profileAccount.header,
                    placeholder: "assets/images/double_ring_loading_io.gif",
                  ),
                  fit: BoxFit.none,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: new BorderRadius.circular(8.0),
                            child: FadeInImage.assetNetwork(
                              placeholder:
                                  'assets/images/double_ring_loading_io.gif',
                              image: profileAccount.avatar,
                              height: 80.0,
                              width: 80.0,
                            ),
                          ),
                          Text(
                            "Statuses\n${profileAccount.statusesCount}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              shadows: [
                                Shadow(
                                    // bottomLeft
                                    offset: Offset(-0.25, -0.25),
                                    color: Colors.white),
                                Shadow(
                                    // bottomRight
                                    offset: Offset(0.25, -0.25),
                                    color: Colors.white),
                                Shadow(
                                    // topRight
                                    offset: Offset(0.25, 0.25),
                                    color: Colors.white),
                                Shadow(
                                    // topLeft
                                    offset: Offset(-0.25, 0.25),
                                    color: Colors.white),
                              ],
                            ),
                          ),
                          Text(
                            "Following\n${profileAccount.followingCount}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              shadows: [
                                Shadow(
                                    // bottomLeft
                                    offset: Offset(-0.25, -0.25),
                                    color: Colors.white),
                                Shadow(
                                    // bottomRight
                                    offset: Offset(0.25, -0.25),
                                    color: Colors.white),
                                Shadow(
                                    // topRight
                                    offset: Offset(0.25, 0.25),
                                    color: Colors.white),
                                Shadow(
                                    // topLeft
                                    offset: Offset(-0.25, 0.25),
                                    color: Colors.white),
                              ],
                            ),
                          ),
                          Text(
                            "Followers\n${profileAccount.followersCount}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              shadows: [
                                Shadow(
                                    // bottomLeft
                                    offset: Offset(-0.25, -0.25),
                                    color: Colors.white),
                                Shadow(
                                    // bottomRight
                                    offset: Offset(0.25, -0.25),
                                    color: Colors.white),
                                Shadow(
                                    // topRight
                                    offset: Offset(0.25, 0.25),
                                    color: Colors.white),
                                Shadow(
                                    // topLeft
                                    offset: Offset(-0.25, 0.25),
                                    color: Colors.white),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Html(
                data: profileAccount.note,
              )
            ],
          ),
          getButtons(),
        ],
      ),
    );
  }


  Widget getButtons(){
    if (editAccount == null) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          OutlineButton(child: Row(children: <Widget>[Text("Follow"),],),onPressed: (){
            
          },),
          OutlineButton(child: Row(children: <Widget>[Text("Message")],),onPressed: (){
            
          },),
           OutlineButton(child: Row(children: <Widget>[Text("More"), Icon(Icons.keyboard_arrow_down, color: Colors.grey,)],),onPressed: (){
            
          },),
        ],

      );
    } else {
      return  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          OutlineButton(child: Row(children: <Widget>[Text("Edit Profile"), Icon(Icons.edit),],),onPressed: (){

          },)
        ],

      );
    }

  }
}


