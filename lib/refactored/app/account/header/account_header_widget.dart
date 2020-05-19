import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/ui/fedi_colors.dart';
import 'package:fedi/refactored/app/ui/image/fedi_dark_image_overlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
            imageBuilder: (context, imageProvider) {
              return FediDarkImageBackground(
                  child: Stack(
                children: [
                  Image(
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    image: imageProvider,
                  ),
                  Container(
                      decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        FediColors.darkGrey.withOpacity(0.7),
                        FediColors.darkGrey.withOpacity(0.3),
                        FediColors.darkGrey.withOpacity(0.3),
                        FediColors.darkGrey.withOpacity(0.3),
                        FediColors.darkGrey.withOpacity(0.3),
                        FediColors.darkGrey.withOpacity(0.1),
                      ],
                    ),
                  ))
                ],
              ));
            },
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

  const AccountHeaderWidget();
}
