import 'package:fedi/app/auth/instance/join/join_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/join/join_auth_instance_bloc_impl.dart';
import 'package:fedi/app/auth/instance/join/join_auth_instance_widget.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FromScratchJoinAuthInstancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FediLightStatusBarStyleArea(
      child: Scaffold(
        backgroundColor: IFediUiColorTheme.of(context).primaryDark,
        body: SafeArea(
          child: JoinAuthInstanceWidget(
            isFromScratch: true,
          ),
        ),
      ),
    );
  }

  const FromScratchJoinAuthInstancePage();
}

void goToJoinNewInstancePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<IJoinAuthInstanceBloc>(
            create: (context) => JoinAuthInstanceBloc(),
            child: FromScratchJoinAuthInstancePage())),
  );
}
