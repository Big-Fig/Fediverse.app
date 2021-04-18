import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_model.dart';
import 'package:flutter/widgets.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountBloc extends IAccountBloc {
  String? get noteUnescaped {
    final HtmlUnescape _unescape = HtmlUnescape();
    if (note != null) {
      var unescaped = _unescape.convert(note!);
      // todo: remove hack
      // on Mastodon instances note wrapped in <p></p>
      if (unescaped.startsWith("<p>") && unescaped.endsWith("</p>")) {
        // ignore: no-magic-number
        unescaped = unescaped.substring(3, unescaped.length - 4);
      }
      return unescaped;
    } else {
      return null;
    }
  }

  static IMyAccountBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IMyAccountBloc>(context, listen: listen);

  IMyAccount? get myAccount;

  Stream<IMyAccount?> get myAccountStream;

  AuthInstance get instance;

  bool get isLocalCacheExist;

  bool checkAccountIsMe(IAccount account);

  bool checkIsStatusFromMe(IStatus status);

  Future updateMyAccountByMyPleromaAccount(IPleromaMyAccount pleromaMyAccount);

  Future updateMyAccountByMyAccount(IMyAccount myAccount);

  Future decreaseFollowingRequestCount();

  bool checkIsChatMessageFromMe(IChatMessage chatMessage);
}

extension IMyAccountBlocExtension on IMyAccountBloc {
  int? get followRequestsCount => myAccount!.followRequestsCount;

  Stream<int?> get followRequestsCountStream => myAccountStream.map(
        (myAccount) => myAccount!.followRequestsCount,
      );

  int? get pleromaUnreadNotificationsCount =>
      myAccount!.pleromaUnreadNotificationsCount;

  Stream<int?> get pleromaUnreadNotificationsCountStream => myAccountStream.map(
        (myAccount) => myAccount!.pleromaUnreadNotificationsCount,
      );

  int? get pleromaUnreadConversationCount =>
      myAccount!.pleromaUnreadConversationCount;

  Stream<int?> get pleromaUnreadConversationCountStream => myAccountStream.map(
        (myAccount) => myAccount!.pleromaUnreadConversationCount,
      );
}
