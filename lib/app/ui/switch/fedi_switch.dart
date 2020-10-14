import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/ui/switch/custom_switch.dart';
import 'package:fedi/ui/switch/custom_switch_bloc.dart';
import 'package:fedi/ui/switch/custom_switch_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FediSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool enabled;

  FediSwitch({
    @required this.value,
    @required this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) => Provider.value(
        value: value,
        child: DisposableProxyProvider<bool, ICustomSwitchBloc>(
          update: (context, value, previous) {
            var switchBloc = CustomSwitchBloc(startValue: value);
            switchBloc.addDisposable(streamSubscription:
                switchBloc.currentValueStream.listen((newValue) {
              onChanged(newValue);
            }));
            return switchBloc;
          },
          child: CustomSwitch(
            width: 43.0,
            height: 19.0,
            indicatorSize: 11.0,
            backgroundBorderRadius: 19.0,
            indicatorPadding: EdgeInsets.all(4.0),
            indicatorActiveColor: FediColors.primary,
            indicatorInactiveColor: FediColors.lightGrey,
            enabled: enabled,
          ),
        ),
      );
}
