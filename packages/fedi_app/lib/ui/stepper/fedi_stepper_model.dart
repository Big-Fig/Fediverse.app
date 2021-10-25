import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fedi_stepper_model.freezed.dart';

enum FediStepperItemState {
  editingNotStarted,
  errors,
  editingFinished,
}

abstract class IFediStepperItem {
  FediStepperItemState get itemState;

  Stream<FediStepperItemState> get itemStateStream;

  FediStepperItemState onStepComplete();
}

extension IFediStepperItemExtension on IFediStepperItem {
  bool get isHaveErrors => _calculateIsHaveErrors(itemState);

  Stream<bool> get isHaveErrorsStream =>
      itemStateStream.map(_calculateIsHaveErrors);

  bool get isEditingStarted => _calculateIsEditingStarted(itemState);

  Stream<bool> get isEditingStartedStream =>
      itemStateStream.map(_calculateIsEditingStarted);
}

bool _calculateIsHaveErrors(FediStepperItemState itemState) =>
    itemState == FediStepperItemState.errors;

bool _calculateIsEditingStarted(FediStepperItemState itemState) =>
    itemState == FediStepperItemState.errors ||
    itemState == FediStepperItemState.editingFinished;

@freezed
class FediStepperState<T extends IFediStepperItem> with _$FediStepperState<T> {
  const FediStepperState._();

  T get currentStep => steps[currentStepIndex];

  const factory FediStepperState({
    required List<T> steps,
    required int currentStepIndex,
  }) = _FediStepperState<T>;
}
