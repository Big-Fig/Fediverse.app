import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:flutter/material.dart';

class TosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: FediSubPageTitleAppBar(
        title: S.of(context).app_tos_title,
      ),
      body: SafeArea(
        child: Padding(
          padding: FediPadding.allBigPadding,
          child: SingleChildScrollView(
            child: FutureBuilder(
              // TODO: Should be localized
              future: DefaultAssetBundle.of(context)
                  .loadString("assets/terms/terms.rtf"),
              builder: (context, snapshot) {
                return Text(
                  snapshot.data ?? '',
                  style: IFediUiTextTheme.of(context).mediumShortDarkGrey,
                  softWrap: true,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

void goToTosPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => TosPage()),
  );
}
