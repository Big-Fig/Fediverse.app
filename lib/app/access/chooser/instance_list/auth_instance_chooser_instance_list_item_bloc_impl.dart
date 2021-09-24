import 'package:easy_dispose/easy_dispose.dart';

import 'package:fedi/app/access/chooser/instance_list/auth_instance_chooser_instance_list_item_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';

class UnifediApiAccessChooserInstanceListItemBloc extends DisposableOwner
    implements IUnifediApiAccessChooserInstanceListItemBloc {
  @override
  final bool isSelected;
  @override
  final UnifediApiAccess instance;

  UnifediApiAccessChooserInstanceListItemBloc({
    required this.isSelected,
    required this.instance,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiAccessChooserInstanceListItemBloc &&
          runtimeType == other.runtimeType &&
          isSelected == other.isSelected &&
          instance == other.instance;

  @override
  int get hashCode => isSelected.hashCode ^ instance.hashCode;
}
