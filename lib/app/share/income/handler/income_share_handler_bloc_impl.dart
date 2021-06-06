import 'dart:async';

import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_bloc.dart';
import 'package:fedi/app/share/income/handler/income_share_handler_bloc.dart';
import 'package:fedi/app/share/income/handler/income_share_handler_model.dart';
import 'package:fedi/app/share/income/handler/last_chosen_instance/last_chosen_instance_income_share_handler_local_preference_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/share/income/income_share_model.dart';
import 'package:fedi/share/income/income_share_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

final _logger = Logger('income_share_handler_bloc_impl.dart');

class IncomeShareHandlerBloc extends DisposableOwner
    implements IIncomeShareHandlerBloc {
  final IIncomeShareService incomeShareService;
  final ICurrentAuthInstanceBloc currentAuthInstanceBloc;
  final IAuthInstanceListBloc authInstanceListBloc;
  final ILastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc
      lastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc;

  final StreamController<IncomeShareEvent>
      needChooseActionForEventStreamController = StreamController.broadcast();
  final StreamController<List<AuthInstance>>
      needChooseInstanceFromListStreamController = StreamController.broadcast();
  final StreamController<IncomeShareHandlerError>
      incomeShareHandlerErrorStreamController = StreamController.broadcast();

  @override
  Stream<IncomeShareEvent> get needChooseActionForEventStream =>
      needChooseActionForEventStreamController.stream;

  @override
  Stream<List<AuthInstance>> get needChooseInstanceFromListStream =>
      needChooseInstanceFromListStreamController.stream;

  @override
  Stream<IncomeShareHandlerError> get incomeShareHandlerErrorStream =>
      incomeShareHandlerErrorStreamController.stream;

  IncomeShareHandlerBloc({
    required this.currentAuthInstanceBloc,
    required this.authInstanceListBloc,
    required this.incomeShareService,
    required this.lastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc,
  }) {
    addDisposable(streamController: needChooseActionForEventStreamController);
    addDisposable(streamController: needChooseInstanceFromListStreamController);
    addDisposable(streamController: incomeShareHandlerErrorStreamController);

    addDisposable(
      streamSubscription: incomeShareService.incomeShareEventStream.listen(
        (event) {
          _handleEvent(event);
        },
      ),
    );
  }

  static IncomeShareHandlerBloc createFromContext(
    BuildContext context,
  ) {
    var incomeShareHandlerBloc = IncomeShareHandlerBloc(
      incomeShareService: IIncomeShareService.of(
        context,
        listen: false,
      ),
      currentAuthInstanceBloc: ICurrentAuthInstanceBloc.of(
        context,
        listen: false,
      ),
      authInstanceListBloc: IAuthInstanceListBloc.of(
        context,
        listen: false,
      ),
      lastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc:
          ILastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc.of(
        context,
        listen: false,
      ),
    );

    return incomeShareHandlerBloc;
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) {
    return DisposableProvider<IIncomeShareHandlerBloc>(
      create: (context) => IncomeShareHandlerBloc.createFromContext(
        context,
      ),
      child: child,
    );
  }

  @override
  Future checkForInitialEvent() async {
    var lastReceivedShareEvent = incomeShareService.lastReceivedShareEvent;
    _logger.finest(() => 'checkForInitialEvent $lastReceivedShareEvent');
    if (lastReceivedShareEvent != null) {
      _handleEvent(lastReceivedShareEvent);
    }
  }

  IncomeShareEvent? lastHandledEvent;

  void _handleEvent(IncomeShareEvent event) {
    _logger.finest(() => '_handleEvent $event');
    lastHandledEvent = event;
    if (authInstanceListBloc.isHaveInstances) {
      var availableInstances = authInstanceListBloc.availableInstances;
      if (availableInstances.length == 1) {
        _showActionChooser(event);
      } else {
        var currentInstance = currentAuthInstanceBloc.currentInstance;
        var lastChosenInstance =
            lastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc.value;
        if (lastChosenInstance != null &&
            lastChosenInstance.userAtHost == currentInstance?.userAtHost) {
          _showActionChooser(event);
        } else {
          _showInstanceChooser(availableInstances);
        }
      }
    } else {
      _showInstanceListIsEmptyError();
    }
  }

  void _showInstanceListIsEmptyError() {
    incomeShareHandlerErrorStreamController.add(
      IncomeShareHandlerError.authInstanceListIsEmpty,
    );
  }

  void _showInstanceChooser(List<AuthInstance> availableInstances) {
    needChooseInstanceFromListStreamController.add(availableInstances);
  }

  void _showActionChooser(IncomeShareEvent event) {
    reset();
    lastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc
        .setValue(null);
    needChooseActionForEventStreamController.add(event);
  }

  @override
  Future chooseInstance(AuthInstance instance) async {
    var alreadySelected = currentAuthInstanceBloc.currentInstance?.userAtHost ==
        instance.userAtHost;
    if (alreadySelected) {
      _showActionChooser(lastHandledEvent!);
    } else {
      await lastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc
          .setValue(instance);
      await currentAuthInstanceBloc.changeCurrentInstance(instance);
    }
  }

  @override
  Future reset() async {
    await incomeShareService.reset();
  }
}
