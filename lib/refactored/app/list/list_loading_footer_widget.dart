import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListLoadingFooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (BuildContext context, LoadStatus mode) {
        Widget body;

        switch (mode) {
          case LoadStatus.idle:
            body = Text("");
            break;
          case LoadStatus.canLoading:
            body = Text(
              AppLocalizations.of(context).tr("list.loading.state.can_loading"),
            );
            break;
          case LoadStatus.loading:
            body = CircularProgressIndicator();
            break;
          case LoadStatus.noMore:
            body = Text(
              AppLocalizations.of(context).tr("list.loading.state"
                  ".no_more_data"),
            );
            break;
          case LoadStatus.failed:
            body = Text(
              AppLocalizations.of(context).tr("list.loading.state.failed"),
            );
            break;
        }

        return Container(
          height: 55.0,
          child: Center(child: body),
        );
      },
    );
  }
}
