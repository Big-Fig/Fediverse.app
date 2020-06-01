// import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
// import 'dart:core';
// import '../signaling.dart';

// class WebRTCManager {
//   WebRTCManager._privateConstructor();

//   static final WebRTCManager _instance = WebRTCManager._privateConstructor();
//   static WebRTCManager get instance {
//     return _instance;
//   }

//   Signaling signaling;

//   static String currentURL = "${CurrentInstance.instance.currentClient.baseURL}"
//       .replaceAll("https://", "@");
//   static String client = "${CurrentInstance.instance.currentAccount.acct}$currentURL";
//   String displayName = client;
//   List<dynamic> peers;
//   var selfId;
//   bool inCalling = false;
//   final String serverIP = "167.71.90.67";

//   void connect() async {
//     if (signaling == null) {
//       signaling = new Signaling(serverIP, displayName)..connect();

//       signaling.onStateChange = (SignalingState state) {
//         print("State changed $state");
//         switch (state) {
//           case SignalingState.CallStateNew:
//             inCalling = true;
//             break;
//           case SignalingState.CallStateBye:
//             inCalling = false;
//             break;
//           case SignalingState.CallStateInvite:
//           case SignalingState.CallStateConnected:
//           case SignalingState.CallStateRinging:
//           case SignalingState.ConnectionClosed:
//           case SignalingState.ConnectionError:
//           case SignalingState.ConnectionOpen:
//             break;
//         }
//       };

//       signaling.onPeersUpdate = ((event) {
//         selfId = event['self'];
//         peers = event['peers'];
//       });

//       signaling.onLocalStream = ((stream) {
//         // _localRenderer.srcObject = stream;
//       });

//       signaling.onAddRemoteStream = ((stream) {
//         //_remoteRenderer.srcObject = stream;
//       });

//       signaling.onRemoveRemoteStream = ((stream) {
//         // _remoteRenderer.srcObject = null;
//       });
//     }
//   }

//   invitePeer(context, peerId, useScreen) async {
//     if (signaling != null && peerId != selfId) {
//       signaling.invite(peerId, 'video', useScreen);
//     }
//   }

//   hangUp() {
//     if (signaling != null) {
//       signaling.bye();
//     }
//   }
// }
