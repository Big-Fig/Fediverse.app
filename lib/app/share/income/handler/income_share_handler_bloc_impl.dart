import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';

import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/access/list/access_list_bloc.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/share/income/handler/income_share_handler_bloc.dart';
import 'package:fedi/app/share/income/handler/income_share_handler_model.dart';
import 'package:fedi/app/share/income/handler/last_chosen_instance/last_chosen_instance_income_share_handler_local_preference_bloc.dart';
import 'package:fedi/share/income/income_share_model.dart';
import 'package:fedi/share/income/income_share_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:fediverse_api/fediverse_api.dart';

final _logger = Logger('income_share_handler_bloc_impl.dart');

class IncomeShareHandlerBloc extends DisposableOwner
    implements IIncomeShareHandlerBloc {
  final IConfigService configService;
  final IIncomeShareService incomeShareService;
  final ICurrentUnifediApiAccessBloc currentUnifediApiAccessBloc;
  final IUnifediApiAccessListBloc authInstanceListBloc;
  final ILastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc
      lastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc;

  final StreamController<IncomeShareEvent>
      needChooseActionForEventStreamController = StreamController.broadcast();
  final StreamController<List<UnifediApiAccess>>
      needChooseInstanceFromListStreamController = StreamController.broadcast();
  final StreamController<IncomeShareHandlerError>
      incomeShareHandlerErrorStreamController = StreamController.broadcast();

  @override
  Stream<IncomeShareEvent> get needChooseActionForEventStream =>
      needChooseActionForEventStreamController.stream;

  @override
  Stream<List<UnifediApiAccess>> get needChooseInstanceFromListStream =>
      needChooseInstanceFromListStreamController.stream;

  @override
  Stream<IncomeShareHandlerError> get incomeShareHandlerErrorStream =>
      incomeShareHandlerErrorStreamController.stream;

  IncomeShareHandlerBloc({
    required this.configService,
    required this.currentUnifediApiAccessBloc,
    required this.authInstanceListBloc,
    required this.incomeShareService,
    required this.lastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc,
  }) {
    needChooseActionForEventStreamController.disposeWith(this);
    needChooseInstanceFromListStreamController.disposeWith(this);
    incomeShareHandlerErrorStreamController.disposeWith(this);

    incomeShareService.incomeShareEventStream.listen(
      (event) {
        _handleEvent(event);
      },
    ).disposeWith(this);
  }

  static IncomeShareHandlerBloc createFromContext(
    BuildContext context,
  ) {
    var incomeShareHandlerBloc = IncomeShareHandlerBloc(
      incomeShareService: IIncomeShareService.of(
        context,
        listen: false,
      ),
      currentUnifediApiAccessBloc: ICurrentUnifediApiAccessBloc.of(
        context,
        listen: false,
      ),
      authInstanceListBloc: IUnifediApiAccessListBloc.of(
        context,
        listen: false,
      ),
      lastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc:
          ILastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc.of(
        context,
        listen: false,
      ),
      configService: IConfigService.of(
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

    var appAddNewInstanceCallbackUrl =
        configService.appAddNewInstanceCallbackUrl;

    var text = event.text;
    if (text != null) {
      var startsWithAppAddNewInstanceCallbackUrl =
          text.startsWith(appAddNewInstanceCallbackUrl);
      _logger.finest(
        () => '_handleEvent $event '
            'appAddNewInstanceCallbackUrl $appAddNewInstanceCallbackUrl '
            'startsWithAppAddNewInstanceCallbackUrl $startsWithAppAddNewInstanceCallbackUrl',
      );
      if (startsWithAppAddNewInstanceCallbackUrl) {
        return;
      }
    }

    lastHandledEvent = event;
    if (authInstanceListBloc.isHaveInstances) {
      var availableInstances = authInstanceListBloc.availableInstances;
      if (availableInstances.length == 1) {
        _showActionChooser(event);
      } else {
        var currentInstance = currentUnifediApiAccessBloc.currentInstance;
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

  void _showInstanceChooser(List<UnifediApiAccess> availableInstances) {
    needChooseInstanceFromListStreamController.add(availableInstances);
  }

  void _showActionChooser(IncomeShareEvent event) {
    reset();
    lastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc
        .setValue(null);
    needChooseActionForEventStreamController.add(event);
  }

  @override
  Future chooseInstance(UnifediApiAccess instance) async {
    var alreadySelected =
        currentUnifediApiAccessBloc.currentInstance?.userAtHost ==
            instance.userAtHost;
    if (alreadySelected) {
      _showActionChooser(lastHandledEvent!);
    } else {
      await lastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc
          .setValue(instance);
      await currentUnifediApiAccessBloc.changeCurrentInstance(instance);
    }
  }

  @override
  Future reset() async {
    await incomeShareService.reset();
  }
}
