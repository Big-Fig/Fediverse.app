import 'package:fedi/app/custom_list/form/custom_list_form_bloc.dart';
import 'package:fedi/ui/form/form_bloc_impl.dart';
import 'package:fedi/ui/form/form_item_bloc.dart';

class CustomListFormBloc extends FormBloc implements ICustomListFormBloc {
  @override
  void clear() {
    // TODO: implement clear
  }

  @override
  // TODO: implement items
  List<IFormItemBloc> get items => throw UnimplementedError();
}
