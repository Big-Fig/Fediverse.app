import 'package:easy_dispose/easy_dispose.dart';

import 'package:fedi_app/app/access/chooser/instance_list/access_chooser_instance_list_item_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';

class AccessChooserInstanceListItemBloc extends DisposableOwner
    implements IAccessChooserInstanceListItemBloc {
  @override
  final bool isSelected;
  @override
  final UnifediApiAccess instance;

  AccessChooserInstanceListItemBloc({
    required this.isSelected,
    required this.instance,
  });
}
