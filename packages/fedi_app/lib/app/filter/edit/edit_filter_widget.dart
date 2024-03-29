import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_button_builder_widget.dart';
import 'package:fedi_app/app/filter/edit/edit_filter_bloc.dart';
import 'package:fedi_app/app/filter/form/filter_form_widget.dart';
import 'package:fedi_app/app/ui/button/text/with_border/fedi_transparent_text_button_with_border.dart';
import 'package:fedi_app/app/ui/description/fedi_note_description_widget.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditFilterWidget extends StatelessWidget {
  const EditFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editFilterBloc = IEditFilterBloc.of(context);

    return ListView(
      children: <Widget>[
        const _EditFilterDescriptionWidget(),
        const FilterFormWidget(),
        if (editFilterBloc.isPossibleToDelete)
          const Padding(
            padding: FediPadding.allBigPadding,
            child: _EditFilterDeleteButton(),
          ),
      ],
    );
  }
}

class _EditFilterDescriptionWidget extends StatelessWidget {
  const _EditFilterDescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediNoteDescriptionWidget(
        S.of(context).app_filter_edit_description,
      );
}

class _EditFilterDeleteButton extends StatelessWidget {
  const _EditFilterDeleteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editFilterBloc = IEditFilterBloc.of(context);

    return UnifediAsyncOperationButtonBuilderWidget(
      asyncButtonAction: () async {
        await editFilterBloc.deleteList();
        Navigator.of(context).pop();
      },
      builder: (context, onPressed) => FediTransparentTextButtonWithBorder(
        S.of(context).app_filter_edit_action_delete,
        expanded: false,
        onPressed: onPressed,
        color: IFediUiColorTheme.of(context).error,
      ),
    );
  }
}
