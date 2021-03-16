import 'package:fedi/app/filter/edit/edit_filter_app_bar_save_action_widget.dart';
import 'package:fedi/app/filter/edit/edit_filter_bloc_impl.dart';
import 'package:fedi/app/filter/edit/edit_filter_widget.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditFilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_filter_edit_title,
        actions: <Widget>[
          const EditFilterAppBarSaveActionWidget(),
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

  const EditFilterPage();
}

void goToEditFilterPage({
  required BuildContext context,
  required IFilter? filter,
  required Function(IFilter filter) onSubmit,
  required VoidCallback onDelete,
}) {
  Navigator.push(
    context,
    createEditFilterPageRoute(
      context: context,
      filter: filter,
      onSubmit: onSubmit,
      onDelete: onDelete,
    ),
  );
}

MaterialPageRoute createEditFilterPageRoute({
  required BuildContext context,
  required IFilter? filter,
  required Function(IFilter filter) onSubmit,
  required VoidCallback onDelete,
}) {
  return MaterialPageRoute(
    builder: (context) => EditFilterBloc.provideToContext(
      context,
      onSubmit: onSubmit,
      onDelete: onDelete,
      child: const EditFilterPage(),
      initialValue: filter,
    ),
  );
}
