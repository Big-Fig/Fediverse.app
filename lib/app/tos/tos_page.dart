import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/material.dart';

class TosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_tos_title,
      ),
      body: _TosPageBodyWigdet(),
    );
  }

  const TosPage();
}

class _TosPageBodyWigdet extends StatelessWidget {
  const _TosPageBodyWigdet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: FediPadding.allBigPadding,
        child: SingleChildScrollView(
          child: FutureBuilder<String>(
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
    );
  }
}

void goToTosPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const TosPage()),
  );
}
