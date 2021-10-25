import 'package:mastodon_api/mastodon_api.dart';

import '../pleroma_api_account_model.dart';
import 'notifications_settings/pleroma_api_my_account_notifications_settings_model.dart';
import 'source/pleroma_api_my_account_source_model.dart';

abstract class IPleromaApiMyAccount
    implements IMastodonApiMyAccount, IPleromaApiAccount {
  @override
  IPleromaApiMyAccountSource? get source;

  @override
  IPleromaApiMyAccountPleromaPart? get pleroma;

  int? get followRequestsCount;
}

abstract class IPleromaApiMyAccountPleromaPart
    implements IPleromaApiAccountPleromaPart {
  Map<String, dynamic>? get settingsStore;

  int? get unreadConversationCount;

  int? get unreadNotificationsCount;

  String? get chatToken;

  IPleromaApiMyAccountNotificationsSettings? get notificationSettings;
}
