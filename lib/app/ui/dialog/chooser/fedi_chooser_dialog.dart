import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:flutter/cupertino.dart';

void showFediChooserDialog(
    {@required BuildContext context,
    @required String title,
    String subTitle,
    @required List<DialogAction> actions,
    bool cancelable = true}) {
  return showFediModalBottomSheetDialog(
      context: context,
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(title),
          if (subTitle != null) Text(subTitle),
          ...actions.map((action) => Text(action.label)).toList()
        ],
      ));
}
