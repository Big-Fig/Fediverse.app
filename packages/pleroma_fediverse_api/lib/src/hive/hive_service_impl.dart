import 'package:easy_dispose/easy_dispose.dart';
import 'package:pleroma_fediverse_api/src/hive/hive_service.dart';

import '../pleroma/api/account/my/pleroma_api_my_account_model.dart';
import '../pleroma/api/account/pleroma_api_account_model.dart';
import '../pleroma/api/application/pleroma_api_application_model.dart';
import '../pleroma/api/emoji/pleroma_api_emoji_model.dart';
import '../pleroma/api/field/pleroma_api_field_model.dart';
import '../pleroma/api/filter/pleroma_api_filter_model.dart';
import '../pleroma/api/instance/pleroma_api_instance_model.dart';
import '../pleroma/api/list/pleroma_api_list_model.dart';
import '../pleroma/api/oauth/pleroma_api_oauth_model.dart';
import '../pleroma/api/push/pleroma_api_push_model.dart';
import '../pleroma/api/tag/history/pleroma_api_tag_history_model.dart';
import '../pleroma/api/tag/pleroma_api_tag_model.dart';

import 'package:hive/hive.dart';

class HiveService extends DisposableOwner implements IHiveService {
  @override
  Future internalAsyncInit() async {}

  // ignore: long-method
  static void registerAdapters() {
    //  PleromaApiFieldAdapter
    var adaptersRegistered = Hive.isAdapterRegistered(5);
    if (adaptersRegistered) {
      return;
    }
    Hive.registerAdapter(PleromaApiFieldAdapter());
    Hive.registerAdapter(PleromaApiEmojiAdapter());
    Hive.registerAdapter(PleromaApiMyAccountPleromaPartAdapter());
    Hive.registerAdapter(
      PleromaApiMyAccountPleromaPartNotificationsSettingsAdapter(),
    );
    Hive.registerAdapter(PleromaApiAccountRelationshipAdapter());
    Hive.registerAdapter(PleromaApiMyAccountSourceAdapter());
    Hive.registerAdapter(PleromaApiMyAccountSourcePleromaPartAdapter());

    Hive.registerAdapter(PleromaApiOAuthTokenAdapter());
    Hive.registerAdapter(PleromaApiClientApplicationAdapter());

    Hive.registerAdapter(PleromaApiMyAccountAdapter());
    Hive.registerAdapter(PleromaApiPushMessageBodyAdapter());
    Hive.registerAdapter(PleromaApiInstancePleromaPartAdapter());
    Hive.registerAdapter(PleromaApiInstanceAdapter());
    Hive.registerAdapter(PleromaApiInstancePleromaPartMetadataAdapter());

    Hive.registerAdapter(PleromaApiInstancePollLimitsAdapter());
    Hive.registerAdapter(PleromaApiAccountAdapter());

    Hive.registerAdapter(
      PleromaApiInstancePleromaPartMetadataFieldLimitsAdapter(),
    );
    Hive.registerAdapter(PleromaApiTagAdapter());
    Hive.registerAdapter(PleromaApiAccountPleromaPartAdapter());
    Hive.registerAdapter(PleromaApiCustomEmojiAdapter());
    Hive.registerAdapter(PleromaApiTagHistoryAdapter());

    Hive.registerAdapter(PleromaApiListAdapter());

    Hive.registerAdapter(
      PleromaApiInstancePleromaPartMetadataFederationAdapter(),
    );
    Hive.registerAdapter(
      PleromaApiInstancePleromaPartMetadataFederationMfrObjectAgeAdapter(),
    );
    Hive.registerAdapter(PleromaApiFilterAdapter());
  }
}
