import 'package:collection/collection.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/access/current/local_preferences/current_access_local_preference_bloc.dart';
import 'package:fedi_app/app/access/list/access_list_bloc.dart';
import 'package:fedi_app/app/access/local_preferences/access_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/hashtag/hashtag_url_helper.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('current_access_bloc_impl.dart');

class CurrentUnifediApiAccessBloc extends DisposableOwner
    implements ICurrentUnifediApiAccessBloc {
  final ILocalPreferencesService localPreferencesService;
  final IUnifediApiAccessListBloc instanceListBloc;
  final ICurrentUnifediApiAccessLocalPreferenceBloc currentLocalPreferenceBloc;

  CurrentUnifediApiAccessBloc({
    required this.localPreferencesService,
    required this.instanceListBloc,
    required this.currentLocalPreferenceBloc,
  });

  @override
  UnifediApiAccess? get currentInstance => currentLocalPreferenceBloc.value;

  @override
  Stream<UnifediApiAccess?> get currentInstanceStream =>
      currentLocalPreferenceBloc.stream;

  @override
  Future<void> changeCurrentInstance(UnifediApiAccess instance) async {
    _logger.finest(() => 'changeCurrentInstance $instance');

    var unifediApiAccessLocalPreferenceBloc =
        UnifediApiAccessLocalPreferenceBloc(
      preferencesService: localPreferencesService,
      userAtHost: instance.userAtHost,
    );
    await unifediApiAccessLocalPreferenceBloc.performAsyncInit();
    await unifediApiAccessLocalPreferenceBloc.setValue(instance);
    await unifediApiAccessLocalPreferenceBloc.dispose();

    var found = instanceListBloc.availableInstances.firstWhereOrNull(
      (existInstance) => existInstance.userAtHost == instance.userAtHost,
    );

    if (found == null) {
      await instanceListBloc.addInstance(instance);
    }
    _logger.finest(() => 'changeCurrentInstance before setValue');
    await currentLocalPreferenceBloc.setValue(instance);
    _logger.finest(() => 'changeCurrentInstance after setValue');
  }

  @override
  bool isCurrentInstance(UnifediApiAccess instance) =>
      currentInstance == instance;

  @override
  Future<void> logoutCurrentInstance() async {
    _logger.finest(() => 'logoutCurrentInstance $currentInstance');
    if (currentInstance != null) {
      await instanceListBloc.removeInstance(currentInstance!);
    }

    if (instanceListBloc.isHaveInstances) {
      await currentLocalPreferenceBloc
          .setValue(instanceListBloc.availableInstances.first);
    } else {
      await currentLocalPreferenceBloc.setValue(null);
    }
  }

  @override
  String createHashtagUrl({
    required String hashtag,
  }) {
    var isMastodon = currentInstance!.isMastodon;
    var isPleroma = currentInstance!.isPleroma;
    var urlHost = currentInstance!.urlHost;
    var urlSchema = currentInstance!.urlSchema;

    return HashtagUrlHelper.calculateHashtagUrl(
      urlSchema: urlSchema,
      isMastodon: isMastodon,
      isPleroma: isPleroma,
      urlHost: urlHost,
      hashtag: hashtag,
    );
  }

  @override
  // todo: remove hack
  bool get isSupportChats => currentInstance!.isPleroma;
}
