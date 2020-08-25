import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:flutter/material.dart';

class TosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: FediSubPageTitleAppBar(
        title: tr("app.tos.title"),
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
                  style: FediTextStyles.mediumShortDarkGrey,
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
