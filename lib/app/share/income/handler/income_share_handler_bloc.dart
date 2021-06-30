import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/share/income/handler/income_share_handler_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/share/income/income_share_model.dart';

abstract class IIncomeShareHandlerBloc implements IDisposable {
  Stream<IncomeShareHandlerError> get incomeShareHandlerErrorStream;

  Stream<List<AuthInstance>> get needChooseInstanceFromListStream;

  Future chooseInstance(AuthInstance instance);

  Stream<IncomeShareEvent> get needChooseActionForEventStream;

  Future checkForInitialEvent();

  Future reset();
}
