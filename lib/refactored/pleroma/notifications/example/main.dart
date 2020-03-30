import 'dart:async';

import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Models/Notification.dart' as NotificationModel;
import 'package:fedi/refactored/pleroma/conversation/pleroma_conversation_model.dart';
import 'package:fedi/refactored/pleroma/notifications/websockets/channel/pleroma_notifications_websockets_channel.dart';
import 'package:fedi/refactored/pleroma/notifications/websockets/pleroma_notifications_websockets_model.dart';
import 'package:fedi/refactored/pleroma/notifications/websockets/pleroma_notifications_websockets_service.dart';
import 'package:fedi/refactored/pleroma/notifications/websockets/pleroma_notifications_websockets_service_impl.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:provider/provider.dart';

void main() async {
  CurrentInstance.instance.currentClient = Client(baseURL: "pleroma.com");

  CurrentInstance.instance.currentClient.accessToken =
      "nJgnXV_7gwjq2tFWpFHI2UG80KRCUqfs1sHTwzEcABs";

  initLog();
  runApp(MaterialApp(
      home: SafeArea(
          child: Provider<IPleromaNotificationsWebSocketsService>(
              create: (context) => PleromaNotificationsWebSocketsService(),
              child: NotificationsWebSocketsExampleWidget()))));
}

typedef IPleromaNotificationsWebSocketsChannel BodyBuilder(
    IPleromaNotificationsWebSocketsService service);

class TabInfo {
  final String title;
  final BodyBuilder builder;

  TabInfo(this.title, this.builder);
}

class NotificationsWebSocketsExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var notificationsWebSocketsService =
        IPleromaNotificationsWebSocketsService.of(context, listen: true);

    var tabs = [
      TabInfo("User", (service) => service.getUserChannel()),
      TabInfo("Public", (service) => service.getPublicChannel(local: false)),
      TabInfo(
          "Public(local)", (service) => service.getPublicChannel(local: true)),
      TabInfo(
          "HashTag #cats",
          (service) =>
              service.getHashtagChannel(hashtag: "cats", local: false)),
      TabInfo("HashTag #cats (local)",
          (service) => service.getHashtagChannel(hashtag: "cats", local: true)),
      TabInfo("List", (service) => service.getListChannel(listId: "1")),
      TabInfo("Direct", (service) => service.getDirectChannel())
    ];

    return Scaffold(
      body: DefaultTabController(
        length: tabs.length,
        child: Column(
          children: <Widget>[
            TabBar(
              indicatorSize: TabBarIndicatorSize.label, //makes it better
              isScrollable: true, //up to your taste
              indicator: MD2Indicator(
                  //it begins here
                  indicatorHeight: 3,
                  indicatorColor: Color(0xff1a73e8),
                  indicatorSize: MD2IndicatorSize
                      .normal //3 different modes tiny-normal-full
                  ),
              tabs: tabs
                  .map((tab) => Tab(
                        child: Text(
                          tab.title,
                          style: TextStyle(color: Colors.blue),
                        ),
                      ))
                  .toList(),
            ),
            Expanded(
              child: TabBarView(
                children: tabs.map((tab) {
                  // provide notification channel to child
                  return Provider<IPleromaNotificationsWebSocketsChannel>(
                    // provide channel stream controller to child
                    child: buildSocketsChannelWidget(),
                    // create notifications channel
                    create: (context) =>
                        tab.builder(notificationsWebSocketsService),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Provider<StreamController<PleromaNotificationsWebSocketsEvent>>
      buildSocketsChannelWidget() {
    return Provider<StreamController<PleromaNotificationsWebSocketsEvent>>(
      child: NotificationsWebSocketsChannelExampleWidget(),
      create: (BuildContext context) {
        var channel = Provider.of<IPleromaNotificationsWebSocketsChannel>(
            context,
            listen: false);

        return channel.createEventsStreamController();
      },
      // dispose stream controller
      dispose: (context, streamController) {
        streamController.close();
      },
    );
  }
}

class NotificationsWebSocketsChannelExampleWidget extends StatefulWidget {
  @override
  _NotificationsWebSocketsChannelExampleWidgetState createState() =>
      _NotificationsWebSocketsChannelExampleWidgetState();
}

class _NotificationsWebSocketsChannelExampleWidgetState
    extends State<NotificationsWebSocketsChannelExampleWidget> {
  final List<PleromaNotificationsWebSocketsEvent> allEvents = [];

  Disposable disposable;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    disposable = Provider.of<IPleromaNotificationsWebSocketsChannel>(context,
            listen: false)
        .listenEvents((event) {
      setState(() {
        allEvents.add(event);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    disposable.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get current stream controller from widget tree
    // ignore: close_sinks
    var streamController =
        Provider.of<StreamController<PleromaNotificationsWebSocketsEvent>>(
            context,
            listen: true);
    return Column(
      children: <Widget>[
        Text("Latest event:"),
        buildLatestEventStringBuilderExample(streamController),
        Text("All events:"),
        Expanded(child: buildAllEventsExample())
      ],
    );
    ;
  }

  ListView buildAllEventsExample() {
    return ListView.builder(
        itemCount: allEvents.length,
        itemBuilder: (context, index) {
          return mapEventToTextWidget(allEvents[index]);
        });
  }

  StreamBuilder<PleromaNotificationsWebSocketsEvent>
      buildLatestEventStringBuilderExample(
          StreamController<PleromaNotificationsWebSocketsEvent>
              streamController) {
    return StreamBuilder<PleromaNotificationsWebSocketsEvent>(
        stream: streamController.stream,
        builder: (context, snapshot) {
          var latestEvent = snapshot.data;
          if (latestEvent == null) {
            return Text("No latest event yet");
          } else {
            return mapEventToTextWidget(latestEvent);
          }
        });
  }

  Text mapEventToTextWidget(PleromaNotificationsWebSocketsEvent latestEvent) {
    switch (latestEvent.eventType) {
      case PleromaNotificationsWebSocketsEventType.update:
        return Text(
            "Latest(Status): ${PleromaStatus.fromJsonString(latestEvent.payload)
            }");
        break;
      case PleromaNotificationsWebSocketsEventType.notification:
        return Text("Latest(Notification): "
            "${NotificationModel.Notification.fromJsonString(latestEvent.payload)}");
        break;
      case PleromaNotificationsWebSocketsEventType.delete:
        return Text("Latest(delete): ${latestEvent.payload}");
        break;
      case PleromaNotificationsWebSocketsEventType.filtersChanged:
        return Text("Latest(filtersChanged)");
        break;
      case PleromaNotificationsWebSocketsEventType.conversation:
        return Text(
            "Latest(conversation): ${PleromaConversation.fromJsonString
              (latestEvent
                .payload)}");
        break;
    }
    throw "Invalid type ${latestEvent.eventType}";
  }
}

initLog() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}
