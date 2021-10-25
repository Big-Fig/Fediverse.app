import 'package:fedi_app/app/account/account_bloc.dart';
import 'package:fedi_app/app/cache/files/files_cache_service.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountAvatarWidget extends StatelessWidget {
  final double imageSize;
  final double progressSize;

  const AccountAvatarWidget({
    Key? key,
    // ignore: no-magic-number
    this.imageSize = 80.0,
    // ignore: no-magic-number
    this.progressSize = 30.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);

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
      return SizedBox(
        width: imageSize,
        // ignore: no-equal-arguments
        height: imageSize,
        child: _AccountAvatarLoadingWidget(
          progressSize: progressSize,
        ),
      );
    }

    return SizedBox(
      width: imageSize,
      // ignore: no-equal-arguments
      height: imageSize,
      child: Center(
        child: IFilesCacheService.of(context).createCachedNetworkImageWidget(
          imageBuilder: (context, imageProvider) => ClipRRect(
            // ignore: no-magic-number
            borderRadius: BorderRadius.circular(imageSize / 2),
            child: Image(
              width: imageSize,
              // ignore: no-equal-arguments
              height: imageSize,
              image: imageProvider,
            ),
          ),
          imageUrl: avatarUrl,
          placeholder: (context, url) => _AccountAvatarLoadingWidget(
            progressSize: progressSize,
          ),
          errorWidget: (context, url, dynamic error) =>
              const _AccountAvatarFailedWidget(),
          height: imageSize,
          // ignore: no-equal-arguments
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
  Widget build(BuildContext context) => const Icon(FediIcons.warning);
}

class _AccountAvatarLoadingWidget extends StatelessWidget {
  const _AccountAvatarLoadingWidget({
    Key? key,
    required this.progressSize,
  }) : super(key: key);
  final double progressSize;

  @override
  Widget build(BuildContext context) => Center(
        child: FediCircularProgressIndicator(size: progressSize),
      );
}
