import 'package:fedi/app/auth/instance/join/join_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/join/join_auth_instance_bloc_impl.dart';
import 'package:fedi/app/auth/instance/join/join_auth_instance_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_dismiss_icon_button.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMoreJoinAuthInstancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IFediUiColorTheme.of(context).primaryDark,
      appBar: FediSubPageTitleAppBar(
          title: S.of(context).app_auth_instance_join_new_title,
          leading: const FediDismissIconButton()),
      body: SafeArea(
        child: JoinAuthInstanceWidget(
          isFromScratch: false,
        ),
      ),
    );
  }

  const AddMoreJoinAuthInstancePage();
}

void goToAddMoreJoinAuthInstancePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<IJoinAuthInstanceBloc>(
            create: (context) => JoinAuthInstanceBloc(),
            child: AddMoreJoinAuthInstancePage())),
  );
}
