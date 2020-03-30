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
        if (mode == LoadStatus.idle) {
          body = Text("");
        } else if (mode == LoadStatus.loading) {
          body = CircularProgressIndicator();
        } else if (mode == LoadStatus.failed) {
          body = Text(
            AppLocalizations.of(context).tr("profile.other.update"
                ".failed"),
          );
        } else {
          body = Text(
            AppLocalizations.of(context).tr("profile.other.update"
                ".no_more_data"),
          );
        }
        return Container(
          height: 55.0,
          child: Center(child: body),
        );
      },
    );
  }
}
