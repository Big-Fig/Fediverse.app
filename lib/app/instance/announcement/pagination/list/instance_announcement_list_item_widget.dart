import 'package:fedi/app/instance/announcement/instance_announcement_bloc.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger('instanceAnnouncement_list_item_widget.dart');

class InstanceAnnouncementListItemWidget extends StatelessWidget {
  const InstanceAnnouncementListItemWidget();

  @override
  Widget build(BuildContext context) {
    var instanceAnnouncementBloc = IInstanceAnnouncementBloc.of(context);

    _logger.finest(() => 'build ${instanceAnnouncementBloc.remoteId}');

    return Padding(
      padding: FediPadding.allBigPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(instanceAnnouncementBloc.content),
          // const _InstanceAnnouncementListItemPhraseWidget(),
          // const _InstanceAnnouncementListItemExpiredWidget(),
        ],
      ),
    );
  }
}
