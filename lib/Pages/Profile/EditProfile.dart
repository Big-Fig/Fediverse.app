import 'package:flutter/material.dart';
import 'package:phaze/Pleroma/Foundation/CurrentInstance.dart';
import 'package:phaze/Pleroma/Models/Account.dart';

class EditProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EditProfile();
  }
}

class _EditProfile extends State<EditProfile> {
  Account myAccount = CurrentInstance.instance.currentAccount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Account"),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          // header
          Container(
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: 200,
                  child: FittedBox(
                    alignment: Alignment.center,
                    fit: BoxFit.none,
                    child: FadeInImage.assetNetwork(
                      image: myAccount.header,
                      placeholder: "assets/images/double_ring_loading_io.gif",
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    print("edit image");
                  },
                  child: Container(
                    width: 125,
                    height: 125,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: new BorderRadius.circular(8.0),
                          child: FadeInImage.assetNetwork(
                            placeholder:
                                'assets/images/double_ring_loading_io.gif',
                            image: myAccount.avatar,
                            height: 125.0,
                            width: 125.0,
                          ),
                        ),
                        Container(
                          color: Colors.black38,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 2),
                                ),
                                Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: (){

                      print("edit header");
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      color: Colors.black38,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "Header",
                              style: TextStyle(color: Colors.white),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                            ),
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
          
          // Form
          
        ],
      ),
    );
  }
}
