import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountAvatarWidget extends StatelessWidget {
  final double imageSize;
  final double progressSize;

  AccountAvatarWidget({this.imageSize = 80.0, this.progressSize = 30.0});

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);

    return StreamBuilder<String>(
        stream: accountBloc.avatarStream,
        initialData: accountBloc.avatar,
        builder: (context, snapshot) {
          var avatar = snapshot.data;

          return buildAccountAvatarWidget(
              avatarUrl: avatar,
              progressSize: progressSize,
              imageSize: imageSize);
        });
  }

  static Widget buildAccountAvatarWidget(
      {@required String avatarUrl,
      @required double progressSize,
      @required double imageSize}) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(imageSize / 2),
          child:
              Image(width: imageSize, height: imageSize, image: imageProvider),
        );
      },
      imageUrl: avatarUrl,
      placeholder: (context, url) => Center(
        child: Container(
          width: progressSize,
          height: progressSize,
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
      height: imageSize,
      width: imageSize,
    );
  }
}
