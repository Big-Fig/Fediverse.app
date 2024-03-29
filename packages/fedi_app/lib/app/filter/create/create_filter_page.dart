import 'package:fedi_app/app/filter/create/create_filter_bloc_impl.dart';
import 'package:fedi_app/app/filter/edit/edit_filter_app_bar_save_action_widget.dart';
import 'package:fedi_app/app/filter/edit/edit_filter_widget.dart';
import 'package:fedi_app/app/filter/filter_model.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateFilterPage extends StatelessWidget {
  const CreateFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediPageTitleAppBar(
          title: S.of(context).app_filter_create_title,
          actions: const [
            EditFilterAppBarSaveActionWidget(),
          ],
        ),
        body: const SafeArea(
          child: Padding(
            padding: FediPadding.allBigPadding,
            child: EditFilterWidget(),
          ),
        ),
      );
}

void goToCreateFilterPage({
  required BuildContext context,
  required Function(IFilter) onSubmit,
}) {
  Navigator.push(
    context,
    createCreateFilterPageRoute(
      context: context,
      onSubmit: onSubmit,
    ),
  );
}

MaterialPageRoute<void> createCreateFilterPageRoute({
  required BuildContext context,
  required Function(IFilter) onSubmit,
}) =>
    MaterialPageRoute<void>(
      builder: (context) => CreateFilterBloc.provideToContext(
        context,
        child: const CreateFilterPage(),
        onSubmit: onSubmit,
      ),
    );
