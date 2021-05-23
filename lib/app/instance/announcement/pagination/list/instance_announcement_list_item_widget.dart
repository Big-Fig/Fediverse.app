import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/html/html_text_bloc.dart';
import 'package:fedi/app/html/html_text_bloc_impl.dart';
import 'package:fedi/app/html/html_text_model.dart';
import 'package:fedi/app/html/html_text_widget.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_bloc.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InstanceAnnouncementListItemWidget extends StatelessWidget {
  const InstanceAnnouncementListItemWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: FediPadding.allBigPadding,
      child: Row(
        children: [
          Expanded(
            child: const _InstanceAnnouncementListItemContentWidget(),
          ),
          const _InstanceAnnouncementListItemWidget(),
        ],
      ),
    );
  }
}

class _InstanceAnnouncementListItemWidget extends StatelessWidget {
  const _InstanceAnnouncementListItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceAnnouncementBloc = IInstanceAnnouncementBloc.of(context);
    return FediIconButton(
      icon: Icon(
        FediIcons.delete,
        color: IFediUiColorTheme.of(context).darkGrey,
      ),
      onPressed: () {
        PleromaAsyncOperationHelper.performPleromaAsyncOperation(
          context: context,
          asyncCode: () async {
            await instanceAnnouncementBloc.dismiss();
          },
        );
      },
    );
  }
}

class _InstanceAnnouncementListItemContentWidget extends StatelessWidget {
  const _InstanceAnnouncementListItemContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    var fediUiTextTheme = IFediUiTextTheme.of(context);

    var textStyle = fediUiTextTheme.bigTallDarkGrey;

    return DisposableProxyProvider<IInstanceAnnouncement, IHtmlTextBloc>(
      update: (context, value, previous) {
        var htmlTextInputData = HtmlTextInputData(
          input: value.content,
          emojis: null,
        );

        if (previous?.inputData == htmlTextInputData) {
          return previous!;
        } else {
          return HtmlTextBloc(
            inputData: htmlTextInputData,
            settings: HtmlTextSettings(
              color: textStyle.color,
              lineHeight: textStyle.height,
              fontSize: textStyle.fontSize,
              textOverflow: TextOverflow.ellipsis,
              linkColor: fediUiColorTheme.primary,
              fontWeight: FontWeight.normal,
              drawNewLines: false,
              textMaxLines: null,
              textScaleFactor: 1.0,
            ),
          );
        }
      },
      child: const HtmlTextWidget(),
    );
  }
}
