import 'package:fedi/Pleroma/Models/Account.dart';
import 'package:fedi/Views/MentionPage.dart';
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

  accountMentioned(Account acct) {
    print("$acct");
    String lastChar =
        widget.statusController.text.substring(widget.statusController.text.length - 1);
    if (lastChar == "@") {
      widget.statusController.text =
          widget.statusController.text.substring(0, widget.statusController.text.length - 1);
    }
    widget.statusController.text =
        "${widget.statusController.text} @${acct.acct}";

        Navigator.pop(context);
  }

  TextField status;

  @override
  Widget build(BuildContext context) {
    status = TextField(
      onChanged: (value) {
        String lastChar = value.substring(value.length - 1);
        if (lastChar == "@") {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MentionPage(accountMentioned)));
        }
      },
      autofocus: true,
      controller: widget.statusController,
      maxLines: null,
      minLines: null,
      expands: true,
    );
    final Widget body = Column(
      children: <Widget>[
        Expanded(child: status),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Text(
                "@",
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MentionPage(accountMentioned)));
              },
            ),
          ],
        ),
      ],
    );

    return Container(
      padding: EdgeInsets.all(10),
      child: body,
      color: Colors.white,
    );
  }
}
