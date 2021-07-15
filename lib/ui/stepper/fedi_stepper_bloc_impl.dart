import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/ui/stepper/fedi_stepper_bloc.dart';
import 'package:fedi/ui/stepper/fedi_stepper_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class FediStepperBloc<T extends IFediStepperItem> extends DisposableOwner
    implements IFediStepperBloc<T> {
  final BehaviorSubject<int> currentStepIndexSubject;

  final BehaviorSubject<FediStepperState<T>> stepperStateSubject;

  final VoidCallback submitCallback;

  @override
  bool get isCurrentStepIndexLast => currentStepIndex == steps.length - 1;

  @override
  bool get isCurrentStepIndexFirst => currentStepIndex == 0;

  @override
  int get currentStepIndex => currentStepIndexSubject.value;

  @override
  Stream<int> get currentStepIndexStream => currentStepIndexSubject.stream;

  @override
  FediStepperState<T> get stepperState => stepperStateSubject.value;

  @override
  Stream<FediStepperState<T>> get stepperStateStream =>
      stepperStateSubject.stream;

  @override
  final List<T> steps;

  FediStepperBloc({
    int startStepIndex = 0,
    required this.steps,
    required this.submitCallback,
  })  : currentStepIndexSubject = BehaviorSubject.seeded(
          startStepIndex,
        ),
        stepperStateSubject = BehaviorSubject.seeded(
          FediStepperState(
            currentStepIndex: startStepIndex,
            steps: steps,
          ),
        ),
        assert(
          startStepIndex < steps.length && startStepIndex >= 0,
          'startStepIndex out of bounds',
        ) {
    currentStepIndexSubject.disposeWith(this);
    stepperStateSubject.disposeWith(this);

    currentStepIndexSubject.stream.listen((_) {
      _recalculateState();
    });

    steps.forEach(
      (step) => step.itemStateStream.listen(
        (_) {
          _recalculateState();
        },
      ).disposeWith(this),
    );
  }

  void _recalculateState() {
    var newState = FediStepperState(
      currentStepIndex: currentStepIndex,
      steps: steps,
    );

    stepperStateSubject.add(
      newState,
    );
  }

  @override
  void goToPreviousStep() {
    assert(!isCurrentStepIndexFirst);
    currentStepIndexSubject.add(currentStepIndex - 1);
  }

  @override
  void goToNextStep() {
    assert(!isCurrentStepIndexLast);
    currentStepIndexSubject.add(currentStepIndex + 1);
  }

  @override
  void goToStepAtIndex(int index) {
    assert(index >= 0 && index < steps.length);
    currentStepIndexSubject.add(index);
  }

  @override
  Future submit() async {
    steps.forEach((step) => step.onStepComplete());

    if (!isHaveAtLeastOneError) {
      submitCallback();
    }
  }

  @override
  bool get isHaveAtLeastOneError => _calculateIsHaveAtLeastOneError(
        stepperState,
      );

  @override
  Stream<bool> get isHaveAtLeastOneErrorStream => stepperStateStream.map(
        _calculateIsHaveAtLeastOneError,
      );

  static bool _calculateIsHaveAtLeastOneError<T extends IFediStepperItem>(
    FediStepperState<T> stepperState,
  ) =>
      stepperState.steps
          .map((step) => step.isHaveErrors)
          .fold(false, (previousValue, element) => previousValue || element);
}
