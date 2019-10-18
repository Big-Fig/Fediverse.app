import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:phaze/Convert/html.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';

class TextEditor extends StatefulWidget {
  final AssetEntity asset;
  final String imageURL;
  final String videoURL;
  final Function popParent;
  final NotusDocument document;

  TextEditor({this.asset, this.imageURL, this.videoURL, this.popParent, this.document});

  @override
  _TextEditor createState() => _TextEditor();
}

class _TextEditor extends State<TextEditor> {
  /// Allows to control the editor and the document.
  ZefyrController _controller;

  /// Zefyr editor like any other input field requires a focus node.
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = ZefyrController(widget.document);
  }

  @override
  Widget build(BuildContext context) {
    final Widget body = (_controller == null)
        ? Center(child: CircularProgressIndicator())
        : ZefyrScaffold(
            child: ZefyrEditor(
              padding: EdgeInsets.all(16),
              controller: _controller,
              focusNode: _focusNode,
            ),
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
                        final a = NotusHTMLCodec()
                          .encode(_controller.document.toDelta());
                      print(a);

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ComposeStatus(
                      //       imageURL: widget.imageURL,
                      //       asset: widget.asset,
                      //       videoURL: widget.videoURL,
                      //       popParent: widget.popParent,
                      //     ),
                      //   ),
                      // );
                    },
                  ))
        ],
      ),
      body: body,
    );
  }

  /// Loads the document asynchronously from a file if it exists, otherwise
  /// returns default document.
  Future<NotusDocument> _loadDocument() async {
    final file = File(Directory.systemTemp.path + "/quick_start.json");
    if (await file.exists()) {
      final contents = await file
          .readAsString()
          .then((data) => Future.delayed(Duration(seconds: 1), () => data));
      return NotusDocument.fromJson(jsonDecode(contents));
    }
    final Delta delta = Delta()..insert("\n");
    return NotusDocument.fromDelta(delta);
  }

  void _saveDocument(BuildContext context) {
    // Notus documents can be easily serialized to JSON by passing to
    // `jsonEncode` directly:
    final contents = jsonEncode(_controller.document);
    // For this example we save our document to a temporary file.
    final file = File(Directory.systemTemp.path + "/quick_start.json");
    // And show a snack bar on success.
    file.writeAsString(contents).then((_) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Saved.")));
    });
  }
}
