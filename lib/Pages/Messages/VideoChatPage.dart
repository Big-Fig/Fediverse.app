import 'package:flutter/material.dart';
import 'dart:core';
import 'VideoChat/WebRTCManager.dart';
import 'signaling.dart';
import 'package:flutter_webrtc/webrtc.dart';

class VideoChatPage extends StatefulWidget {
  final Signaling signaling;

  VideoChatPage({Key key, @required this.signaling}) : super(key: key);

  @override
  _VideoChatPage createState() => new _VideoChatPage();
}

class _VideoChatPage extends State<VideoChatPage> {
  RTCVideoRenderer _localRenderer = new RTCVideoRenderer();
  RTCVideoRenderer _remoteRenderer = new RTCVideoRenderer();

  @override
  initState() {
    super.initState();
    initRenderers();
    _connect();
  }

  initRenderers() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();
  }

  @override
  deactivate() {
    super.deactivate();
    if (widget.signaling != null) widget.signaling.close();
    _localRenderer.dispose();
    _remoteRenderer.dispose();
  }

  void _connect() async {
    widget.signaling.onLocalStream = ((stream) {
      print("STREAMING");
      setState(() {
      _localRenderer.srcObject = stream;
      });
    });

    widget.signaling.onAddRemoteStream = ((stream) {
      print("STREAMING");
      setState(() {
        _remoteRenderer.srcObject = stream;
      });
      
    });

    widget.signaling.onRemoveRemoteStream = ((stream) {
      print("STREAMING");
      setState(() {
      _remoteRenderer.srcObject = null;
      });
    });
  }

  _invitePeer(context, peerId, useScreen) async {
    if (widget.signaling != null && peerId != WebRTCManager.instance.selfId) {
      widget.signaling.invite(peerId, 'video', useScreen);
    }
  }

  _hangUp() {
    if (widget.signaling != null) {
      widget.signaling.bye();
    }
  }

  _switchCamera() {
    widget.signaling.switchCamera();
  }

  _muteMic() {}

  _buildRow(context, peer) {
    var self = (peer['id'] == WebRTCManager.instance.selfId);
    return ListBody(children: <Widget>[
      ListTile(
        title: Text(self
            ? peer['name'] + '[Your self]'
            : peer['name'] + '[' + peer['user_agent'] + ']'),
        onTap: null,
        trailing: new SizedBox(
            width: 100.0,
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.videocam),
                    onPressed: () => _invitePeer(context, peer['id'], false),
                    tooltip: 'Video calling',
                  ),
                  IconButton(
                    icon: const Icon(Icons.screen_share),
                    onPressed: () => _invitePeer(context, peer['id'], true),
                    tooltip: 'Screen sharing',
                  )
                ])),
        subtitle: Text('id: ' + peer['id']),
      ),
      Divider()
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('P2P Call Sample'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: null,
            tooltip: 'setup',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: WebRTCManager.instance.inCalling
          ? new SizedBox(
              width: 200.0,
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FloatingActionButton(
                      heroTag: "Tag",
                      child: const Icon(Icons.switch_camera),
                      onPressed: _switchCamera,
                    ),
                    FloatingActionButton(
                       heroTag: "Tag1",
                      onPressed: _hangUp,
                      tooltip: 'Hangup',
                      child: new Icon(Icons.call_end),
                      backgroundColor: Colors.pink,
                    ),
                    FloatingActionButton(
                       heroTag: "Tag2",
                      child: const Icon(Icons.mic_off),
                      onPressed: _muteMic,
                    )
                  ]))
          : null,
      body: WebRTCManager.instance.inCalling
          ? OrientationBuilder(builder: (context, orientation) {
              return new Container(
                child: new Stack(children: <Widget>[
                  new Positioned(
                      left: 0.0,
                      right: 0.0,
                      top: 0.0,
                      bottom: 0.0,
                      child: new Container(
                        margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: new RTCVideoView(_remoteRenderer),
                        decoration: new BoxDecoration(color: Colors.black54),
                      )),
                  new Positioned(
                    left: 20.0,
                    top: 20.0,
                    child: new Container(
                      width: orientation == Orientation.portrait ? 90.0 : 120.0,
                      height:
                          orientation == Orientation.portrait ? 120.0 : 90.0,
                      child: new RTCVideoView(_localRenderer),
                      decoration: new BoxDecoration(color: Colors.black54),
                    ),
                  ),
                ]),
              );
            })
          : new ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(0.0),
              itemCount: (WebRTCManager.instance.peers != null
                  ? WebRTCManager.instance.peers.length
                  : 0),
              itemBuilder: (context, i) {
                return _buildRow(context, WebRTCManager.instance.peers[i]);
              }),
    );
  }
}
