import 'package:fedi_app/app/access/join/from_scratch/from_scratch_join_access_page_keys.dart';
import 'package:fedi_app/app/access/join/join_access_bloc_impl.dart';
import 'package:fedi_app/app/access/join/join_access_widget.dart';
import 'package:fedi_app/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FromScratchJoinAccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FediLightStatusBarStyleArea(
        child: Scaffold(
          backgroundColor: IFediUiColorTheme.of(context).primaryDark,
          body: const SafeArea(
            child: JoinAccessWidget(
              key: Key(
                FromScratchJoinAccessPageKeys.joinAccessWidgetKey,
              ),
            ),
          ),
        ),
      );

  const FromScratchJoinAccessPage({
    Key? key,
  }) : super(key: key);
}

void goToJoinNewInstancePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (context) => JoinAccessBloc.provideToContext(
        context,
        isFromScratch: true,
        child: const FromScratchJoinAccessPage(),
      ),
    ),
  );
}
