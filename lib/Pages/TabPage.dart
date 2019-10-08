
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/webrtc.dart';
import 'package:phaze/Pages/Messages/VideoChat/WebRTCManager.dart';
import 'package:phaze/Pages/Post/CaptureController.dart';
import 'package:phaze/Pages/Push/PushHelper.dart';
import 'package:phaze/Pages/Search/Search.dart';
import 'package:phaze/Pages/Timeline/MyTimelinePage.dart';
import 'package:phaze/Pleroma/Foundation/CurrentInstance.dart';
import 'package:phaze/Transitions/SlideBottomRoute.dart';
import './Placeholder.dart';
import 'Messages/MessageContainer.dart';
// import 'Messages/VideoChatPage.dart';
// import 'Messages/signaling.dart';
import 'Profile/AccountsBottomSheet.dart';
import 'Profile/MyProfilePage.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

class TabPage extends StatefulWidget {



  final Function addNewInstance;
  final Function loadInstance;

  TabPage({this.addNewInstance, this.loadInstance});

  @override
  State<StatefulWidget> createState() {
    return _TabPage();
  }
}

class _TabPage extends State<TabPage> {





    static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
  WebRTCManager manager = WebRTCManager.instance;

  List<String> statuses = [''];
  AccountsBottomSheet bottomSheet;
  int _currentIndex = 0;
  final List<Widget> _children = [
    MyTimelinePage(),
    Search(),
    PlaceholderWidget(Colors.green),
    MessageConatiner(),
    MyProfilePage(),
  ];

  List<AppBar> _appBar;

  @override
  initState() {
    super.initState();
    _firebaseMessaging.requestNotificationPermissions();
    // _connect();
  }

  MediaStream currentStream;

  // void _connect() async {
  //   if (manager.signaling == null) {
  //     manager.signaling = new Signaling(manager.serverIP, manager.displayName)
  //       ..connect();

  //     manager.signaling.onStateChange = (SignalingState state) {
  //       print("State changed $state");
  //       switch (state) {
  //         case SignalingState.CallStateNew:
  //         WebRTCManager.instance.inCalling = true;
  //           Navigator.push(
  //                           context,
  //                           MaterialPageRoute(
  //                             builder: (context) => VideoChatPage(
  //                               signaling: WebRTCManager.instance.signaling,
  //                             ),
  //                             settings: RouteSettings(name: "/VideoChatPage"),
  //                           ));
  //           break;
  //         case SignalingState.CallStateBye:
  //           this.setState(() {
  //             manager.inCalling = false;
  //           });
  //           break;
  //         case SignalingState.CallStateInvite:
  //           showDialog(
  //             context: context,
  //             builder: (BuildContext context) {
  //               // return object of type Dialog
  //               return AlertDialog(
  //                 title: new Text("Incomming Video Call"),
  //                 content: new Text("Do you want to join the call?"),
  //                 actions: <Widget>[
  //                   // usually buttons at the bottom of the dialog
  //                   new FlatButton(
  //                     child: new Text("Join"),
  //                     onPressed: () {
  //                       Navigator.push(
  //                           context,
  //                           MaterialPageRoute(
  //                             builder: (context) => VideoChatPage(
  //                               signaling: WebRTCManager.instance.signaling,
  //                             ),
  //                             settings: RouteSettings(name: "/VideoChatPage"),
  //                           ));
  //                     },
  //                   ),

  //                   new FlatButton(
  //                     child: new Text("Close"),
  //                     onPressed: () {
  //                       Navigator.of(context).pop();
  //                     },
  //                   ),
  //                 ],
  //               );
  //             },
  //           );

  //           this.setState(() {
  //             manager.inCalling = true;
  //           });
  //           break;

  //         case SignalingState.CallStateConnected:
  //         case SignalingState.CallStateRinging:
  //         case SignalingState.ConnectionClosed:
  //         case SignalingState.ConnectionError:
  //         case SignalingState.ConnectionOpen:
  //           break;
  //       }
  //     };

  //     manager.signaling.onPeersUpdate = ((event) {
  //       this.setState(() {
  //         manager.selfId = event['self'];
  //         manager.peers = event['peers'];
  //       });
  //     });

  //     // manager.signaling.onLocalStream = ((stream) {
  //     //   currentStream = stream;
  //     //   // _localRenderer.srcObject = stream;
  //     // });

  //     // manager.signaling.onAddRemoteStream = ((stream) {
  //     //   currentStream = stream;
  //     // });

  //     // manager.signaling.onRemoveRemoteStream = ((stream) {
  //     //   currentStream = null;
  //     // });
  //   }
  // }

  @override
  Widget build(BuildContext context) {


    PushHelper.instance.config(context);
    
    _appBar = [
      AppBar(
        title: Text('Your Timeline'),
      ),
      AppBar(
        title: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white54,
            hintText: 'Search',
            border: InputBorder.none,
            helperStyle: TextStyle(color: Colors.white),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      AppBar(
        title: Text('New Post'),
      ),
      null,
      AppBar(
        centerTitle: true,
        title: FlatButton(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                CurrentInstance.instance.currentAccount.username,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            ],
          ),
          onPressed: () {
            showAccountSheet(context);
          },
        ),
      ),
    ];

    return Scaffold(
      appBar: _appBar[_currentIndex],
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          new BottomNavigationBarItem(
              backgroundColor: Colors.green,
              icon: Icon(Icons.add_box),
              title: Text('Post')),
          new BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.message),
            title: Text('Messages'),
          ),
          new BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      if (index == 2) {
        Navigator.push(
          context,
          SlideBottomRoute(page: CaptureController()),
        );
      } else {
        _currentIndex = index;
      }
    });
  }

  showAccountSheet(BuildContext context) {
    bottomSheet = AccountsBottomSheet(
      addAccount: addAccount,
      swapAccount: swapAccount,
    );
    showModalBottomSheet(
        builder: (BuildContext context) {
          return bottomSheet;
        },
        context: context);
  }

  addAccount() {
    bottomSheet.hide();
    widget.addNewInstance();
  }

  swapAccount() {
    print("SWAP account");
    bottomSheet.hide();
    widget.loadInstance();
  }

}
