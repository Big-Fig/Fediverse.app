import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
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

  const FediSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);

    return Provider<bool>.value(
      value: value,
      child: DisposableProxyProvider<bool, ICustomSwitchBloc>(
        update: (context, value, previous) {
          var switchBloc = CustomSwitchBloc(startValue: value);
          switchBloc.currentValueStream
              .listen(
                onChanged,
              )
              .disposeWith(switchBloc);

          return switchBloc;
        },
        child: CustomSwitch(
          width: 43.0,
          height: 19.0,
          indicatorSize: 11.0,
          backgroundBorderRadius: 19.0,
          indicatorActiveColor: fediUiColorTheme.primary,
          indicatorInactiveColor: fediUiColorTheme.lightGrey,
          indicatorDisabledColor: fediUiColorTheme.ultraLightGrey,
          backgroundActiveColor: fediUiColorTheme.transparent,
          backgroundInactiveColor: fediUiColorTheme.transparent,
          // ignore: no-equal-arguments
          backgroundDisabledColor: fediUiColorTheme.transparent,
          borderColor: fediUiColorTheme.black,
          enabled: enabled,
        ),
      ),
    );
  }
}
