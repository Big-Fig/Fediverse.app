import 'package:fedi/app/chat/avatar/chat_avatar_widget.dart';
import 'package:fedi/app/chat/title/chat_title_widget.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPageAppBarBodyWidget extends StatelessWidget {
  const ChatPageAppBarBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ChatAvatarWidget(baseAvatarSize: 36),
        const FediBigHorizontalSpacer(),
        ChatTitleWidget(
          textStyle: IFediUiTextTheme.of(context).bigShortBoldDarkGrey,
        ),
      ],
    );
  }
}
