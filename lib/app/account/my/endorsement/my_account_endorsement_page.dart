import 'package:fedi/app/account/my/endorsement/my_account_endorsement_bloc_impl.dart';
import 'package:fedi/app/account/my/endorsement/my_account_endorsement_widget.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocalMyAccountEndorsementPage extends StatelessWidget {
  const LocalMyAccountEndorsementPage();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediPageTitleAppBar(
          title: S.of(context).app_account_my_endorsement_title,
        ),
        body: const SafeArea(
          child: MyAccountEndorsementWidget(),
        ),
      );
}

MaterialPageRoute<void> createMyAccountEndorsementPageRoute() =>
    MaterialPageRoute<void>(
      builder: (context) => MyAccountEndorsementBloc.provideToContext(
        context,
        child: const LocalMyAccountEndorsementPage(),
      ),
    );

void goToMyAccountEndorsementPage(BuildContext context) {
  Navigator.push(
    context,
    createMyAccountEndorsementPageRoute(),
  );
}
