import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/cache/files/files_cache_service.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountAvatarWidget extends StatelessWidget {
  final double imageSize;
  final double progressSize;

  const AccountAvatarWidget({this.imageSize = 80.0, this.progressSize = 30.0});

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);

    return StreamBuilder<String?>(
      stream: accountBloc.avatarStream,
      builder: (context, snapshot) {
        var avatar = snapshot.data;

        return Provider<String?>.value(
          value: avatar,
          child: AccountAvatarUrlWidget(
            progressSize: progressSize,
            imageSize: imageSize,
          ),
        );
      },
    );
  }
}

class AccountAvatarUrlWidget extends StatelessWidget {
  const AccountAvatarUrlWidget({
    Key? key,
    required this.progressSize,
    required this.imageSize,
  }) : super(key: key);

  final double imageSize;
  final double progressSize;

  @override
  Widget build(BuildContext context) {
    var avatarUrl = Provider.of<String?>(context);
    if (avatarUrl == null) {
      return Container(
        width: imageSize,
        height: imageSize,
        child: _AccountAvatarLoadingWidget(
          progressSize: progressSize,
        ),
      );
    }

    return Container(
      width: imageSize,
      height: imageSize,
      child: Center(
        child: IFilesCacheService.of(context).createCachedNetworkImageWidget(
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
          placeholder: (context, url) => _AccountAvatarLoadingWidget(
            progressSize: progressSize,
          ),
          errorWidget: (context, url, error) => _AccountAvatarFailedWidget(),
          height: imageSize,
          width: imageSize,
        ),
      ),
    );
  }
}

class _AccountAvatarFailedWidget extends StatelessWidget {
  const _AccountAvatarFailedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(FediIcons.warning);
  }
}

class _AccountAvatarLoadingWidget extends StatelessWidget {
  const _AccountAvatarLoadingWidget({
    Key? key,
    required this.progressSize,
  }) : super(key: key);
  final double progressSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FediCircularProgressIndicator(size: progressSize),
    );
  }
}
