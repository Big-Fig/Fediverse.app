import 'package:fedi/app/instance/instance_bloc.dart';
import 'package:fedi/app/instance/public_timeline/instance_public_timeline_page_bloc.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:fedi/app/timeline/settings/edit/edit_timeline_settings_dialog.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/timeline/type/timeline_type_model.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InstancePublicTimelinePageAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const InstancePublicTimelinePageAppBarWidget();

  @override
  Widget build(BuildContext context) {
    var instanceBloc = IInstanceBloc.of(context);

    return FediPageTitleAppBar(
      centerTitle: false,
      title: S.of(context).app_instance_details_title(
            instanceBloc.instanceUriDomain,
          ),
      actions: <Widget>[
        const _InstancePublicTimelinePageAppBarSettingsActionWidget(),
      ],
    );
  }

  @override
  Size get preferredSize => FediPageTitleAppBar.calculatePreferredSize();
}

class _InstancePublicTimelinePageAppBarSettingsActionWidget
    extends StatelessWidget {
  const _InstancePublicTimelinePageAppBarSettingsActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instancePublicTimelinePageBloc =
        IInstancePublicTimelinePageBloc.of(context);
    var instanceLocation = instancePublicTimelinePageBloc.instanceLocation;

    var instanceBloc = IInstanceBloc.of(context);

    return FediIconButton(
      icon: Icon(
        FediIcons.settings,
        color: IFediUiColorTheme.of(context).darkGrey,
      ),
      onPressed: () {
        var timelineLocalPreferenceBloc = ITimelineLocalPreferenceBlocOld.of(
          context,
          listen: false,
        );
        var timeline = timelineLocalPreferenceBloc.value!;

        showEditTimelineLocalPreferenceBlocSettingsDialog(
          context: context,
          instanceLocation: instanceLocation,
          timelineLocalPreferenceBloc: timelineLocalPreferenceBloc,
          timeline: Timeline.byType(
            id: timeline.id,
            isPossibleToDelete: false,
            label: instanceBloc.instanceUriDomain,
            type: TimelineType.public,
            settings: timeline.settings,
          ),
          lockedSource: true,
          unifediApiInstance:
              Provider.of<IUnifediApiInstance>(context, listen: false),
        );
      },
    );
  }
}
