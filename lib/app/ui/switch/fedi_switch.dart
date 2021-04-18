import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/ui/switch/custom_switch.dart';
import 'package:fedi/ui/switch/custom_switch_bloc.dart';
import 'package:fedi/ui/switch/custom_switch_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

// todo: refactor
// ignore_for_file: no-magic-number

class FediSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool enabled;

  FediSwitch({
    required this.value,
    required this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) => Provider<bool>.value(
        value: value,
        child: DisposableProxyProvider<bool, ICustomSwitchBloc>(
          update: (context, value, previous) {
            var switchBloc = CustomSwitchBloc(startValue: value);
            switchBloc.addDisposable(
              streamSubscription: switchBloc.currentValueStream.listen(
                (newValue) {
                  onChanged(newValue);
                },
              ),
            );
            return switchBloc;
          },
          child: CustomSwitch(
            width: 43.0,
            height: 19.0,
            indicatorSize: 11.0,
            backgroundBorderRadius: 19.0,
            indicatorPadding: EdgeInsets.all(4.0),
            indicatorActiveColor: IFediUiColorTheme.of(context).primary,
            indicatorInactiveColor: IFediUiColorTheme.of(context).lightGrey,
            backgroundActiveColor: IFediUiColorTheme.of(context).transparent,
            backgroundInactiveColor: IFediUiColorTheme.of(context).transparent,
            backgroundDisabledColor: IFediUiColorTheme.of(context).transparent,
            indicatorDisabledColor: IFediUiColorTheme.of(context).grey,
            borderColor: IFediUiColorTheme.of(context).black,
            enabled: enabled,
          ),
        ),
      );
}
