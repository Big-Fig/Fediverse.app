import 'package:fedi/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/app/account/my/my_account_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';

class MyAccountAvatarWidget extends StatelessWidget {
  final double imageSize;
  final double progressSize;

  const MyAccountAvatarWidget({
    // ignore: no-magic-number
    this.imageSize = 24,
    // ignore: no-magic-number
    this.progressSize = 24,
  });

  @override
  Widget build(BuildContext context) => MyAccountBlocProxyProvider(
        child: AccountAvatarWidget(
          imageSize: imageSize,
          progressSize: progressSize,
        ),
      );
}
