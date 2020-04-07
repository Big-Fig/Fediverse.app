import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization_delegate.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/details/account_details_page.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusReblogHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);
    return InitialDataStreamBuilder<IAccount>(
        stream: statusBloc.accountStream,
        initialData: statusBloc.account,
        builder: (context, snapshot) {
          var account = snapshot.data;
          return GestureDetector(
            onTap: () {
              goToAccountDetailsPage(context, statusBloc.account);
            },
            behavior: HitTestBehavior.translucent,
            child: Padding(
              padding: EdgeInsets.all(0.0),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: new BorderRadius.circular(12.0),
                    child: CachedNetworkImage(
                      imageUrl: account.avatar,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      height: 24,
                      width: 24,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    account.acct,
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.repeat,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        AppLocalizations.of(context)
                            .tr("app.status.reblog.header"),
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
