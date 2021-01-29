import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/widgets.dart';

class ChatSelectionShareActionButtonWidget extends StatelessWidget {
  const ChatSelectionShareActionButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediIconButton(
      icon: Icon(FediIcons.share),
      color: IFediUiColorTheme.of(context).darkGrey,
      onPressed: () {},
    );
  }
}
