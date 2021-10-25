import '../../unifedi_api_model.dart';
import '../unifedi_api_account_model.dart';
import 'notifications_settings/unifedi_api_my_account_notifications_settings_model.dart';

abstract class IUnifediApiMyAccount
    implements IUnifediApiAccount, IUnifediApiResponse {
  int? get followRequestsCount;

  bool? get discoverable;

  Map<String, dynamic>? get settingsStore;

  int? get unreadConversationCount;

  int? get unreadNotificationsCount;

  String? get chatToken;

  IUnifediApiMyAccountNotificationsSettings? get notificationSettings;

  bool? get showRole;

  bool? get noRichText;

  String? get actorType;

  String? get privacy;

  bool? get sensitive;

  String? get language;
}
