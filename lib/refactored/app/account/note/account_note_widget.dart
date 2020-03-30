import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/html/html_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountNoteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: false);
    return StreamBuilder<String>(
        stream: accountBloc.noteStream,
        initialData: accountBloc.note,
        builder: (context, snapshot) {
          var note = snapshot.data;
          return Container(
            color: Colors.blue[100],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: HtmlTextWidget(
                data: note,
                onLinkTap: (String url) async {
                  if (await canLaunch(url)) {
                    launch(url);
                  }
                },
              ),
            ),
          );
        });
  }
}
