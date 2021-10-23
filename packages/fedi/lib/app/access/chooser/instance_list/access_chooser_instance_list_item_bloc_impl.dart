import 'package:easy_dispose/easy_dispose.dart';

import 'package:fedi/app/access/chooser/instance_list/access_chooser_instance_list_item_bloc.dart';
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
}
