import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
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

          if (note?.isNotEmpty == true) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: HtmlTextWidget(
                data: note,
                shrinkWrap: true,
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
                color: FediColors.darkGrey,
                onLinkTap: (String url) async {
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }

  const AccountNoteWidget();
}
