import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/details/account_details_page.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusReplyHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: true);
    return InitialDataStreamBuilder<IAccount>(
        stream: statusBloc.watchInReplyToAccount(),
        initialData: null,
        builder: (context, snapshot) {
          var account = snapshot.data;

          // todo: show progress
          if (account == null) {
            return SizedBox.shrink();
          }

          return GestureDetector(
            onTap: () {
              goToAccountDetailsPage(context, account);
            },
            behavior: HitTestBehavior.translucent,
            child: Padding(
              padding: EdgeInsets.all(0.0),
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
//                      Image(
//                        height: 15,
//                        width: 15,
//                        color: Colors.grey,
//                        image: AssetImage("assets/images/comment.png"),
//                      ),
                      Icon(
                        Icons.reply,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        AppLocalizations.of(context)
                            .tr("timeline.status.cell.reply_to"),
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    account.acct,
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
