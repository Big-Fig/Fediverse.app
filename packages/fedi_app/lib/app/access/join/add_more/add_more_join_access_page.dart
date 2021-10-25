import 'package:fedi_app/app/access/join/join_access_bloc_impl.dart';
import 'package:fedi_app/app/access/join/join_access_widget.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_dismiss_icon_button.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMoreJoinAccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: IFediUiColorTheme.of(context).primaryDark,
        appBar: FediPageTitleAppBar(
          title: S.of(context).app_auth_instance_join_new_title,
          leading: const FediDismissIconButton(),
        ),
        body: const SafeArea(
          child: JoinAccessWidget(),
        ),
      );

  const AddMoreJoinAccessPage({
    Key? key,
  }) : super(key: key);
}

void goToAddMoreJoinUnifediApiAccessPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (context) => JoinAccessBloc.provideToContext(
        context,
        isFromScratch: false,
        child: const AddMoreJoinAccessPage(),
      ),
    ),
  );
}
