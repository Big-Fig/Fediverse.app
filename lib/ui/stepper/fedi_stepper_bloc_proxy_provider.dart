import 'package:fedi/ui/stepper/fedi_stepper_bloc.dart';
import 'package:fedi/ui/stepper/fedi_stepper_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class FediStepperBlocProxyProvider<T extends IFediStepperItem>
    extends StatelessWidget {
  final Widget child;

  const FediStepperBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IFediStepperBloc<T>, IFediStepperBloc>(
        update: (context, value, previous) => value,
        child: ProxyProvider<IFediStepperBloc<T>,
            IFediStepperBloc<IFediStepperItem>>(
          update: (context, value, previous) => value,
          child: child,
        ),
      );
}
