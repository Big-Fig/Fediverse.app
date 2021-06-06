import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/share/income/handler/income_share_handler_bloc.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_chooser_dialog.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';

final _logger = Logger('income_share_instance_chooser_dialog.dart');

Future showIncomeShareInstanceChooserDialog(
  BuildContext context, {
  required IIncomeShareHandlerBloc incomeShareHandlerBloc,
  required List<AuthInstance> authInstanceList,
}) async {
  _logger.finest(() => 'showIncomeShareInstanceChooserDialog');
  var chosenAuthInstance = await showFediChooserDialog<AuthInstance>(
    context: context,
    title: S.of(context).app_share_income_instance_choose_title,
    actions: authInstanceList
        .map(
          (authInstance) => DialogAction(
            icon: FediIcons.instance,
            label: authInstance.userAtHost,
            onAction: (context) {
              Navigator.of(context).pop(authInstance);
            },
          ),
        )
        .toList(),
  );

  if (chosenAuthInstance != null) {
    await incomeShareHandlerBloc.chooseInstance(chosenAuthInstance);
  } else {
    await incomeShareHandlerBloc.reset();
  }
}
