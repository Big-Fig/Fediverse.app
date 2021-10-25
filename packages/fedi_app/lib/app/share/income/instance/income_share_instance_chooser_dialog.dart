import 'package:fedi_app/app/share/income/handler/income_share_handler_bloc.dart';
import 'package:fedi_app/app/ui/dialog/chooser/fedi_chooser_dialog.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/dialog/dialog_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger = Logger('income_share_instance_chooser_dialog.dart');

Future<void> showIncomeShareInstanceChooserDialog(
  BuildContext context, {
  required IIncomeShareHandlerBloc incomeShareHandlerBloc,
  required List<UnifediApiAccess> authInstanceList,
}) async {
  _logger.finest(() => 'showIncomeShareInstanceChooserDialog');
  var chosenUnifediApiAccess = await showFediChooserDialog<UnifediApiAccess>(
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

  if (chosenUnifediApiAccess != null) {
    await incomeShareHandlerBloc.chooseInstance(chosenUnifediApiAccess);
  } else {
    await incomeShareHandlerBloc.reset();
  }
}
