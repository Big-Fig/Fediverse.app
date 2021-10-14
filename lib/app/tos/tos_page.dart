import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/material.dart';

class TosPage extends StatelessWidget {
  const TosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediPageTitleAppBar(
          title: S.of(context).app_tos_title,
        ),
        body: const _TosPageBodyWidget(),
      );
}

class _TosPageBodyWidget extends StatelessWidget {
  const _TosPageBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Padding(
          padding: FediPadding.allBigPadding,
          child: SingleChildScrollView(
            child: FutureBuilder<String>(
              // TODO: Should be localized
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/terms/terms.rtf'),
              builder: (context, snapshot) => Text(
                snapshot.data ?? '',
                style: IFediUiTextTheme.of(context).mediumShortDarkGrey,
                softWrap: true,
              ),
            ),
          ),
        ),
      );
}

void goToTosPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (context) => const TosPage(),
    ),
  );
}
