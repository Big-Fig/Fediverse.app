import 'package:flutter/material.dart';
import 'package:phaze/Pages/Post/ComposeStatus.dart';
import 'package:photo_manager/photo_manager.dart';

class TextEditor extends StatefulWidget {
  final AssetEntity asset;
  final String imageURL;
  final String videoURL;
  final Function popParent;

  TextEditor({this.asset, this.imageURL, this.videoURL, this.popParent});

  @override
  _TextEditor createState() => _TextEditor();
}

class _TextEditor extends State<TextEditor> {
  TextEditingController statusController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Widget body = Column(
      children: <Widget>[
        Expanded(
            child: TextField(
          autofocus: true,
          controller: statusController,
          maxLines: null,
          minLines: null,
          expands: true,
        ))
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Compose status"),
        actions: <Widget>[
          Builder(
              builder: (context) => FlatButton(
                    child: Text("Next"),
                    textColor: Colors.white,
                    color: Colors.transparent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ComposeStatus(
                            imageURL: widget.imageURL,
                            asset: widget.asset,
                            videoURL: widget.videoURL,
                            popParent: widget.popParent,
                            htmlPost: statusController.text,
                          ),
                        ),
                      );
                    },
                  ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: body,
      ),
    );
  }
}
