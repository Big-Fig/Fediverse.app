import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/access/chooser/access_chooser_bloc.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/access/list/access_list_bloc.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('access_chooser_bloc_impl.dart');

class AccessChooserBloc extends DisposableOwner implements IAccessChooserBloc {
  final IAccessListBloc instanceListBloc;

  final ICurrentAccessBloc currentInstanceBloc;

  AccessChooserBloc({
    required this.instanceListBloc,
    required this.currentInstanceBloc,
  });

  @override
  Future<void> chooseInstance(UnifediApiAccess instance) =>
      currentInstanceBloc.changeCurrentInstance(instance);

  @override
  List<UnifediApiAccess> get instancesAvailableToChoose =>
      filterNotSelected(instanceListBloc.availableInstances).toList();

  @override
  Stream<List<UnifediApiAccess>> get instancesAvailableToChooseStream =>
      instanceListBloc.availableInstancesStream.map(filterNotSelected);

  List<UnifediApiAccess> filterNotSelected(
    List<UnifediApiAccess> availableInstances,
  ) {
    var selectedInstance = this.selectedInstance;
    var filtered = availableInstances
        .where(
          (instance) => instance.userAtHost != selectedInstance!.userAtHost,
        )
        .toList();
    _logger.finest(
      () => 'filterNotSelected \n'
          '\t availableInstances = ${availableInstances.length} \n'
          '\t filtered = ${filtered.length} \n',
    );

    return filtered;
  }

  @override
  UnifediApiAccess? get selectedInstance => currentInstanceBloc.currentInstance;

  @override
  Stream<UnifediApiAccess?> get selectedInstanceStream =>
      currentInstanceBloc.currentInstanceStream;

  @override
  Future<void> removeInstance(UnifediApiAccess instance) =>
      instanceListBloc.removeInstance(instance);

  static AccessChooserBloc createFromContext(BuildContext context) =>
      AccessChooserBloc(
        instanceListBloc: IAccessListBloc.of(context, listen: false),
        currentInstanceBloc: ICurrentAccessBloc.of(context, listen: false),
      );
}
