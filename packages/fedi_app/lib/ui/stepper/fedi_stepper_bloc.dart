import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/ui/stepper/fedi_stepper_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFediStepperBloc<T extends IFediStepperItem>
    implements IDisposable {
  static IFediStepperBloc<T> of<T extends IFediStepperItem>(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IFediStepperBloc<T>>(
        context,
        listen: listen,
      );

  // todo: refactor with forms
  Stream<bool> get isHaveAtLeastOneErrorStream;

  bool get isHaveAtLeastOneError;

  List<T> get steps;

  bool get isCurrentStepIndexLast;

  bool get isCurrentStepIndexFirst;

  int get currentStepIndex;

  Stream<int> get currentStepIndexStream;

  FediStepperState<T> get stepperState;

  Stream<FediStepperState<T>> get stepperStateStream;

  void goToPreviousStep();

  void goToNextStep();

  void goToStepAtIndex(int index);

  Future<void> submit();
}
