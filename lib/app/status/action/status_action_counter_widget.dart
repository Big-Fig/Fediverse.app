import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/ui/callback/on_click_ui_callback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusActionCounterWidget extends StatelessWidget {
  final OnClickUiCallback onClick;

  const StatusActionCounterWidget({
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    var value = Provider.of<int>(context);
    return InkWell(
        onTap: () {
          onClick(context);
        },
        child: Padding(
          padding: const EdgeInsets.only(
            right: 4.0,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 10),
            child: Text(
              value == 0 ? "" : value.toString(),
              style: IFediUiTextTheme.of(context).smallShortDarkGrey,
            ),
          ),
        ),
      );
  }
}
