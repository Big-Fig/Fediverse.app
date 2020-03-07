
// import 'package:fedi/Pleroma/notifications/websockets/channel/pleroma_notifications_websockets_channel.dart';
// import 'package:fedi/Pleroma/notifications/websockets/pleroma_notifications_websockets_service.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class NotificationsBloc extends IPleromaNotificationsWebSocketsService with ChangeNotifier {
//   String _dataUrl = "https://reqres.in/api/users?per_page=20";
  
//   static NotificationsBloc of(BuildContext context, {listen: true}) =>
//       NotificationsBloc.of(context, listen: listen);
//   int _mentions = 0;
//   int _reposts = 0;
//   int _favorites = 0;
//   int _follows = 0;
//   int _totals = 0;

//   int get getMentions => _mentions;
//   int get getReposts => _mentions;
//   int get getFavorites => _mentions;
//   int get getFollows => _mentions;
//   int get getTotals => _totals;



//   // Future<void> fetchData() async {
//   //   _isFetching = true;
//   //   notifyListeners();

//   //   var response = await http.get(_dataUrl);
//   //   if (response.statusCode == 200) {
//   //     _jsonResonse = response.body;
//   //   }

//   //   _isFetching = false;
//   //   notifyListeners();
//   // }

//   // String get getResponseText => _jsonResonse;

//   // List<dynamic> getResponseJson() {
//   //   if (_jsonResonse.isNotEmpty) {
//   //     Map<String, dynamic> json = jsonDecode(_jsonResonse);
//   //     // print(json['data']['avatar']);
//   //     return json['data'];
//   //   }
//   //   return null;
//   // }

//   @override
//   IPleromaNotificationsWebSocketsChannel getDirectChannel() {
//     // TODO: implement getDirectChannel
//     return null;
//   }

//   @override
//   IPleromaNotificationsWebSocketsChannel getHashtagChannel({String hashtag, bool local}) {
//     // TODO: implement getHashtagChannel
//     return null;
//   }

//   @override
//   IPleromaNotificationsWebSocketsChannel getListChannel({String listId}) {
//     // TODO: implement getListChannel
//     return null;
//   }

//   @override
//   IPleromaNotificationsWebSocketsChannel getPublicChannel({bool local}) {
//     // TODO: implement getPublicChannel
//     return null;
//   }

//   @override
//   IPleromaNotificationsWebSocketsChannel getUserChannel() {
//     // TODO: implement getUserChannel
//     return null;
//   }

//   @override
//   void onClientChanged() {
//     // TODO: implement onClientChanged
//   }
// }