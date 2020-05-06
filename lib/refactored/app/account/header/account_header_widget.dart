import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);

    return StreamBuilder<String>(
        stream: accountBloc.headerStream,
        initialData: accountBloc.header,
        builder: (context, snapshot) {
          var header = snapshot.data;
          return CachedNetworkImage(
            imageUrl: header,
            placeholder: (context, url) => Center(
              child: Container(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          );
        });
  }
}
