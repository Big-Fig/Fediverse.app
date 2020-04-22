import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyAccountAvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Provider<IAccountBloc>(
      create: (context) => IMyAccountBloc.of(context, listen: false),
      child: AccountAvatarWidget(imageSize: 24, progressSize: 24));
}
