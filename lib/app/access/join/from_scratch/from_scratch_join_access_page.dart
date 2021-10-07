import 'package:fedi/app/access/join/from_scratch/from_scratch_join_access_page_keys.dart';
import 'package:fedi/app/access/join/join_access_bloc_impl.dart';
import 'package:fedi/app/access/join/join_access_widget.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FromScratchJoinUnifediApiAccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FediLightStatusBarStyleArea(
      child: Scaffold(
        backgroundColor: IFediUiColorTheme.of(context).primaryDark,
        body: const SafeArea(
          child: JoinUnifediApiAccessWidget(
            key: Key(
              FromScratchJoinUnifediApiAccessPageKeys
                  .joinUnifediApiAccessWidgetKey,
            ),
          ),
        ),
      ),
    );
  }

  const FromScratchJoinUnifediApiAccessPage();
}

void goToJoinNewInstancePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => JoinUnifediApiAccessBloc.provideToContext(
        context,
        isFromScratch: true,
        child: const FromScratchJoinUnifediApiAccessPage(),
      ),
    ),
  );
}
