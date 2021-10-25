import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_button_builder_widget.dart';
import 'package:fedi_app/app/status/action/status_action_counter_widget.dart';
import 'package:fedi_app/app/status/reblog/status_reblog_account_list_page.dart';
import 'package:fedi_app/app/status/status_bloc.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusReblogActionWidget extends StatelessWidget {
  const StatusReblogActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: const <Widget>[
          _StatusReblogActionButtonWidget(),
          _StatusReblogActionCounterWidget(),
        ],
      );
}

class _StatusReblogActionCounterWidget extends StatelessWidget {
  const _StatusReblogActionCounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);

    return StreamBuilder<int?>(
      stream: statusBloc.reblogPlusOriginalReblogsCountStream,
      builder: (context, snapshot) {
        var reblogsCount = snapshot.data;

        if (reblogsCount == null) {
          return const SizedBox.shrink();
        }

        return Provider<int>.value(
          value: reblogsCount,
          child: const StatusActionCounterWidget(
            onClick: _onCounterClick,
          ),
        );
      },
    );
  }
}

void _onCounterClick(BuildContext context) {
  var statusBloc = IStatusBloc.of(context, listen: false);
  goToStatusReblogAccountListPage(context, statusBloc.status);
}

class _StatusReblogActionButtonWidget extends StatelessWidget {
  const _StatusReblogActionButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);

    return StreamBuilder<bool?>(
      stream: statusBloc.rebloggedStream,
      initialData: statusBloc.reblogged,
      builder: (context, snapshot) {
        var reblogged = snapshot.data;

        return UnifediAsyncOperationButtonBuilderWidget(
          showProgressDialog: false,
          builder: (context, onPressed) => FediIconButton(
            iconSize: FediSizes.bigIconSize,
            color: reblogged!
                ? IFediUiColorTheme.of(context).primary
                : IFediUiColorTheme.of(context).darkGrey,
            icon: const Icon(FediIcons.reply),
            onPressed: onPressed,
          ),
          asyncButtonAction: statusBloc.toggleReblog,
        );
      },
    );
  }
}
