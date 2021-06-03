import 'package:collection/collection.dart';
import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/current/local_preferences/current_auth_instance_local_preference_bloc.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:logging/logging.dart';

var _logger = Logger('current_auth_instance_bloc_impl.dart');

class CurrentAuthInstanceBloc extends DisposableOwner
    implements ICurrentAuthInstanceBloc {
  final IAuthInstanceListBloc instanceListBloc;
  final ICurrentAuthInstanceLocalPreferenceBloc currentLocalPreferenceBloc;

  CurrentAuthInstanceBloc({
    required this.instanceListBloc,
    required this.currentLocalPreferenceBloc,
  });

  @override
  AuthInstance? get currentInstance => currentLocalPreferenceBloc.value;

  @override
  Stream<AuthInstance?> get currentInstanceStream =>
      currentLocalPreferenceBloc.stream;

  @override
  Future changeCurrentInstance(AuthInstance instance) async {
    _logger.finest(() => 'changeCurrentInstance $instance');

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
  bool isCurrentInstance(AuthInstance instance) => currentInstance == instance;

  @override
  Future logoutCurrentInstance() async {
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
    var urlHost = currentInstance!.urlHost;
    var urlSchema = currentInstance!.urlSchema;
    if (currentInstance!.isMastodon) {
      return '$urlSchema://$urlHost/tag/$hashtag';
    } else if (currentInstance!.isPleroma) {
      return '$urlSchema://$urlHost/tags/$hashtag';
    } else {
      // TODO: implement createHashtagUrl
      throw UnimplementedError();
    }
  }
}
