import 'package:fedi/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_transparent_text_button_with_border.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/ui/stepper/fedi_stepper_bloc.dart';
import 'package:fedi/ui/stepper/fedi_stepper_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef FediStepperWidgetBuilder<T extends IFediStepperItem> = Widget Function(
  BuildContext context,
  T stepperItem,
);

class FediStepperWidget<T extends IFediStepperItem> extends StatelessWidget {
  final FediStepperWidgetBuilder<T> titleBuilder;
  final FediStepperWidgetBuilder<T>? subTitleBuilder;
  final FediStepperWidgetBuilder<T> contentBuilder;

  const FediStepperWidget({
    required this.titleBuilder,
    this.subTitleBuilder,
    required this.contentBuilder,
  });

  @override
  Widget build(BuildContext context) {
    var fediStepperBloc = IFediStepperBloc.of<T>(context);

    return StreamBuilder<FediStepperState<T>>(
      stream: fediStepperBloc.stepperStateStream,
      initialData: fediStepperBloc.stepperState,
      builder: (context, snapshot) {
        final stepperState = snapshot.data!;

        var currentStepIndex = stepperState.currentStepIndex;
        var currentStep = stepperState.currentStep;

        var itemState = currentStep.itemState;

        var isLast = fediStepperBloc.isCurrentStepIndexLast;
        var isFirst = fediStepperBloc.isCurrentStepIndexFirst;
        var isHaveErrors = itemState == FediStepperItemState.errors;

        return Stepper(
          currentStep: currentStepIndex,
          onStepCancel: fediStepperBloc.goToPreviousStep,
          onStepContinue: () {
            var state = currentStep.onStepComplete();
            if (state != FediStepperItemState.errors) {
              if (isLast) {
                fediStepperBloc.submit();
              } else {
                fediStepperBloc.goToNextStep();
              }
            }
          },
          onStepTapped: fediStepperBloc.goToStepAtIndex,
          controlsBuilder: (
            BuildContext context, {
            VoidCallback? onStepContinue,
            VoidCallback? onStepCancel,
          }) {
            return Row(
              children: <Widget>[
                if (!isLast)
                  _FediStepperNextActionButtonWidget(
                    onStepContinue: isHaveErrors ? null : onStepContinue,
                  ),
                if (isLast) _FediStepperSubmitActionButtonWidget<T>(),
                const FediSmallHorizontalSpacer(),
                if (!isFirst)
                  _FediStepperBackActionButtonWidget(
                    onStepCancel: onStepCancel,
                  ),
              ],
            );
          },
          steps: stepperState.steps.asMap().entries.map(
            (entry) {
              var index = entry.key;
              var stepperItem = entry.value;

              var itemState = stepperItem.itemState;

              var isActive = index == currentStepIndex;

              StepState stepState;

              switch (itemState) {
                case FediStepperItemState.editingNotStarted:
                  if (isActive) {
                    stepState = StepState.editing;
                  } else {
                    stepState = StepState.indexed;
                  }
                  break;
                case FediStepperItemState.errors:
                  stepState = StepState.error;
                  break;
                case FediStepperItemState.editingFinished:
                  stepState = StepState.complete;
                  break;
              }

              return Step(
                state: stepState,
                isActive: isActive,
                title: titleBuilder(context, stepperItem),
                subtitle: subTitleBuilder != null
                    ? subTitleBuilder!(context, stepperItem)
                    : null,
                content: contentBuilder(context, stepperItem),
              );
            },
          ).toList(),
        );
      },
    );
  }
}

class _FediStepperNextActionButtonWidget extends StatelessWidget {
  final VoidCallback? onStepContinue;

  const _FediStepperNextActionButtonWidget({
    Key? key,
    required this.onStepContinue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediPrimaryFilledTextButtonWithBorder(
        S.of(context).app_access_register_action_nextStep,
        onPressed: onStepContinue,
        expanded: false,
      );
}

class _FediStepperSubmitActionButtonWidget<T extends IFediStepperItem>
    extends StatelessWidget {
  const _FediStepperSubmitActionButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediStepperBloc = IFediStepperBloc.of<T>(context);

    return StreamBuilder<bool>(
      stream: fediStepperBloc.isHaveAtLeastOneErrorStream,
      initialData: fediStepperBloc.isHaveAtLeastOneError,
      builder: (context, snapshot) {
        final isHaveAtLeastOneError = snapshot.data!;

        return FediPrimaryFilledTextButtonWithBorder(
          S.of(context).app_access_register_action_submit,
          onPressed:
              isHaveAtLeastOneError ? null : () => fediStepperBloc.submit(),
          expanded: false,
        );
      },
    );
  }
}

class _FediStepperBackActionButtonWidget extends StatelessWidget {
  final VoidCallback? onStepCancel;

  const _FediStepperBackActionButtonWidget({
    Key? key,
    required this.onStepCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediTransparentTextButtonWithBorder(
        S.of(context).app_access_register_action_previousStep,
        onPressed: onStepCancel,
        expanded: false,
        color: IFediUiColorTheme.of(context).mediumGrey,
      );
}
