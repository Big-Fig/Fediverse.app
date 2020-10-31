import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountAvatarWidget extends StatelessWidget {
  final double imageSize;
  final double progressSize;

  const AccountAvatarWidget({this.imageSize = 80.0, this.progressSize = 30.0});

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);

    return StreamBuilder<String>(
        stream: accountBloc.avatarStream,
        builder: (context, snapshot) {
          var avatar = snapshot.data;

          return buildAccountAvatarWidget(
              avatarUrl: avatar,
              progressSize: progressSize,
              imageSize: imageSize);
        });
  }

  static Widget buildAccountAvatarWidget({
    @required String avatarUrl,
    @required double progressSize,
    @required double imageSize,
  }) {
    if (avatarUrl == null) {
      return Container(
        width: imageSize,
        height: imageSize,
        child: buildLoading(progressSize),
      );
    }

    return Container(
      width: imageSize,
      height: imageSize,
      child: Center(
        child: CachedNetworkImage(
          imageBuilder: (context, imageProvider) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(imageSize / 2),
              child: Image(
                width: imageSize,
                height: imageSize,
                image: imageProvider,
              ),
            );
          },
          imageUrl: avatarUrl,
          placeholder: (context, url) => buildLoading(progressSize),
          errorWidget: (context, url, error) => Icon(FediIcons.warning),
          height: imageSize,
          width: imageSize,
        ),
      ),
    );
  }

  static Center buildLoading(double progressSize) {
    return Center(
      child: FediCircularProgressIndicator(size: progressSize),
    );
  }
}
