import 'package:flutter/material.dart';

class TextCapture extends StatefulWidget {
  final Function popParent;
  final TextEditingController statusController;

  TextCapture(this.popParent, this.statusController);
  @override
  _TextCapture createState() => _TextCapture();
}

class _TextCapture extends State<TextCapture> {
  @override
  void initState() {
    super.initState();
    print("Init state");
  }

  TextField status;

  @override
  Widget build(BuildContext context) {
    status = TextField(
      autofocus: true,
      controller: widget.statusController,
      maxLines: null,
      minLines: null,
      expands: true,
    );
    final Widget body = Column(
      children: <Widget>[
        Expanded(child: status),
      ],
    );

    return Container(
      padding: EdgeInsets.all(10),
      child: body,
      color: Colors.white,
    );
  }
}
