import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountNoteWidget extends StatelessWidget {
  final Color color;


  const AccountNoteWidget({@required this.color});

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: false);
    return StreamBuilder<String>(
        stream: accountBloc.noteStream,
        initialData: accountBloc.note,
        builder: (context, snapshot) {
          var note = snapshot.data;

          if (note?.isNotEmpty == true) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: HtmlTextWidget(
                data: note,
                shrinkWrap: true,
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
                lineHeight: 1.5,
                color: color,
                textAlign: TextAlign.center,
                onLinkTap: (String url) async {
                  await UrlHelper.handleUrlClick(context, url);
                },
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }

}
