import 'package:fedi/app/status/action/status_action_counter_widget.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/thread/status_thread_page.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusCommentActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const _StatusCommentActionButtonWidget(),
        const _StatusCommentActionCounterWidget(),
      ],
    );
  }

  const StatusCommentActionWidget();
}

class _StatusCommentActionCounterWidget extends StatelessWidget {
  const _StatusCommentActionCounterWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);
    return StreamBuilder<int>(
        stream: statusBloc.repliesCountStream,
        builder: (context, snapshot) {
          var repliesCount = snapshot.data;
          if (repliesCount == null) {
            return const SizedBox.shrink();
          }

          return Provider<int>.value(
            value: repliesCount,
            child: StatusActionCounterWidget(
              onClick: _onActionClick,
            ),
          );
        });
  }
}

void _onActionClick(BuildContext context) {
  var statusBloc = IStatusBloc.of(context, listen: false);
  return goToStatusThreadPage(
    context,
    status: statusBloc.status,
    initialMediaAttachment: null,
  );
}

class _StatusCommentActionButtonWidget extends StatelessWidget {
  const _StatusCommentActionButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediIconButton(
        color: IFediUiColorTheme.of(context).darkGrey,
        iconSize: FediSizes.bigIconSize,
        icon: Icon(FediIcons.message),
        onPressed: () {
          _onActionClick(context);
        },
      );
}
