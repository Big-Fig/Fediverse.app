import 'package:fedi/app/account/my/account_mute/action/my_account_account_mute_action_mute_button_widget.dart';
import 'package:fedi/app/account/my/account_mute/action/my_account_account_mute_action_notifications_button_widget.dart';
import 'package:flutter/cupertino.dart';

class MyAccountAccountMuteActionListWidget extends StatelessWidget {
  final bool defaultMuting;

  const MyAccountAccountMuteActionListWidget({
    required this.defaultMuting,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          MyAccountAccountMuteActionMuteButtonWidget(
            defaultMuting: defaultMuting,
          ),
          MyAccountAccountMuteActionNotificationsButtonWidget(
            defaultMuting: defaultMuting,
          ),
        ],
      ),
    );
  }
}
