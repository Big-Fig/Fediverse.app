import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/share/income/income_share_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IIncomeShareService
    implements IDisposable, IAsyncInitLoadingBloc {
  static IIncomeShareService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IIncomeShareService>(context, listen: listen);

  IncomeShareEvent? get lastReceivedShareEvent;

  Stream<IncomeShareEvent> get incomeShareEventStream;

  Future reset();
}
