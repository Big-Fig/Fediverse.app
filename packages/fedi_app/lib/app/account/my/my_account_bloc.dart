import 'package:fedi_app/app/account/account_bloc.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/my/my_account_model.dart';
import 'package:fedi_app/app/chat/message/chat_message_model.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IMyAccountBloc extends IAccountBloc {
  static IMyAccountBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IMyAccountBloc>(context, listen: listen);

  IMyAccount? get myAccount;

  Stream<IMyAccount?> get myAccountStream;

  UnifediApiAccess get instance;

  bool get isLocalCacheExist;

  bool checkAccountIsMe(IAccount account);

  bool checkIsStatusFromMe(IStatus status);

  Future<void> updateMyAccountByMyUnifediApiAccount(
    IUnifediApiMyAccount unifediApiMyAccount,
  );

  Future<void> updateMyAccountByMyAccount(IMyAccount myAccount);

  Future<void> decreaseFollowingRequestCount();

  bool checkIsChatMessageFromMe(IChatMessage chatMessage);
}

extension IMyAccountBlocExtension on IMyAccountBloc {
  String? get noteUnescaped {
    final _unescape = HtmlUnescape();
    if (note != null) {
      var unescaped = _unescape.convert(note!);
      // todo: remove hack
      // on Mastodon instances note wrapped in <p></p>
      if (unescaped.startsWith('<p>') && unescaped.endsWith('</p>')) {
        // ignore: no-magic-number
        unescaped = unescaped.substring(3, unescaped.length - 4);
      }

      return unescaped;
    } else {
      return null;
    }
  }

  int? get followRequestsCount => myAccount!.followRequestsCount;

  Stream<int?> get followRequestsCountStream => myAccountStream.map(
        (myAccount) => myAccount!.followRequestsCount,
      );

  int? get unreadNotificationsCount => myAccount!.unreadNotificationsCount;

  Stream<int?> get unreadNotificationsCountStream => myAccountStream.map(
        (myAccount) => myAccount!.unreadNotificationsCount,
      );

  int? get unreadConversationCount => myAccount!.unreadConversationCount;

  Stream<int?> get unreadConversationCountStream => myAccountStream.map(
        (myAccount) => myAccount!.unreadConversationCount,
      );
}
