import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyAccountAvatarWidget extends StatelessWidget {
  final double imageSize;
  final double progressSize;

  MyAccountAvatarWidget({this.imageSize = 24, this.progressSize = 24});

  @override
  Widget build(
          BuildContext context) =>
      ProxyProvider<IMyAccountBloc, IAccountBloc>(
          update: (context, value, previous) => value,
          child: AccountAvatarWidget(
              imageSize: imageSize, progressSize: progressSize));
}
