import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/access/current/local_preferences/current_access_local_preference_bloc_impl.dart';
import 'package:fedi/app/access/list/access_list_model.dart';
import 'package:fedi/app/access/list/local_preferences/access_list_local_preference_bloc_impl.dart';
import 'package:fedi/app/access/local_preferences/access_local_preference_bloc_impl.dart';
import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc_impl.dart';
import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/app/hive/old/auth_host_access_token_local_preference_old_bloc_impl.dart';
import 'package:fedi/app/hive/old/auth_host_application_local_preference_old_bloc_impl.dart';
import 'package:fedi/app/hive/old/auth_instance_list_local_preference_old_bloc_impl.dart';
import 'package:fedi/app/hive/old/current_auth_instance_local_preference_old_bloc_impl.dart';
import 'package:fedi/app/hive/old/my_account_local_preference_old_bloc_impl.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:mastodon_api/mastodon_api.dart';
import 'package:pleroma_api/pleroma_api.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:unifedi_api/unifedi_api_mastodon_adapter.dart';
import 'package:unifedi_api/unifedi_api_pleroma_adapter.dart';

var _logger = Logger('hive_local_preferences_service_impl.dart');

class HiveLocalPreferencesService extends AsyncInitLoadingBloc
    implements ILocalPreferencesService {
  final String boxName;
  final String? path;

  HiveLocalPreferencesService({
    required this.boxName,
    this.path,
  });

  HiveLocalPreferencesService.withLastVersionBoxName({
    String? path,
  }) : this(
          boxName: 'local_preferences_v3',
          path: path,
        );

  // ignore: avoid-late-keyword
  late Box _box;

  @override
  Future internalAsyncInit() async {
    var v2Name = 'local_preferences_v2';
    var isV2BoxExist = await Hive.boxExists(
      v2Name,
    );
    _logger.fine(() => 'internalAsyncInit'
        'isV2BoxExist = $isV2BoxExist');

    _box = await Hive.openBox<dynamic>(
      boxName,
      path: path,
    );

    if (isV2BoxExist && boxName != v2Name) {
      await migrateV2toV3(v2Name);
    }
  }

  // ignore_for_file: long-method
  Future<void> migrateV2toV3(String v2Name) async {
    try {
      var hiveLocalPreferencesService =
          HiveLocalPreferencesService(boxName: v2Name, path: path);

      await hiveLocalPreferencesService.performAsyncInit();

      var authListBloc = AuthInstanceListLocalPreferenceBlocOld(
        hiveLocalPreferencesService,
      );
      await authListBloc.performAsyncInit();

      var authList = authListBloc.value;

      var scopes = IPleromaApiAccessScopes.calculateAvailableScopes(
        PleromaApiVersion(
          major: 2,
          minor: 4,
          patch: 51,
          buildNumber: 116,
          commit: 'gd86b10a5',
          mastodonCompatibilityVersion: MastodonApiVersion(
            major: 2,
            minor: 7,
            patch: 2,
            buildNumber: null,
            commit: null,
          ),
        ),
      ).toUnifediApiAccessScopesPleromaAdapter().toUnifediApiAccessScopes();

      var hostTokenMap = <String, PleromaApiOAuthToken>{};
      var applicationMap = <String, PleromaApiClientApplication>{};
      var myAccountMap = <String, UnifediApiMyAccount>{};
      if (authList != null) {
        var instances = <UnifediApiAccess>[];
        for (var instance in authList.instances) {
          var userAtHost = instance.userAtHost;
          var host = instance.urlHost;

          var authHostAccessTokenLocalPreferenceBlocOld =
              AuthHostAccessTokenLocalPreferenceBlocOld(
            hiveLocalPreferencesService,
            host: host,
          );
          await authHostAccessTokenLocalPreferenceBlocOld.performAsyncInit();
          var hostAccessToken = authHostAccessTokenLocalPreferenceBlocOld.value;

          if (hostAccessToken != null) {
            hostTokenMap[userAtHost] = hostAccessToken;
          } else {
            hostAccessToken = hostTokenMap[userAtHost];
          }

          var authHostApplicationLocalPreferenceBlocOld =
              AuthHostApplicationLocalPreferenceBlocOld(
            hiveLocalPreferencesService,
            host: host,
          );
          await authHostApplicationLocalPreferenceBlocOld.performAsyncInit();
          var application = authHostApplicationLocalPreferenceBlocOld.value;

          if (application != null) {
            applicationMap[host] = application;
          } else {
            application = applicationMap[host];
          }

          var myAccountBloc = MyAccountLocalPreferenceBlocOld(
            hiveLocalPreferencesService,
            userAtHost: userAtHost,
          );

          await myAccountBloc.performAsyncInit();

          var pleromaAccount = myAccountBloc.value?.pleromaAccount;

          var myAccount2 = pleromaAccount
              ?.toUnifediApiMyAccountPleromaAdapter()
              .toUnifediApiMyAccount();

          if (myAccount2 != null) {
            myAccountMap[userAtHost] = myAccount2;
            var myAccountLocalPreferenceBlocNew = MyAccountLocalPreferenceBloc(
              hiveLocalPreferencesService,
              userAtHost: userAtHost,
            );
            await myAccountLocalPreferenceBlocNew.performAsyncInit();
            await myAccountLocalPreferenceBlocNew.setValue(
              UnifediApiMyAccountWrapper(
                unifediApiAccount: myAccount2,
              ),
            );
            await myAccountLocalPreferenceBlocNew.dispose();
          }

          var isPleroma =
              instance.info?.versionString.contains('Pleroma') == true;
          var unifediApiAccess = UnifediApiAccess(
            url: instance.uri.toString(),
            instance: isPleroma
                ? instance.info
                    ?.toUnifediApiInstancePleromaAdapter()
                    .toUnifediApiInstance()
                : instance.info
                    ?.toUnifediApiInstanceMastodonAdapter()
                    .toUnifediApiInstance(),
            userAccessToken: UnifediApiAccessUserToken(
              myAccount: myAccount2,
              user: instance.acct,
              scopes: scopes,
              oauthToken: instance.token!
                  .toUnifediApiOAuthTokenPleromaAdapter()
                  .toUnifediApiOAuthToken(),
            ),
            applicationAccessToken: UnifediApiAccessApplicationToken(
              oauthToken: (hostAccessToken ?? instance.token!)
                  .toUnifediApiOAuthTokenPleromaAdapter()
                  .toUnifediApiOAuthToken(),
              scopes: scopes,
              clientApplication: application!
                  .toUnifediApiClientApplicationPleromaAdapter()
                  .toUnifediApiClientApplication(),
            ),
          );

          instances.add(unifediApiAccess);

          var unifediApiAccessLocalPreferenceBloc =
              UnifediApiAccessLocalPreferenceBloc(
            preferencesService: hiveLocalPreferencesService,
            userAtHost: unifediApiAccess.userAtHost,
          );

          await unifediApiAccessLocalPreferenceBloc.performAsyncInit();
          await unifediApiAccessLocalPreferenceBloc.setValue(unifediApiAccess);
          await unifediApiAccessLocalPreferenceBloc.dispose();

          await myAccountBloc.setValue(null);
          await authHostAccessTokenLocalPreferenceBlocOld.setValue(null);
          await authHostApplicationLocalPreferenceBlocOld.setValue(null);

          await myAccountBloc.dispose();
          await authHostAccessTokenLocalPreferenceBlocOld.dispose();
          await authHostApplicationLocalPreferenceBlocOld.dispose();
        }
        // await authListBloc.setValue(null);
        var accessListLocalPreferenceBloc =
            UnifediApiAccessListLocalPreferenceBloc(
          hiveLocalPreferencesService,
        );

        await accessListLocalPreferenceBloc.performAsyncInit();
        await accessListLocalPreferenceBloc.setValue(
          UnifediApiAccessList(
            instances: instances,
          ),
        );
        await accessListLocalPreferenceBloc.dispose();
      }

      var currentInstanceBlocOld = CurrentAuthInstanceOldLocalPreferenceBlocOld(
        hiveLocalPreferencesService,
      );
      await currentInstanceBlocOld.performAsyncInit();

      var currentInstanceOld = currentInstanceBlocOld.value;

      if (currentInstanceOld != null) {
        var hostAccessToken = hostTokenMap[currentInstanceOld.urlHost];
        var application = applicationMap[currentInstanceOld.urlHost];

        var currentUnifediApiAccessLocalPreferenceBloc =
            CurrentUnifediApiAccessLocalPreferenceBloc(
          hiveLocalPreferencesService,
        );
        await currentUnifediApiAccessLocalPreferenceBloc.performAsyncInit();

        var isPleroma =
            currentInstanceOld.info?.versionString.contains('Pleroma') == true;
        var unifediApiAccess = UnifediApiAccess(
          url: currentInstanceOld.uri.toString(),
          instance: isPleroma
              ? currentInstanceOld.info
                  ?.toUnifediApiInstancePleromaAdapter()
                  .toUnifediApiInstance()
              : currentInstanceOld.info
                  ?.toUnifediApiInstanceMastodonAdapter()
                  .toUnifediApiInstance(),
          userAccessToken: UnifediApiAccessUserToken(
            myAccount: myAccountMap[currentInstanceOld.userAtHost],
            user: currentInstanceOld.acct,
            scopes: scopes,
            // same as for user because we don't have app token
            oauthToken: currentInstanceOld.token!
                .toUnifediApiOAuthTokenPleromaAdapter()
                .toUnifediApiOAuthToken(),
          ),
          applicationAccessToken: UnifediApiAccessApplicationToken(
            oauthToken: (hostAccessToken ?? currentInstanceOld.token!)
                .toUnifediApiOAuthTokenPleromaAdapter()
                .toUnifediApiOAuthToken(),
            scopes: scopes,
            clientApplication: application!
                .toUnifediApiClientApplicationPleromaAdapter()
                .toUnifediApiClientApplication(),
          ),
        );

        await currentUnifediApiAccessLocalPreferenceBloc
            .setValue(unifediApiAccess);

        await currentInstanceBlocOld.setValue(null);

        await currentUnifediApiAccessLocalPreferenceBloc.dispose();
      }

      await currentInstanceBlocOld.dispose();

      for (var i = 0; i < hiveLocalPreferencesService._box.length; i++) {
        dynamic keyAt = hiveLocalPreferencesService._box.keyAt(i);
        dynamic at = hiveLocalPreferencesService._box.getAt(i);
        await _box.put(keyAt, at);
      }

      await hiveLocalPreferencesService.dispose();

      await Hive.deleteBoxFromDisk(v2Name);
    } catch (e, stackTrace) {
      _logger.warning(
        () => 'failed migration from v2 to v3 hive models',
        e,
        stackTrace,
      );
    }
  }

  @override
  Future<bool> clearAllValues() async {
    _logger.fine(() => 'clearAllValues');
    var clearedKeysCount = await _box.clear();

    return clearedKeysCount > 0;
  }

  @override
  Future<bool> delete() async {
    _logger.fine(() => 'delete');
    await _box.deleteFromDisk();

    return true;
  }

  @override
  bool isKeyExist(String key) {
    var contains = _box.containsKey(key);
    _logger.fine(() => 'isKeyExist $key => $contains');

    return contains;
  }

  @override
  Future<bool> clearValue(String key) async {
    await _box.delete(key);

    return true;
  }

  @override
  Future<bool> setString(String key, String? value) async {
    await _box.put(key, value);

    return true;
  }

  @override
  Future<bool> setIntPreference(String key, int? value) async {
    await _box.put(key, value);

    return true;
  }

  @override
  Future<bool> setBoolPreference(String key, bool? value) async {
    await _box.put(key, value);

    return true;
  }

  @override
  Future<bool> setObjectPreference(
    String key,
    IJsonObj? preferencesObject,
  ) async {
    // _logger.fine(() => 'setObjectPreference $key -> $preferencesObject');
    await _box.put(key, preferencesObject);

    return true;
  }

  @override
  bool? getBoolPreference(
    String key,
  ) =>
      _box.get(key) as bool?;

  @override
  String? getStringPreference(String key) => _box.get(key) as String?;

  @override
  int? getIntPreference(String key) => _box.get(key) as int?;

  @override
  T? getObjectPreference<T>(
    String key,
    T Function(Map<String, dynamic> jsonData) jsonConverter,
  ) {
    return _box.get(key) as T?;
  }

  @override
  Future<bool> clearAllValuesAndDeleteStorage() async {
    await _box.deleteFromDisk();

    return true;
  }

  @override
  Future<bool> isStorageExist() async => _box.length > 0;

  @override
  IDisposable listenKeyPreferenceChanged<T>(
    String key,
    ValueCallback<T> onChanged,
  ) =>
      StreamSubscriptionDisposable(
        _box.watch(key: key).listen(
          (BoxEvent boxEvent) {
            onChanged(boxEvent.value as T);
          },
        ),
      );
}
