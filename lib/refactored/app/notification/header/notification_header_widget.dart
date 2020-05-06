import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/account_bloc_impl.dart';
import 'package:fedi/refactored/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/refactored/app/account/details/account_details_page.dart';
import 'package:fedi/refactored/app/account/display_name/account_display_name_widget.dart';
import 'package:fedi/refactored/app/notification/created_at/notification_created_at_widget.dart';
import 'package:fedi/refactored/app/notification/notification_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';

abstract class NotificationHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var notificationBloc = INotificationBloc.of(context, listen: true);

    return Column(
      children: [
        DisposableProvider<IAccountBloc>(
            create: (context) => AccountBloc.createFromContext(context,
                account: notificationBloc.account,
                isNeedRefreshFromNetworkOnInit: false,
                isNeedWatchLocalRepositoryForUpdates: true,
                isNeedWatchWebSocketsEvents: false),
            child: GestureDetector(
              onTap: () {
                goToAccountDetailsPage(context, notificationBloc.account);
              },
              child: Row(
                children: <Widget>[
                  AccountAvatarWidget(imageSize: 30, progressSize: 15),
                  SizedBox(
                    width: 10,
                  ),
                  AccountDisplayNameWidget()
                ],
              ),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: buildNotificationHeaderContext(context),
        )
      ],
    );
  }

  static Widget buildIconAndTextContext(
          {@required BuildContext context,
          @required IconData iconData,
          @required String text}) =>
      Row(
        children: [
          Icon(iconData),
          SizedBox(
            width: 8,
          ),
          Text(text),
          SizedBox(
            width: 8,
          ),
          NotificationCreatedAtWidget()
        ],
      );

  Widget buildNotificationHeaderContext(BuildContext context);
}
