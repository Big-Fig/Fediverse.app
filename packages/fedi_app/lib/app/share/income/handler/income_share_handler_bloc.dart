import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/share/income/handler/income_share_handler_model.dart';
import 'package:fedi_app/share/income/income_share_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IIncomeShareHandlerBloc implements IDisposable {
  Stream<IncomeShareHandlerError> get incomeShareHandlerErrorStream;

  Stream<List<UnifediApiAccess>> get needChooseInstanceFromListStream;

  Future<void> chooseInstance(UnifediApiAccess instance);

  Stream<IncomeShareEvent> get needChooseActionForEventStream;

  Future<void> checkForInitialEvent();

  Future<void> reset();
}
