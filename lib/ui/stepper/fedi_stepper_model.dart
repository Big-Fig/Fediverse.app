import 'package:fedi/collection/collection_hash_utils.dart';
import 'package:flutter/foundation.dart';

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

class FediStepperState<T extends IFediStepperItem> {
  final List<T> steps;
  final int currentStepIndex;

  T get currentStep => steps[currentStepIndex];

  FediStepperState({
    required this.steps,
    required this.currentStepIndex,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FediStepperState &&
          runtimeType == other.runtimeType &&
          listEquals(steps, other.steps) &&
          currentStepIndex == other.currentStepIndex;

  @override
  int get hashCode => listHash(steps) ^ currentStepIndex.hashCode;

  @override
  String toString() => 'FediStepperState{'
      'steps: $steps, '
      'currentStepIndex: $currentStepIndex'
      '}';
}
