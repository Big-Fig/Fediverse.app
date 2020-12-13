import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/filter/edit/edit_filter_bloc.dart';
import 'package:fedi/app/filter/form/filter_form_bloc.dart';
import 'package:fedi/app/filter/form/filter_form_widget.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_transparent_text_button_with_border.dart';
import 'package:fedi/app/ui/description/fedi_note_description_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditFilterWidget extends StatelessWidget {
  const EditFilterWidget();

  @override
  Widget build(BuildContext context) {
    var editFilterBloc = IEditFilterBloc.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const FilterFormWidget(),
        if (editFilterBloc.isPossibleToDelete)
          Padding(
            padding: FediPadding.allBigPadding,
            child: const _EditFilterDeleteButton(),
          ),
        _EditFilterAccountDescriptionWidget(),
        Expanded(
          child: const _EditFilterBodyWidget(),
        ),
      ],
    );
  }
}

class _EditFilterAccountDescriptionWidget extends StatelessWidget {
  const _EditFilterAccountDescriptionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediNoteDescriptionWidget(
        S.of(context).app_filter_edit_description,
      );
}

class _EditFilterDeleteButton extends StatelessWidget {
  const _EditFilterDeleteButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editFilterBloc = IEditFilterBloc.of(context);
    return PleromaAsyncOperationButtonBuilderWidget(
      asyncButtonAction: () async {
        await editFilterBloc.deleteList();
        Navigator.of(context).pop();
      },
      builder: (context, onPressed) => FediTransparentTextButtonWithBorder(
          S.of(context).app_filter_edit_action_delete,
          expanded: false,
          onPressed: onPressed,
          color: IFediUiColorTheme.of(context).error),
    );
  }
}

class _EditFilterBodyWidget extends StatelessWidget {
  const _EditFilterBodyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IEditFilterBloc, IFilterFormBloc>(
      update: (BuildContext context, value, _) => value.filterFormBloc,
      child: const FilterFormWidget(),
    );
  }
}
